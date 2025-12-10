#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "background1.h"
#include "tileset.h"
#include "spritesheet.h"
#include "game.h"
#include <stdlib.h>
#include "helper.h"

#define MAPWIDTH  512
#define MAPHEIGHT 160

// ---- Fixed-point helpers & physics ----
#define SHIFTUP(n)   ((n) << 8)
#define SHIFTDOWN(n) ((n) >> 8)
#define GRAVITY            SHIFTUP(1)     // 1 px/frame^2 (8.8 fixed-point)
#define TERMINALVELOCITY   SHIFTUP(10)    // max fall speed

// Polish
#define COYOTE_FRAMES       6             // jump grace after stepping off
#define JUMP_BUFFER_FRAMES  6             // store quick A taps

int hOff;
int vOff;

extern OBJ_ATTR shadowOAM[128];
int level = 1;

typedef enum {RIGHT, LEFT} DIRECTION;

SPRITE player;
SPRITE banana;
SPRITE bear;
SPRITE crown;

// -------- Player: initialize, update, draw --------
static int findGroundY(int x) {
    // Find the first empty pixel with solid ground directly beneath it, then
    // place the player's feet on that ledge. The collision maps use palette
    // index 0 for solid tiles.
    for (int y = 0; y < MAPHEIGHT - 1; y++) {
        if (colorAt(x, y) != 0 && colorAt(x, y + 1) == 0) {
            int groundedY = y - (player.height - 1);
            return groundedY < 0 ? 0 : groundedY;
        }
    }
    return 0;
}

void initializePlayer() {
    player.width = 32;
    player.height = 32;
    // Different maps have different spawn platforms; drop the player onto the
    // first safe ledge for that level instead of reusing the game 1 spawn.
    switch (level) {
    case 2:
        player.x = 112;
        break;
    case 3:
        player.x = 24;
        break;
    default:
        player.x = 8;
        break;
    }

    player.y = findGroundY(player.x);
    player.currentFrame = 0;
    player.direction = RIGHT;
    player.oamIndex = 0;
    player.isAnimating = 0;
    player.numFrames = 4;
    player.timeUntilNextFrame = 15;
    player.dy = 0;
    player.grounded = 0;
    player.jumpCount = 0;
    player.maxJumps = 2;
    hOff = 0;
    vOff = 0;
}

