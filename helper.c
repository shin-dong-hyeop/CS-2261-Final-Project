#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "tileset.h"
#include "spritesheet.h"
#include "game.h"
#include "collision1.h"
#include "collision2.h"
#include "collision3.h"
#include "map1.h"


#define COLLISIONWIDTH  512
#define COLLISIONHEIGHT 256
#define MAPWIDTH   32
#define MAPHEIGHT  32

#define COL_W 512
#define SOLID_IDX 1

extern SPRITE player;
extern int level;
extern int lives;

extern int hOff;
extern int vOff;

//collision map helper functions
unsigned char colorAt(int x, int y) {
    if (level == 1) {
        return ((unsigned char *)collision1Bitmap)[OFFSET(x, y, COLLISIONWIDTH)];
    } else if (level == 2) {
        return ((unsigned char *)collision2Bitmap)[OFFSET(x, y, COLLISIONWIDTH)];
    } else if (level == 3) {
        return ((unsigned char *)collision3Bitmap)[OFFSET(x, y, COLLISIONWIDTH)];
    } else {
        return 0;
    }
}


int goThrough(int x, int y, int level) {
    (void)level; // unused parameter

    if (x < 0 || x >= COLLISIONWIDTH || y < 0 || y >= COLLISIONHEIGHT) return 0;

    unsigned char tile = colorAt(x, y);
    return tile != 0;
}


unsigned short getTile(int x, int y) {
    int tileX = x / 8;
    int tileY = y / 8;

    if (tileX < 0 || tileX >= MAPWIDTH || tileY < 0 || tileY >= MAPHEIGHT) {
        return 0xFFFF;
    }
    return SCREENBLOCK[20].tilemap[tileY * 32 + tileX];
}


// check collision for specific block tile
int checkCollisionHardBlock(int x, int y) {
    return (getTile(x, y) == 0x0001) || (getTile(x, y) == 0x0002)  || (getTile(x, y) == 0x0003) ||
           (getTile(x + 8 - 1, y) == 0x0001) || (getTile(x + 8 - 1, y) == 0x0002) || (getTile(x + 8 - 1, y) == 0x0003)||
           (getTile(x, y + 8 - 1) == 0x0001) || (getTile(x, y + 8 - 1) == 0x0002)  || (getTile(x, y + 8 - 1) == 0x0003) ||
           (getTile(x + 8 - 1, y + 8 - 1) == 0x0001) || (getTile(x + 8 - 1, y + 8 - 1) == 0x0002) || (getTile(x + 8 - 1, y + 8 - 1) == 0x0003);
}

int checkCollisionTransparentBlock(int x, int y) {
    return (getTile(x, y) == 0x0000) ||
           (getTile(x + 8 - 1, y) == 0x0000) ||
           (getTile(x, y + 8 - 1) == 0x0000) ||
           (getTile(x + 8 - 1, y + 8 - 1) == 0x0000);
}


int checkCollisionLose(int x, int y) {
    // Check all four corners of the player's bounding box against hazard pixels
    // on the collision map (palette index 2). Using the collision map keeps
    // detection aligned with the solid/air layout instead of the visual
    // tilemap, preventing false positives while walking on normal ground.
    int left = x;
    int right = x + player.width - 1;
    int top = y;
    int bottom = y + player.height - 1;

    // Outside the collision map shouldn't be treated as a hazard.
    if (left < 0 || right >= COLLISIONWIDTH || top < 0 || bottom >= COLLISIONHEIGHT) return 0;

    return (colorAt(left, top) == 2) ||
           (colorAt(right, top) == 2) ||
           (colorAt(left, bottom) == 2) ||
           (colorAt(right, bottom) == 2);
}


int checkCollisionSprite(SPRITE a, SPRITE b) {
    return (a.x < b.x + b.width &&
            a.x + a.width > b.x &&
            a.y < b.y + b.height &&
            a.y + a.height > b.y);
}

void updateGame1() {
    updatePlayer();
    updateBanana();
    winCondition();
}

void drawGame1() {
    drawPlayer();
    drawCollection();
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}


void updateGame2() {
    updatePlayer();
    updateBear();
    winCondition();
}


void drawGame2() {
    drawPlayer();
    drawCollection();
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}

void updateGame3() {
    updatePlayer();
    updateCrown();
    winCondition();
}

void drawGame3() {
    drawPlayer();
    drawCollection();
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}
