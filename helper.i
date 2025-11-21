# 0 "helper.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "helper.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 44 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "gba.h"
void DMANow(int channel, volatile void *src, volatile void *dest, unsigned int ctrl);
# 2 "helper.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "helper.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "sprites.h"
void hideSprites();


typedef struct {
  int x;
  int y;
  int xVel;
  int yVel;
  int width;
  int height;
  int timeUntilNextFrame;
  int direction;
  int isAnimating;
  int currentFrame;
  int numFrames;
  int paletteRow;
  int dy;
  int grounded;
  int jumpCount;
  int maxJumps;
  u8 oamIndex;

  int coyote;
  int jumpBuffer;
} SPRITE;
# 4 "helper.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 3 4
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 190 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 12 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 2 3 4
#pragma GCC diagnostic pop
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "helper.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[512];


extern const unsigned short tilesetPal[256];
# 6 "helper.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 7 "helper.c" 2
# 1 "game.h" 1






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


void goToLose(void);
void goToGame2(void);
void goToGame3(void);
void goToWin(void);
# 8 "helper.c" 2
# 1 "collision1.h" 1
# 21 "collision1.h"
extern const unsigned short collision1Bitmap[65536];


extern const unsigned short collision1Pal[256];
# 9 "helper.c" 2
# 1 "collision2.h" 1
# 21 "collision2.h"
extern const unsigned short collision2Bitmap[65536];


extern const unsigned short collision2Pal[256];
# 10 "helper.c" 2
# 1 "collision3.h" 1
# 21 "collision3.h"
extern const unsigned short collision3Bitmap[65536];


extern const unsigned short collision3Pal[256];
# 11 "helper.c" 2
# 1 "map1.h" 1







extern const unsigned short map1Map[2048];
# 12 "helper.c" 2
# 22 "helper.c"
extern SPRITE player;
extern int level;
extern int lives;

extern int hOff;
extern int vOff;


unsigned char colorAt(int x, int y) {
    if (level == 1) {
        return ((unsigned char *)collision1Bitmap)[((y) * (512) + (x))];
    } else if (level == 2) {
        return ((unsigned char *)collision2Bitmap)[((y) * (512) + (x))];
    } else if (level == 3) {
        return ((unsigned char *)collision3Bitmap)[((y) * (512) + (x))];
    } else {
        return 0;
    }
}


int goThrough(int x, int y, int level) {
    (void)level;
    if(x < 0 || x >= 512 || y < 0 || y >= 256) return 0;

    unsigned char tile = colorAt(x, y);
    if (tile != 0 && tile != 2) {
        return 1;
    }
    return 0;
}


unsigned short getTile(int x, int y) {
    int tileX = x / 8;
    int tileY = y / 8;

    if (tileX < 0 || tileX >= 32 || tileY < 0 || tileY >= 32) {
        return 0xFFFF;
    }
    return ((SB*) 0x6000000)[20].tilemap[tileY * 32 + tileX];
}



int checkCollisionHardBlock(int x, int y) {
    return (getTile(x, y) == 0x0001) || (getTile(x, y) == 0x0002) || (getTile(x, y) == 0x0003) ||
           (getTile(x + 8 - 1, y) == 0x0001) || (getTile(x + 8 - 1, y) == 0x0002) || (getTile(x + 8 - 1, y) == 0x0003)||
           (getTile(x, y + 8 - 1) == 0x0001) || (getTile(x, y + 8 - 1) == 0x0002) || (getTile(x, y + 8 - 1) == 0x0003) ||
           (getTile(x + 8 - 1, y + 8 - 1) == 0x0001) || (getTile(x + 8 - 1, y + 8 - 1) == 0x0002) || (getTile(x + 8 - 1, y + 8 - 1) == 0x0003);
}

int checkCollisionTransparentBlock(int x, int y) {
    return (getTile(x, y) == 0x0000) ||
           (getTile(x + 8 - 1, y) == 0x0000) ||
           (getTile(x, y + 8 - 1) == 0x0000) ||
           (getTile(x + 8 - 1, y + 8 - 1) == 0x0000);
}


int checkCollisionLose(int x, int y) {
    return ((getTile(x, y) == 0x0002) ||
           (getTile(x + 8 - 1, y) == 0x0002) ||
           (getTile(x, y + 8 - 1) == 0x0002) ||
           (getTile(x + 8 - 1, y + 8 - 1) == 0x0002));
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
    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000016) = vOff;
}


void updateGame2() {
    updatePlayer();
    updateBear();
    winCondition();
}


void drawGame2() {
    drawPlayer();
    drawCollection();
    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000016) = vOff;
}

void updateGame3() {
    updatePlayer();
    updateCrown();
    winCondition();
}

void drawGame3() {
    drawPlayer();
    drawCollection();
    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000016) = vOff;
}
