
//{{BLOCK(start)

//======================================================================
//
//	start, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 61 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1952 + 2048 = 4512
//
//	Time-stamp: 2025-11-13, 21:53:40
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_START_H
#define GRIT_START_H

#define startTilesLen 1952
extern const unsigned short startTiles[976];

#define startMapLen 2048
extern const unsigned short startMap[1024];

#define startPalLen 512
extern const unsigned short startPal[256];

#endif // GRIT_START_H

//}}BLOCK(start)
