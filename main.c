#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "helper.h"
#include "spritesheet.h"
#include "map1.h"
#include "map2.h"
#include "map3.h"
#include "background1.h"
#include "background2.h"
#include "background3.h"
#include "game.h"
#include "start.h"
#include "instruction.h"
#include "pause.h"
#include "lose.h"
#include "win.h"
#include "digitalSound.h"
#include "startMusic.h"
#include "game1Music.h"
#include "game2Music.h"
#include "game3Music.h"
#include "winMusic.h"

OBJ_ATTR shadowOAM[128];

enum {
    START,
    INSTRUCTIONS,
    GAME1,
    GAME2,
    GAME3,
    PAUSE,
    WIN,
    LOSE
};

int state;
int lives = 3;
int paused;
int savedHOff;
int savedVOff;
int resumeAfterInstructions;

extern int hOff;
extern int vOff;
extern int level;

unsigned short oldButtons;
unsigned short buttons;

static void initialize(void);
static void loadStillScreen(const unsigned short *palette, const unsigned short *tiles,
                            unsigned int tilesLen, const unsigned short *map,
                            unsigned int mapLen);
static void resumeCurrentLevel(void);
static void showGameInstructions(void);

void goToStart(void);
void start(void);
void goToInstructions(void);
void instructions(void);
void goToGame1(void);
void game1(void);
void goToGame2(void);
void game2(void);
void goToGame3(void);
void game3(void);
void goToPause(void);
void pause(void);
void goToLose(void);
void lose(void);
void goToWin(void);
void win(void);

int main(void) {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch (state) {
            case START:        start();        break;
            case INSTRUCTIONS: instructions(); break;
            case GAME1:        game1();        break;
            case GAME2:        game2();        break;
            case GAME3:        game3();        break;
            case PAUSE:        pause();        break;
            case WIN:          win();          break;
            case LOSE:         lose();         break;
        }

        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128 * 4);
    }
}

static void initialize(void) {
    mgba_open();
    setupSounds();

    // BG1 can use character blocks 0-1 for its larger forest tilesets.
    // BG0 starts at character block 2 so the level tiles never overwrite them.
    REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(30) | BG_SIZE_WIDE | BG_4BPP;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE | BG_4BPP;

    DMANow(3, (void *) spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, (void *) spritesheetPal, SPRITE_PAL, 256);

    buttons = REG_BUTTONS;
    oldButtons = buttons;
    hideSprites();
    goToStart();
}

static void loadStillScreen(const unsigned short *palette, const unsigned short *tiles,
                            unsigned int tilesLen, const unsigned short *map,
                            unsigned int mapLen) {
    REG_DISPCTL = MODE(0) | BG_ENABLE(1);
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    waitForVBlank();
    DMANow(3, (void *) palette, BG_PALETTE, 256);
    DMANow(3, (void *) tiles, &CHARBLOCK[0], tilesLen / 2);
    DMANow(3, (void *) map, &SCREENBLOCK[28], mapLen / 2);
    hideSprites();
}

void goToStart(void) {
    stopSounds();
    lives = 3;
    level = 1;
    paused = 0;
    resumeAfterInstructions = 0;
    hOff = 0;
    vOff = 0;
    loadStillScreen(startPal, startTiles, startTilesLen, startMap, startMapLen);
    playSoundA(startMusic_data, startMusic_length, 1);
    state = START;
}

void start(void) {
    if (BUTTON_PRESSED(BUTTON_START)) {
        resumeAfterInstructions = 0;
        goToInstructions();
    }
}

void goToInstructions(void) {
    loadStillScreen(instructionPal, instructionTiles, instructionTilesLen,
                    instructionMap, instructionMapLen);
    state = INSTRUCTIONS;
}

void instructions(void) {
    if (BUTTON_PRESSED(BUTTON_START)) {
        if (resumeAfterInstructions) {
            resumeCurrentLevel();
        } else {
            stopSounds();
            goToGame1();
        }
    } else if (BUTTON_PRESSED(BUTTON_B) && !resumeAfterInstructions) {
        goToStart();
    }
}

