
//{{BLOCK(controls)

//======================================================================
//
//	controls, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 347 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 11104 + 2048 = 13664
//
//	Time-stamp: 2016-12-05, 19:15:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CONTROLS_H
#define GRIT_CONTROLS_H

#define controlsTilesLen 11104
extern const unsigned short controlsTiles[5552];

#define controlsMapLen 2048
extern const unsigned short controlsMap[1024];

#define controlsPalLen 512
extern const unsigned short controlsPal[256];

#endif // GRIT_CONTROLS_H

//}}BLOCK(controls)
