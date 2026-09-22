#ifndef HELPER_H
#define HELPER_H

#include "sprites.h"

void updateGame1(void);
void drawGame1(void);
void updateGame2(void);
void drawGame2(void);
void updateGame3(void);
void drawGame3(void);

int goThrough(int x, int y, int level);
unsigned char colorAt(int x, int y);
int checkCollisionLose(int x, int y);
int checkCollisionSprite(SPRITE a, SPRITE b);

#endif
