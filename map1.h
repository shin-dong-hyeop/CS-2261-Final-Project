
//{{BLOCK(map1)

//======================================================================
//
//	map1, 512x256@4,
//	+ palette 16 entries, not compressed
//	+ 7 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32
//	Total size: 32 + 224 + 4096 = 4352
//
//	Time-stamp: 2025-12-04, 09:23:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAP1_H
#define GRIT_MAP1_H

#define map1TilesLen 224
extern const unsigned short map1Tiles[112];

#define map1MapLen 4096
extern const unsigned short map1Map[2048];

#define map1PalLen 32
extern const unsigned short map1Pal[16];

#endif // GRIT_MAP1_H

//}}BLOCK(map1)