static void loadGameBackground(const unsigned short *palette,
                               unsigned int paletteLen,
                               const unsigned short *backgroundTiles,
                               unsigned int backgroundTilesLen,
                               const unsigned short *backgroundMap,
                               unsigned int backgroundMapLen,
                               const unsigned short *levelTiles,
                               unsigned int levelTilesLen,
                               const unsigned short *levelMap,
                               unsigned int levelMapLen,
                               const unsigned short *levelPalette) {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    waitForVBlank();
    unsigned int backgroundColors = paletteLen / 2;
    if (backgroundColors > 16) backgroundColors = 16;
    DMANow(3, (void *) palette, BG_PALETTE, backgroundColors);
    DMANow(3, (void *) levelPalette, BG_PALETTE + 16, 16);
    DMANow(3, (void *) backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, (void *) backgroundMap, &SCREENBLOCK[28], backgroundMapLen / 2);
    DMANow(3, (void *) levelTiles, &CHARBLOCK[2], levelTilesLen / 2);
    DMANow(3, (void *) levelMap, &SCREENBLOCK[30], levelMapLen / 2);

    // Foreground art has its own 16-color palette in row 1.
    volatile unsigned short *levelMapVram = SCREENBLOCK[30].tilemap;
    for (unsigned int i = 0; i < levelMapLen / 2; i++) {
        levelMapVram[i] |= TILEMAP_ENTRY_PALROW(1);
    }
}

void goToGame1(void) {
    int wasPaused = paused;
    loadGameBackground(background1Pal, background1PalLen,
                       background1Tiles, background1TilesLen,
                       background1Map, background1MapLen,
                       map1Tiles, map1TilesLen, map1Map, map1MapLen, map1Pal);

    if (!wasPaused) {
        level = 1;
        initializePlayer();
        initializeBanana();
        playSoundA(game1Music_data, game1Music_length, 1);
    } else {
        hOff = savedHOff;
        vOff = savedVOff;
        unpauseSounds();
    }

    paused = 0;
    resumeAfterInstructions = 0;
    state = GAME1;
}

void game1(void) {
    updateGame1();
    if (state != GAME1) return;
    drawGame1();

    if (BUTTON_PRESSED(BUTTON_START)) goToPause();
    else if (BUTTON_PRESSED(BUTTON_B)) showGameInstructions();
}

void goToGame2(void) {
    int wasPaused = paused;
    loadGameBackground(background2Pal, background2PalLen,
                       background2Tiles, background2TilesLen,
                       background2Map, background2MapLen,
                       map2Tiles, map2TilesLen, map2Map, map2MapLen, map2Pal);

    if (!wasPaused) {
        level = 2;
        initializePlayer();
        initializeBear();
        playSoundA(game2Music_data, game2Music_length, 1);
    } else {
        hOff = savedHOff;
        vOff = savedVOff;
        unpauseSounds();
    }

    paused = 0;
    resumeAfterInstructions = 0;
    state = GAME2;
}

void game2(void) {
    updateGame2();
    if (state != GAME2) return;
    drawGame2();

    if (BUTTON_PRESSED(BUTTON_START)) goToPause();
    else if (BUTTON_PRESSED(BUTTON_B)) showGameInstructions();
}

void goToGame3(void) {
    int wasPaused = paused;
    loadGameBackground(background3Pal, background3PalLen,
                       background3Tiles, background3TilesLen,
                       background3Map, background3MapLen,
                       map3Tiles, map3TilesLen, map3Map, map3MapLen, map3Pal);

    if (!wasPaused) {
        level = 3;
        initializePlayer();
        initializeCrown();
        playSoundA(game3Music_data, game3Music_length, 1);
    } else {
        hOff = savedHOff;
        vOff = savedVOff;
        unpauseSounds();
    }

    paused = 0;
    resumeAfterInstructions = 0;
    state = GAME3;
}

void game3(void) {
    updateGame3();
    if (state != GAME3) return;
    drawGame3();

    if (BUTTON_PRESSED(BUTTON_START)) goToPause();
    else if (BUTTON_PRESSED(BUTTON_B)) showGameInstructions();
}

static void showGameInstructions(void) {
    savedHOff = hOff;
    savedVOff = vOff;
    paused = 1;
    resumeAfterInstructions = 1;
    pauseSounds();
    goToInstructions();
}

void goToPause(void) {
    savedHOff = hOff;
    savedVOff = vOff;
    paused = 1;
    pauseSounds();
    loadStillScreen(pausePal, pauseTiles, pauseTilesLen, pauseMap, pauseMapLen);
    state = PAUSE;
}

static void resumeCurrentLevel(void) {
    if (level == 1) goToGame1();
    else if (level == 2) goToGame2();
    else goToGame3();
}

void pause(void) {
    if (BUTTON_PRESSED(BUTTON_START)) {
        resumeCurrentLevel();
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        resumeAfterInstructions = 1;
        goToInstructions();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToLose(void) {
    stopSounds();
    paused = 0;
    loadStillScreen(losePal, loseTiles, loseTilesLen, loseMap, loseMapLen);
    state = LOSE;
}

void lose(void) {
    if (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToWin(void) {
    stopSounds();
    paused = 0;
    loadStillScreen(winPal, winTiles, winTilesLen, winMap, winMapLen);
    playSoundA(winMusic_data, winMusic_length, 0);
    state = WIN;
}

void win(void) {
    if (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}
