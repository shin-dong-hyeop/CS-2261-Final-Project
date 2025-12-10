#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "helper.h"
#include "tileset.h"
#include "spritesheet.h"
#include "map1.h"
#include "map2.h"
#include "map3.h"
#include "background1.h"
#include "game.h"
#include "start.h"
#include "instruction.h"
#include "pause.h"
#include "lose.h"
#include "win.h"

OBJ_ATTR shadowOAM[128];

void initialize();
void goToStart();
void start();
void goToInstructions();
void instructions();
void updateGame1();
void drawGame1();
void goToGame1();
void game1();
void goToGame2();
void game2();
void goToGame3();
void game3();
void goToPause();
void pause();
void goToLose();
void lose();
void goToWin();
void win();
void reportHud();


enum {START, INSTRUCTIONS, GAME1, GAME2, GAME3, PAUSE, WIN, LOSE};
int state;
int lives = 3;
int paused = 0;
int savedHOff = 0;
int savedVOff = 0;
extern int level;
extern int hOff;
extern int vOff;
extern SPRITE player;
static int reportedLevel = -1;
static int reportedLives = -1;

unsigned short oldButtons;
unsigned short buttons;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch(state) {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME1:
                game1();
                break;
            case GAME2:
                game2();
                break;
            case GAME3:
                game3();
                break;
            case WIN:
                win();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
        }
        DMANow(3, shadowOAM, OAM, 128 * 4);
    }    
}

void initialize() {
    mgba_open();
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | SPRITE_ENABLE | BG_ENABLE(0);
    REG_BG1CNT = BG_SCREENBLOCK(20) | BG_CHARBLOCK(0);
    REG_BG0CNT = BG_SCREENBLOCK(28) | BG_CHARBLOCK(1) | BG_SIZE_WIDE;

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITE_PAL, 256);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    goToStart();
}

void goToInstructions() {
    state = INSTRUCTIONS;
}

void instructions() {
    DMANow(3, instructionMap, &SCREENBLOCK [20], instructionMapLen / 2);
    DMANow(3, instructionPal, BG_PALETTE, instructionPalLen / 2);
    DMANow(3, instructionTiles, &CHARBLOCK[0], instructionTilesLen / 2);
    
    hideSprites();
    if (BUTTON_PRESSED(BUTTON_START)) {
        if (level == 1) {
            goToGame1();
        } else if (level == 2){
            goToGame2();
        } else {
            goToGame3();
        }
    }
}

void goToStart() {
    lives = 3;
    level = 1;
    state = START;
}

void start() {
    DMANow(3, startMap, &SCREENBLOCK[20], startMapLen / 2);
    DMANow(3, startPal, BG_PALETTE, startPalLen / 2);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    
    hideSprites();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
}

void goToGame1() {
    state = GAME1;
    DMANow(3, map1Map, &SCREENBLOCK[20], map1Len / 2);
    //DMANow(3, background1Map, &SCREENBLOCK[28], background1Len / 2);
    DMANow(3, tilesetPal, BG_PALETTE, tilesetPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);

    if (paused == 0) {
        lives = 3;
        level = 1;
        initializePlayer();
        initializeBanana();
    }
    paused = 0;
}

void game1() {
    updateGame1();
    drawGame1();
    reportHud();
    waitForVBlank();
    hOff = savedHOff;
    vOff = savedVOff;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToGame2() {
    DMANow(3, map2Map, &SCREENBLOCK[20], map2MapLen / 2);
    //DMANow(3, background1Map, &SCREENBLOCK[28], background1Len / 2);
    DMANow(3, tilesetPal, BG_PALETTE, tilesetPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);
    if (paused == 0) {
        lives = 3;
        level = 2;
        initializePlayer();
        initializeBear();
    }
    state = GAME2;
}

void game2() {
    updateGame2();
    drawGame2();
    reportHud();
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToGame3() {
    DMANow(3, map3Map, &SCREENBLOCK[20], map3Len / 2);
    //DMANow(3, background1Map, &SCREENBLOCK[28], background1Len / 2);
    DMANow(3, tilesetPal, BG_PALETTE, tilesetPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);
    if (paused == 0) {
        lives = 3;
        level = 3;
        initializePlayer();
        initializeCrown();
    }
    state = GAME3;
}

void game3() {
    updateGame3();
    drawGame3();
    reportHud();
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToPause() {
    savedHOff = hOff;
    savedVOff = vOff;
    hOff = 0;
    vOff = 0;
    state = PAUSE;
}

void pause() {
    paused = 1;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;
    waitForVBlank();
    DMANow(3, pausePal, BG_PALETTE, pausePalLen / 2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[20], pauseMapLen / 2);

    hideSprites();

    DMANow(3, shadowOAM, OAM, 128 * 4);
    if (BUTTON_PRESSED(BUTTON_START)) {
        if (level == 1) {
            goToGame1();
        } else if (level == 2){
            goToGame2();
        } else {
            goToGame3();
        }
        paused = 0;
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    } else if (BUTTON_PRESSED(BUTTON_A)){
        goToInstructions();
    }
}

void goToLose() {
    state = LOSE;
}

void lose() {
    waitForVBlank();
    DMANow(3, losePal, BG_PALETTE, losePalLen / 2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[20], loseMapLen / 2);

    hideSprites();

    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}


void goToWin() {
    state = WIN;
}

void win() {
    waitForVBlank();
    DMANow(3, winPal, BG_PALETTE, winPalLen / 2);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[20], winMapLen / 2);

    hideSprites();

    DMANow(3, shadowOAM, OAM, 128 * 4);
    
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
            goToStart();
    }
}

void reportHud() {
    if (reportedLevel != level || reportedLives != lives) {
        mgba_printf("Level: %d  Lives: %d", level, lives);
        reportedLevel = level;
        reportedLives = lives;
    }
}