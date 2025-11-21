#ifndef HELPER_H
#define HELPER_H

extern int lives;

extern int hOff;
extern int vOff;

void updateGame1();
void drawGame1();
void updateGame2();
void drawGame2();
void updateGame3();
void drawGame3();

// Colliion map
int goThrough(int x, int y, int level);
unsigned char colorAt(int x, int y); 

// Collision tiles
unsigned short getTile(int x, int y);
int checkCollisionHardBlock(int x, int y);
int checkCollisionTransparentBlock(int x, int y);
int checkCollisionLose(int x, int y);
int checkCollisionSprite(SPRITE a, SPRITE b);

#endif
