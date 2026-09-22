#include <stdlib.h>

#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "spritesheet.h"
#include "game.h"
#include "helper.h"
#include "analogSound.h"

#define MAPWIDTH 512
#define MAPHEIGHT 160

#define FIXED(n) ((n) * 256)
#define FROM_FIXED(n) ((n) / 256)
#define GRAVITY 96
#define JUMP_VELOCITY (-FIXED(5))
#define JUMP_RELEASE_VELOCITY (-FIXED(2))
#define TERMINAL_VELOCITY FIXED(7)
#define GLIDE_VELOCITY FIXED(1)
#define COYOTE_FRAMES 6
#define JUMP_BUFFER_FRAMES 6

#define PLAYER_LEFT_INSET 11
#define PLAYER_RIGHT_INSET 11
#define PLAYER_TOP_INSET 3

int hOff;
int vOff;
int level = 1;

extern OBJ_ATTR shadowOAM[128];
extern int lives;

typedef enum { RIGHT, LEFT } DIRECTION;

SPRITE player;
SPRITE banana;
SPRITE bear;
SPRITE crown;

static void loseLife(void);
static void drawLives(void);
static void updateAnimatedCollectible(SPRITE *item);

void initializePlayer(void) {
    player.x = 8;
    player.y = 78;
    player.currentFrame = 0;
    player.direction = RIGHT;
    player.oamIndex = 0;
    player.width = 32;
    player.height = 32;
    player.isAnimating = 0;
    player.numFrames = 4;
    player.timeUntilNextFrame = 10;
    player.dy = 0;
    player.grounded = 0;
    player.jumpCount = 0;
    player.maxJumps = 2;
    player.coyote = 0;
    player.jumpBuffer = 0;
    hOff = 0;
    vOff = 0;
}

