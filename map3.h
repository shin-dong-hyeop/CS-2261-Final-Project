
//{{BLOCK(map3)

//======================================================================
//
//	map3, 512x256@4,
//	+ palette 16 entries, not compressed
//	+ 11 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32
//	Total size: 32 + 352 + 4096 = 4480
//
//	Time-stamp: 2025-12-06, 07:24:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAP3_H
#define GRIT_MAP3_H

#define map3TilesLen 352
extern const unsigned short map3Tiles[176];

#define map3MapLen 4096
extern const unsigned short map3Map[2048];

#define map3PalLen 32
extern const unsigned short map3Pal[16];

#endif // GRIT_MAP3_H

//}}BLOCK(map3)