void updatePlayer() {
    player.isAnimating = 0;

    int leftX   = player.x + 11;
    int rightX  = player.x + player.width - 11;
    int topY    = player.y;
    int bottomY = player.y + player.height - 1;

    // ---- Horizontal  ----
    int feetY = bottomY - 1; // keep wall checks just above the floor to avoid snagging

    if (BUTTON_HELD(BUTTON_LEFT) && player.x > 0 &&
        goThrough(leftX - 1, topY, level) && goThrough(leftX - 1, feetY, level)) {
        mgba_printf("Left button held");
        player.x--;
        player.isAnimating = 1;
        player.direction = LEFT;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && (player.x + player.width) < MAPWIDTH &&
        goThrough(rightX + 1, topY, level) && goThrough(rightX + 1, feetY, level)) {
        player.x++;
        player.isAnimating = 1;
        player.direction = RIGHT;
    }

    // ---- Ground check ----
    int onGround = !goThrough(leftX, bottomY + 1, level) || !goThrough(rightX, bottomY + 1, level);
    if (onGround) {
        player.grounded = 1;
        player.dy = 0;
        player.jumpCount = 0;
    } else {
        player.grounded = 0;
    }

    // ---- Jump (impulse only) ----
    if (BUTTON_PRESSED(BUTTON_A) && (player.jumpCount < player.maxJumps)) {
        player.dy = -SHIFTUP(8);  
        player.jumpCount++;
        player.grounded = 0;
    }

    // ---- GRAVITY MUST RUN EVERY FRAME ----
    player.dy += GRAVITY;
    if (player.dy > TERMINALVELOCITY) player.dy = TERMINALVELOCITY;

    // ---- Vertical stepping (per-pixel) ----
    int steps = abs(SHIFTDOWN(player.dy));
    int direction = (player.dy > 0) ? 1 : (player.dy < 0 ? -1 : 0);

    for (int i = 0; i < steps && direction != 0; i++) {
        int nextY = player.y + direction;
        int nextBottomY = nextY + player.height - 1;

        if (!goThrough(leftX, nextBottomY, level) || !goThrough(rightX, nextBottomY, level)) {
            player.dy = 0;
            if (direction > 0) {        // landed
                player.grounded = 1;
                player.jumpCount = 0;
            }
            break;
        } else {
            player.y = nextY;

            // death/water check
            if (checkCollisionLose(player.x, player.y)) {
                lives--;
                if (lives <= 0) { goToLose(); } else { initializePlayer(); }
                return;
            }
        }
    }

    // Catch hazard overlaps even if the player stayed level this frame
    if (checkCollisionLose(player.x, player.y)) {
        lives--;
        if (lives <= 0) { goToLose(); } else { initializePlayer(); }
        return;
    }


    // ---- Animation & camera (unchanged) ----
    if (player.isAnimating) {
        --player.timeUntilNextFrame;
        if (player.timeUntilNextFrame <= 0) {
            player.currentFrame = (player.currentFrame + 1) % player.numFrames;
            player.timeUntilNextFrame = 15;
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
}


void drawPlayer() {
    shadowOAM[player.oamIndex].attr0 = ATTR0_Y(player.y - vOff) | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[player.oamIndex].attr1 = ATTR1_X(player.x - hOff) | ATTR1_MEDIUM;

    // Choose the spritesheet row. Each frame is 32x32 => 4 tiles wide & 4 tiles tall.
    // If your sheet has RIGHT frames on row 0 and LEFT on row 4, this matches your old code.
    int tileRow = (player.direction == RIGHT) ? 0 : 4;

    // Current frame across the row. 32x32 means stride of 4 tiles.
    shadowOAM[player.oamIndex].attr2 =
        ATTR2_TILEID(player.currentFrame * 4, tileRow) | ATTR2_PALROW(0);
}

// -------- collectibles (unchanged) --------
void initializeBanana() { 
    banana.x = 478; 
    banana.y = 97; 
    banana.width = 8; 
    banana.height = 8; 
    banana.oamIndex = 1; 
    banana.currentFrame = 0; 
    banana.numFrames = 4; 
    banana.timeUntilNextFrame = 15; 
    banana.isAnimating = 1; 

}
void initializeBear() { 
    bear.x = 470; 
    bear.y = 97; 
    bear.width = 8; 
    bear.height = 8; 
    bear.oamIndex = 1; 
    bear.currentFrame = 0; 
    bear.numFrames = 4; 
    bear.timeUntilNextFrame = 15; 
    bear.isAnimating = 1; 
}

void initializeCrown() { 
    crown.x = 488; 
    crown.y = 43; 
    crown.width = 8; 
    crown.height = 8; 
    crown.oamIndex = 1; 
    crown.currentFrame = 0; 
    crown.numFrames = 4; 
    crown.timeUntilNextFrame = 15; 
    crown.isAnimating = 1; 
}

void updateBanana() { 
    level = 1; 
    if (banana.isAnimating) { 
        --banana.timeUntilNextFrame; 
        if (banana.timeUntilNextFrame == 0) { 
            banana.currentFrame = (banana.currentFrame + 1) % banana.numFrames; banana.timeUntilNextFrame = 15; 
        } 
    } else { 
            banana.currentFrame = 0; 
        } 
    }
    void updateBear() { 
        level = 2; 
        if (bear.isAnimating) { 
            --bear.timeUntilNextFrame; 
            if (bear.timeUntilNextFrame == 0) { 
                bear.currentFrame = (bear.currentFrame + 1) % bear.numFrames; bear.timeUntilNextFrame = 15; 
            } 
        } else { 
            bear.currentFrame = 0; 
        } 
    }
    void updateCrown() { 
        level = 3; 
        if (crown.isAnimating) { 
            --crown.timeUntilNextFrame; 
            if (crown.timeUntilNextFrame == 0) { 
                crown.currentFrame = (crown.currentFrame + 1) % crown.numFrames; crown.timeUntilNextFrame = 15; 
            } 
        } else { 
            crown.currentFrame = 0; 
        } 
    }

void drawCollection() { 
    if (level == 1) { 
        shadowOAM[banana.oamIndex].attr0 = ATTR0_Y(banana.y - vOff) | ATTR0_SQUARE | ATTR0_REGULAR; 
        shadowOAM[banana.oamIndex].attr1 = ATTR1_X(banana.x - hOff) | ATTR1_SMALL; 
        shadowOAM[banana.oamIndex].attr2 = ATTR2_TILEID(banana.currentFrame * 2, 8);
    } else if (level == 2) { 
        shadowOAM[bear.oamIndex].attr0 = ATTR0_Y(bear.y - vOff) | ATTR0_SQUARE | ATTR0_REGULAR; 
        shadowOAM[bear.oamIndex].attr1 = ATTR1_X(bear.x - hOff) | ATTR1_SMALL; 
        shadowOAM[bear.oamIndex].attr2 = ATTR2_TILEID(bear.currentFrame * 2, 10);
    } else { 
        shadowOAM[crown.oamIndex].attr0 = ATTR0_Y(crown.y - vOff) | ATTR0_SQUARE | ATTR0_REGULAR; 
        shadowOAM[crown.oamIndex].attr1 = ATTR1_X(crown.x - hOff) | ATTR1_SMALL; 
        shadowOAM[crown.oamIndex].attr2 = ATTR2_TILEID(crown.currentFrame * 2, 12);
    }
}

int winCondition() {
    if (level == 1 && checkCollisionSprite(player, banana)) { goToGame2(); return 1; }
    else if (level == 2 && checkCollisionSprite(player, bear)) { goToGame3(); return 1; }
    else if (level == 3 && checkCollisionSprite(player, crown)) { goToWin(); return 1; }
    return 0;
}
