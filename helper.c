#include "gba.h"
#include "sprites.h"
#include "game.h"
#include "helper.h"
#include "collision1.h"
#include "collision2.h"
#include "collision3.h"

#define COLLISION_WIDTH 512
#define COLLISION_HEIGHT 256
#define PLAYER_LEFT_INSET 11
#define PLAYER_RIGHT_INSET 11
#define PLAYER_TOP_INSET 3

extern SPRITE player;
extern int level;

unsigned char colorAt(int x, int y) {
    if (x < 0 || x >= COLLISION_WIDTH || y < 0 || y >= COLLISION_HEIGHT) {
        return 0;
    }

    if (level == 1) {
        return ((const unsigned char *) collision1Bitmap)[OFFSET(x, y, COLLISION_WIDTH)];
    }
    if (level == 2) {
        return ((const unsigned char *) collision2Bitmap)[OFFSET(x, y, COLLISION_WIDTH)];
    }
    return ((const unsigned char *) collision3Bitmap)[OFFSET(x, y, COLLISION_WIDTH)];
}

int goThrough(int x, int y, int gameLevel) {
    (void) gameLevel;
    // Palette index 0 is solid, 1 is air, and 2 is a passable hazard.
    return colorAt(x, y) != 0;
}

int checkCollisionLose(int x, int y) {
    int left = x + PLAYER_LEFT_INSET;
    int right = x + player.width - PLAYER_RIGHT_INSET - 1;
    int top = y + PLAYER_TOP_INSET;
    int bottom = y + player.height - 1;
    int center = (left + right) / 2;

    return colorAt(left, top) == 2 ||
           colorAt(right, top) == 2 ||
           colorAt(left, bottom) == 2 ||
           colorAt(center, bottom) == 2 ||
           colorAt(right, bottom) == 2;
}

int checkCollisionSprite(SPRITE a, SPRITE b) {
    int aLeft = a.x + PLAYER_LEFT_INSET;
    int aRight = a.x + a.width - PLAYER_RIGHT_INSET;
    int aTop = a.y + PLAYER_TOP_INSET;

    return aLeft < b.x + b.width &&
           aRight > b.x &&
           aTop < b.y + b.height &&
           a.y + a.height > b.y;
}

static void updateCurrentGame(void (*updateItem)(void)) {
    if (!updatePlayer()) return;
    updateItem();
    winCondition();
}

void updateGame1(void) {
    updateCurrentGame(updateBanana);
}

void updateGame2(void) {
    updateCurrentGame(updateBear);
}

void updateGame3(void) {
    updateCurrentGame(updateCrown);
}

void drawGame1(void) {
    drawGame();
}

void drawGame2(void) {
    drawGame();
}

void drawGame3(void) {
    drawGame();
}
