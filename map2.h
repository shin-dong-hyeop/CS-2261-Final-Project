
//{{BLOCK(map2)

//======================================================================
//
//	map2, 512x256@4,
//	+ palette 16 entries, not compressed
//	+ 7 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32
//	Total size: 32 + 224 + 4096 = 4352
//
//	Time-stamp: 2025-12-05, 08:22:05
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAP2_H
#define GRIT_MAP2_H

#define map2TilesLen 224
extern const unsigned short map2Tiles[112];

#define map2MapLen 4096
extern const unsigned short map2Map[2048];

#define map2PalLen 32
extern const unsigned short map2Pal[16];

#endif // GRIT_MAP2_H

//}}BLOCK(map2)