int updatePlayer(void) {
    player.isAnimating = 0;

    int leftX = player.x + PLAYER_LEFT_INSET;
    int rightX = player.x + player.width - PLAYER_RIGHT_INSET - 1;
    int topY = player.y + PLAYER_TOP_INSET;
    int bottomY = player.y + player.height - 1;
    int feetY = bottomY - 1;

    if (BUTTON_HELD(BUTTON_LEFT) && player.x > 0 &&
        goThrough(leftX - 1, topY, level) &&
        goThrough(leftX - 1, feetY, level)) {
        player.x--;
        player.isAnimating = 1;
        player.direction = LEFT;
    }

    if (BUTTON_HELD(BUTTON_RIGHT) && player.x + player.width < MAPWIDTH &&
        goThrough(rightX + 1, topY, level) &&
        goThrough(rightX + 1, feetY, level)) {
        player.x++;
        player.isAnimating = 1;
        player.direction = RIGHT;
    }

    leftX = player.x + PLAYER_LEFT_INSET;
    rightX = player.x + player.width - PLAYER_RIGHT_INSET - 1;
    bottomY = player.y + player.height - 1;

    int onGround = !goThrough(leftX, bottomY + 1, level) ||
                   !goThrough(rightX, bottomY + 1, level);

    if (onGround) {
        player.grounded = 1;
        player.dy = 0;
        player.jumpCount = 0;
        player.coyote = COYOTE_FRAMES;
    } else {
        player.grounded = 0;
        if (player.coyote > 0) player.coyote--;
    }

    if (BUTTON_PRESSED(BUTTON_A)) {
        player.jumpBuffer = JUMP_BUFFER_FRAMES;
    } else if (player.jumpBuffer > 0) {
        player.jumpBuffer--;
    }

    if (player.jumpBuffer > 0) {
        if (player.grounded || player.coyote > 0) {
            player.dy = JUMP_VELOCITY;
            player.jumpCount = 1;
            player.grounded = 0;
            player.coyote = 0;
            player.jumpBuffer = 0;
            playAnalogSound(8);
        } else if (player.jumpCount < player.maxJumps) {
            player.dy = JUMP_VELOCITY;
            player.jumpCount++;
            player.jumpBuffer = 0;
            playAnalogSound(9);
        }
    }

    if (!BUTTON_HELD(BUTTON_A) && player.dy < JUMP_RELEASE_VELOCITY) {
        player.dy = JUMP_RELEASE_VELOCITY;
    }

    player.dy += GRAVITY;
    if (player.dy > TERMINAL_VELOCITY) player.dy = TERMINAL_VELOCITY;

    // R is an optional glide assist. Its one-pixel-per-frame fall cap makes
    // the effect obvious without disabling hazards or solid collision.
    if (BUTTON_HELD(BUTTON_RSHOULDER) && player.dy > GLIDE_VELOCITY) {
        player.dy = GLIDE_VELOCITY;
    }

    int steps = abs(FROM_FIXED(player.dy));
    int verticalDirection = (player.dy > 0) - (player.dy < 0);

    for (int i = 0; i < steps && verticalDirection != 0; i++) {
        int nextY = player.y + verticalDirection;
        int probeY = verticalDirection > 0
            ? nextY + player.height - 1
            : nextY + PLAYER_TOP_INSET;

        if (!goThrough(leftX, probeY, level) ||
            !goThrough(rightX, probeY, level)) {
            player.dy = 0;
            if (verticalDirection > 0) {
                player.grounded = 1;
                player.jumpCount = 0;
                player.coyote = COYOTE_FRAMES;
            }
            break;
        }

        player.y = nextY;
    }

    if (checkCollisionLose(player.x, player.y) ||
        player.y + player.height >= MAPHEIGHT) {
        loseLife();
        return 0;
    }

    if (player.isAnimating) {
        player.timeUntilNextFrame--;
        if (player.timeUntilNextFrame <= 0) {
            player.currentFrame = (player.currentFrame + 1) % player.numFrames;
            player.timeUntilNextFrame = 10;
        }
    } else {
        player.currentFrame = 0;
    }

    hOff = player.x - (SCREENWIDTH - player.width) / 2;
    vOff = player.y - (SCREENHEIGHT - player.height) / 2;

    if (player.x < 0) player.x = 0;
    if (player.y < 0) player.y = 0;
    if (player.x + player.width > MAPWIDTH) player.x = MAPWIDTH - player.width;
    if (player.y + player.height > MAPHEIGHT) player.y = MAPHEIGHT - player.height;
    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
    if (vOff > MAPHEIGHT - SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;
    return 1;
}

static void loseLife(void) {
    playAnalogSound(17);
    lives--;
    if (lives <= 0) {
        goToLose();
    } else {
        initializePlayer();
    }
}

void drawPlayer(void) {
    shadowOAM[player.oamIndex].attr0 =
        ATTR0_Y(player.y - vOff) | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[player.oamIndex].attr1 =
        ATTR1_X(player.x - hOff) | ATTR1_MEDIUM;

    int tileRow = player.direction == RIGHT ? 0 : 4;
    shadowOAM[player.oamIndex].attr2 =
        ATTR2_TILEID(player.currentFrame * 4, tileRow) | ATTR2_PALROW(0);
}

static void initializeCollectible(SPRITE *item, int x, int y) {
    item->x = x;
    item->y = y;
    item->width = 16;
    item->height = 16;
    item->oamIndex = 1;
    item->currentFrame = 0;
    item->numFrames = 4;
    item->timeUntilNextFrame = 12;
    item->isAnimating = 1;
}

void initializeBanana(void) {
    initializeCollectible(&banana, 478, 97);
}

void initializeBear(void) {
    initializeCollectible(&bear, 470, 97);
}

void initializeCrown(void) {
    initializeCollectible(&crown, 488, 43);
}

static void updateAnimatedCollectible(SPRITE *item) {
    if (!item->isAnimating) return;

    item->timeUntilNextFrame--;
    if (item->timeUntilNextFrame <= 0) {
        item->currentFrame = (item->currentFrame + 1) % item->numFrames;
        item->timeUntilNextFrame = 12;
    }
}

void updateBanana(void) {
    updateAnimatedCollectible(&banana);
}

void updateBear(void) {
    updateAnimatedCollectible(&bear);
}

void updateCrown(void) {
    updateAnimatedCollectible(&crown);
}

void drawCollection(void) {
    SPRITE *item;
    int tileRow;

    if (level == 1) {
        item = &banana;
        tileRow = 8;
    } else if (level == 2) {
        item = &bear;
        tileRow = 10;
    } else {
        item = &crown;
        tileRow = 12;
    }

    shadowOAM[item->oamIndex].attr0 =
        ATTR0_Y(item->y - vOff) | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[item->oamIndex].attr1 =
        ATTR1_X(item->x - hOff) | ATTR1_SMALL;
    shadowOAM[item->oamIndex].attr2 =
        ATTR2_TILEID(item->currentFrame * 2, tileRow) | ATTR2_PALROW(0);
}

static void drawLives(void) {
    for (int i = 0; i < 3; i++) {
        int oamIndex = 2 + i;
        if (i < lives) {
            // Bob's artwork occupies a 32x32 animation cell, so the HUD uses
            // the full cell and overlaps only its transparent padding.
            shadowOAM[oamIndex].attr0 = ATTR0_Y(0) | ATTR0_SQUARE | ATTR0_REGULAR;
            shadowOAM[oamIndex].attr1 = ATTR1_X(4 + i * 20) | ATTR1_MEDIUM;
            shadowOAM[oamIndex].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
        } else {
            shadowOAM[oamIndex].attr0 = ATTR0_HIDE;
        }
    }
}

int winCondition(void) {
    SPRITE *item = level == 1 ? &banana : (level == 2 ? &bear : &crown);
    if (!checkCollisionSprite(player, *item)) return 0;

    playAnalogSound(16);
    if (level == 1) goToGame2();
    else if (level == 2) goToGame3();
    else goToWin();
    return 1;
}

void drawGame(void) {
    drawPlayer();
    drawCollection();
    drawLives();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    REG_BG1HOFF = hOff / 2;
    REG_BG1VOFF = vOff / 2;
}
