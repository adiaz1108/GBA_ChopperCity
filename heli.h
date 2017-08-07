
//{{BLOCK(heli)

//======================================================================
//
//	heli, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 576 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 18432 + 2048 = 20992
//
//	Time-stamp: 2016-12-05, 16:14:10
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HELI_H
#define GRIT_HELI_H

#define heliTilesLen 18432
extern const unsigned short heliTiles[9216];

#define heliMapLen 2048
extern const unsigned short heliMap[1024];

#define heliPalLen 512
extern const unsigned short heliPal[256];

#endif // GRIT_HELI_H

//}}BLOCK(heli)
