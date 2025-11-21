#ifndef GBA_GAME_H
#define GBA_GAME_H

#include "gba.h"
#include "sprites.h"

void initializePlayer();
void initializeBanana();
void initializeBear();
void initializeCrown();
void updatePlayer();
void updateBanana();
void updateBear();
void updateCrown();
void drawPlayer();
void drawCollection();

int winCondition();
int loseCondition();

// TEMP: declare state transition functions defined in main.c
void goToLose(void);
void goToGame2(void);
void goToGame3(void);
void goToWin(void);



#endif