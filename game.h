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



#endif