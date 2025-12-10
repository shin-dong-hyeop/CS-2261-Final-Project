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
#include "background2.h"
#include "background3.h"
// #include "game.h"
#include "start.h"
#include "instruction.h"
#include "pause.h"
#include "lose.h"
#include "win.h"
//#include "digitalSound.h"
//#include "startMusic.h"
//#include "game1Music.h"
//#include "game2Music.h"
//#include "game3Music.h"
//#include "winMusic.h"

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


enum {START, INSTRUCTIONS, GAME1, GAME2, GAME3, PAUSE, WIN, LOSE};
int state;
int lives = 3;
int paused = 0;
int hOff = 0;
int vOff = 0;
int savedHOff = 0;
int savedVOff = 0;
extern int level;
SPRITE player;

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
    setupSounds();

    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    // Set up game BGs (used in game1)
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_SIZE_WIDE | BG_4BPP; // Foreground
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE | BG_4BPP; // Background

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITE_PAL, 256);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    goToStart();

}

void goToStart() {
    lives = 3;
    level = 1;
    paused = 0;
    playSoundA(startMusic_data, startMusic_length, 1);
    state = START;
}

void start() {
    REG_DISPCTL = BG_ENABLE(1);
    REG_BG1HOFF = 0;

    waitForVBlank();
    DMANow(3, startPal, BG_PALETTE, 256);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[28], startMapLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
}

void goToInstructions() {
    state = INSTRUCTIONS;
}
void instructions() {
    REG_DISPCTL = BG_ENABLE(1);
    REG_BG1HOFF = 0;

    waitForVBlank();
    DMANow(3, instructionPal, BG_PALETTE, 256);
    DMANow(3, instructionTiles, &CHARBLOCK[0], instructionTilesLen / 2);
    DMANow(3, instructionMap, &SCREENBLOCK[28], instructionMapLen / 2);
    

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        hOff = savedHOff;
        vOff = savedVOff;
        if (level == 1){
            goToGame1();
        } else if (level == 2)  {
            goToGame2();
        } else {
            goToGame3();
        }
        paused = 0;
    }
}

void goToGame1() {
    state = GAME1;

    REG_DISPCTL = BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    waitForVBlank();
    DMANow(3, background1Pal, BG_PALETTE, 256);
    DMANow(3, background1Tiles, &CHARBLOCK[0], background1TilesLen / 2);
    DMANow(3, background1Map, &SCREENBLOCK[28], background1MapLen / 2);
    
    //DMANow(3, map1Pal, BG_PALETTE, 256);
    DMANow(3, map1Tiles, &CHARBLOCK[1], map1TilesLen / 2);
    DMANow(3, map1Map, &SCREENBLOCK[30], map1MapLen / 2);
    
    if (!paused) {
        level = 1;
        initializePlayer();
        initializePet1();
        playSoundA(game1Music_data, game1Music_length, 1);
    }
}

void game1() {
    updateGame1();
    drawGame1();

    REG_BG1HOFF = hOff / 2; 
    REG_BG0HOFF = hOff;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToInstructions();
    }
    if (lives == 0) {
        goToLose();
    }
}


void goToGame2() {
    REG_DISPCTL = BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    waitForVBlank();
    DMANow(3, background2Pal, BG_PALETTE, 256);
    DMANow(3, background2Tiles, &CHARBLOCK[0], background2TilesLen / 2);
    DMANow(3, background2Map, &SCREENBLOCK[28], background2MapLen / 2);
    
    // DMANow(3, bgGameFrontPal, PALETTE, 256);
    DMANow(3, map2Tiles, &CHARBLOCK[1], map2TilesLen / 2);
    DMANow(3, map2Map, &SCREENBLOCK[30], map2MapLen / 2);

    if (!paused) {
        level = 2;
        initializePlayer();
        initializePet2();
        playSoundA(game2Music_data, game2Music_length, 1);
    }
    state = GAME2;
}

void game2() {
    updateGame2();
    drawGame2();

    REG_BG1HOFF = hOff / 2; 
    REG_BG0HOFF = hOff;

    waitForVBlank();
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToInstructions();
    }
    if (lives == 0) {
        goToLose();
    }
}

void goToGame3() {
    REG_DISPCTL = BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    waitForVBlank();
    DMANow(3, background3Pal, BG_PALETTE, 256);
    DMANow(3, background3Tiles, &CHARBLOCK[0], background3TilesLen / 2);
    DMANow(3, background3Map, &SCREENBLOCK[28], background3MapLen / 2);
    
    // DMANow(3, bgGameFrontPal, PALETTE, 256);
    DMANow(3, map3Tiles, &CHARBLOCK[1], map3TilesLen / 2);
    DMANow(3, map3Map, &SCREENBLOCK[30], map3MapLen / 2);

    if (!paused) {
        level = 3;
        initializePlayer();
        initializePet3();
        playSoundA(game3Music_data, game3Music_length, 1);
    }
    state = GAME3;
}

void game3() {
    updateGame3();
    drawGame3();

    REG_BG1HOFF = hOff / 2; 
    REG_BG0HOFF = hOff;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToInstructions();
    }
    if (lives == 0) {
        goToLose();
    }
}

void goToPause() {
    savedHOff = hOff;
    savedVOff = vOff;
    hOff = 0;
    vOff = 0;
    state = PAUSE;
    pauseSounds(); 
}

void pause() {
    paused = 1;

    REG_DISPCTL = BG_ENABLE(1);
    REG_BG1HOFF = 0;

    waitForVBlank();
    DMANow(3, pausePal, BG_PALETTE, 256);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen / 2);
    

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSounds();
        if (level == 1) {
            goToGame1();
        } else if (level == 2) {
            goToGame2();
        } else {
            goToGame3();
        }
        paused = 0;
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}


void goToLose() {
    state = LOSE;
    pauseSounds();
}

void lose() {
    state = LOSE;

    REG_DISPCTL = BG_ENABLE(1);
    REG_BG1HOFF = 0;

    waitForVBlank();
    DMANow(3, losePal, BG_PALETTE, 256);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);
    
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToWin() {
    state = WIN;
    playSoundA(winMusic_data, winMusic_length, 0);
}

void win() {
    state = WIN;
    REG_DISPCTL = BG_ENABLE(1);
    REG_BG1HOFF = 0;

    waitForVBlank();
    DMANow(3, winPal, BG_PALETTE, 256);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[28], winMapLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    if (BUTTON_HELD(BUTTON_A)) {
        // Change tile at (11,8) and (18,8) in SCREENBLOCK[28] to tile index 1
        SCREENBLOCK[28].tilemap[OFFSET(11, 8, 32)] = 1;
        SCREENBLOCK[28].tilemap[OFFSET(18, 8, 32)] = 1;
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}
