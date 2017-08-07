
//{{BLOCK(city)

//======================================================================
//
//	city, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 90 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2880 + 2048 = 5440
//
//	Time-stamp: 2016-11-15, 16:05:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CITY_H
#define GRIT_CITY_H

#define cityTilesLen 2880
extern const unsigned short cityTiles[1440];

#define cityMapLen 2048
extern const unsigned short cityMap[1024];

#define cityPalLen 512
extern const unsigned short cityPal[256];

#endif // GRIT_CITY_H

//}}BLOCK(city)
