#ifndef GBA_GAME_H
#define GBA_GAME_H

#include "sprites.h"

void initializePlayer(void);
void initializeBanana(void);
void initializeBear(void);
void initializeCrown(void);

int updatePlayer(void);
void updateBanana(void);
void updateBear(void);
void updateCrown(void);

void drawPlayer(void);
void drawCollection(void);
void drawGame(void);

int winCondition(void);

void goToLose(void);
void goToGame2(void);
void goToGame3(void);
void goToWin(void);

#endif
