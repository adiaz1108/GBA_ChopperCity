/*
I'm making a game in which the player controls a helicopter going through a city.
The chopper has to face the end of the level while avoiding or shooting airships.
The player has five units of health, and each of the airships has three.
The chopper also cannot touch the ground.


In this iteration animation for the chopper sprite consisting of the rotor 
turning on its own, a parallax city sprite with the previous background of the
night sky, health packs which increase health by 1, and a boss with 10 units of 
health that is able to shoot at the player.

The player now has a cheat: the L button can heal the player completely.

Sounds have also been implemented. There are two music tracks (one for the 
splash and instructions states and one for the game and boss state) and sounds
for the player shooting, being hit by something, and healing.

Art for some of the game states has also been changed to reflect a better military
aesthetic, and the player can now pause in the boss state.

THere are now two more guns that the player can use:
one that charges on its own and takes out all airships in its path and a bomb that 
moves straight down.The bomb will be used for taking out another new
enemy type: a tank that enters from the left (behind the player's
chopper) and shoots at it from the bottom of the screen in a diagonal direction.
Instructions and pause menu have also been updated.

*/


#include <stdio.h>
#include "myLib.h"
#include "start.h"
#include "controls.h"
#include "sky.h"
#include "pause.h"
#include "game.h"
#include "chopperSprites.h"
#include "pause.h"
#include "lose.h"
#include "win.h"
#include "city.h"
#include "sound.h"
#include "drum2.h"
#include "heli.h"
#include "instructions1.h"
#include "instructions2.h"
#include "instructions3.h"
#include "instructions4.h"
#include "instructions5.h"

OBJ_ATTR shadowOAM[128];

int timer;

int page;

int hOff = 0;
int vOff = 0;

void updateOAM();
void hideSprites();
void init();
void goToStart();
void start();
void goToGame();
void game();
void goToInstructions();
void instructions();
void goToPause();
void pause();
void unpause();
void goToLose();
void lose();
void goToWin();
void win();
void goToBossLvl();
void bossLvl();
void goToBossPause();
void bossPause();
void bossUnpause();


#define ROWMASK 0xFF
#define COLMASK 0x1FF

//max bullets and airships on screen
#define MAXBULLETS 3
#define SHIPS 16
#define MAXKITS 3
#define MAXBEAMS 2
#define MAXTANKS 2

//buffer for strings (one is efficient)
char charBuffer[41];
//button variables to save for tracking of buttons
unsigned int buttons; 
unsigned int oldButtons;
//states for game
enum {START, INSTRUCTIONS, GAME, PAUSE, LOSE, BOSSLVL, BOSSPAUSE, WIN,};
int state;

int highScore;

//struct instances and arrays
PLAYER player;
BULLET bullets[MAXBULLETS];
AIRSHIP airships[SHIPS];
MEDKIT medkits[MAXKITS];
BOSS boss;
BEAM beams[MAXBEAMS];
BEAM playerBeams[MAXBEAMS];
TANK tanks[MAXTANKS];
BULLET rounds[MAXBULLETS];
BULLET bombs[MAXBULLETS];

//***Main method***
int main()
{
	REG_DISPCTL = MODE0 |BG0_ENABLE | SPRITE_ENABLE;

	setupSounds();
	setupInterrupts();

	REG_BG0CNT = CBB(0) | SBB(29) | BG_SIZE1 | 2;
	REG_BG1CNT = CBB(1) | SBB(31) | BG_SIZE0 | 3;

	init();

	while(1)
	{
		oldButtons = buttons;
		buttons = BUTTONS;

		switch(state)
		{
			case START:
				start();
				break;
			case INSTRUCTIONS:
				instructions();
				break;
			case GAME:
				game();
				break;
			case PAUSE:
				pause();
				break;
			case LOSE:
				lose();
				break;
			case WIN:
				win();
				break;
			case BOSSLVL:
				bossLvl();
				break;
			case BOSSPAUSE:
				bossPause();
				break;
		}
	}

}
//Finally a reason for this function to exist.
void init()
{

	goToStart();

}
//GO TO START SCREEN
void goToStart()
{
	
	player.score = 0;
	timer = 0;
	playMenuMusic();
	state = START;

	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

	REG_BG0CNT = CBB(0) | SBB(28) | BG_SIZE0;


	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;

	hOff = 0;
	vOff = 0;

	loadPalette(startPal);
	DMANow(3, startTiles, &CHARBLOCKBASE[0], startTilesLen/2);
	DMANow(3, startMap, &SCREENBLOCKBASE[28], startMapLen/2);
}
//START SCREEN
void start()
{
	timer++;
	if(BUTTON_PRESSED(BUTTON_A)) {
		goToInstructions();
	}

	if(BUTTON_PRESSED(BUTTON_START)) {
		goToGame();
	}
}

//GO TO INSTRUCTION SCREEN
void goToInstructions()
{
	state = INSTRUCTIONS;
	page = 1;
	loadPalette(instructions1Pal);
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE0;
	DMANow(3, instructions1Tiles, &CHARBLOCKBASE[0], instructions1TilesLen/2);
	DMANow(3, instructions1Map, &SCREENBLOCKBASE[27], instructions1MapLen/2);
}
//INSTRUCTION SCREEN
void instructions()
{
	if(BUTTON_PRESSED(BUTTON_A))
	{
		if(page == 1) {
			loadPalette(instructions2Pal);
			DMANow(3, instructions2Tiles, &CHARBLOCKBASE[0], instructions2TilesLen/2);
			DMANow(3, instructions2Map, &SCREENBLOCKBASE[27], instructions2MapLen/2);
		} else if(page == 2) {
			loadPalette(instructions3Pal);
			DMANow(3, instructions3Tiles, &CHARBLOCKBASE[0], instructions3TilesLen/2);
			DMANow(3, instructions3Map, &SCREENBLOCKBASE[27], instructions3MapLen/2);
		} else if(page == 3) {
			loadPalette(instructions4Pal);
			DMANow(3, instructions4Tiles, &CHARBLOCKBASE[0], instructions4TilesLen/2);
			DMANow(3, instructions4Map, &SCREENBLOCKBASE[27], instructions4MapLen/2);
		} else if(page == 4) {
			loadPalette(instructions5Pal);
			DMANow(3, instructions5Tiles, &CHARBLOCKBASE[0], instructions5TilesLen/2);
			DMANow(3, instructions5Map, &SCREENBLOCKBASE[27], instructions5MapLen/2);
		} else if(page == 5) {
			goToGame();
		} 
		if(page < 5)
			page++;
	}

	if(BUTTON_PRESSED(BUTTON_B))
	{
		goToStart();
		page = 1;
	}
}
//ENTER GAME STATE
void goToGame()
{
	playGameMusic();
	//set background and seed random timer number
	REG_BG0CNT = CBB(0) | SBB(29) | BG_SIZE0 | 2;
	srand(timer);
	state = GAME;
	loadPalette(cityPal);
	DMANow(3, cityTiles, &CHARBLOCKBASE[0], cityTilesLen/2);
	DMANow(3, cityMap, &SCREENBLOCKBASE[29], cityMapLen/2);

	DMANow(3, chopperSpritesTiles, &CHARBLOCKBASE[4], chopperSpritesTilesLen/2);
	DMANow(3, chopperSpritesPal, SPRITE_PALETTE, chopperSpritesPalLen/2);

	REG_DISPCTL |= BG1_ENABLE;
	DMANow(3, skyTiles, &CHARBLOCKBASE[1], skyTilesLen/2);
	DMANow(3, skyMap, &SCREENBLOCKBASE[31], skyMapLen/2);

	//avoid corner sprite of death
	hideSprites();

	//initialize player
	player.row = SHIFTUP(80);
	player.col = 0;
	player.rowFrame = 0;
	player.colFrame = 0;
	player.height = 13;
	player.width = 29;
	player.health = 5;
	player.bigRow = 80;
	player.bigCol = 0;
	player.gravAcc = 5;
	player.rowDel = 0;
	player.charge = 0;
	player.score = 0;
	player.winning = 0;

	//init bullets and other stuff
	for(int i = 0; i < MAXBULLETS; i++)
	{
		bullets[i].active = 0;
	}

	for(int i = 0; i < SHIPS; i++)
	{
		airships[i].active = 0;
	}

	for(int i = 0; i < MAXKITS; i++)
	{
		medkits[i].active = 0;
	}

	for(int i = 0; i < MAXBEAMS; i++)
	{
		playerBeams[i].active = 0;
	}

	for(int i = 0; i < MAXTANKS; i++)
	{
		tanks[i].active = 0;
	}

	for(int i = 0; i < MAXBULLETS; i++)
	{
		rounds[i].active = 0;
	}

	for(int i = 0; i < MAXBULLETS; i++)
	{
		bombs[i].active = 0;
	}

	timer = 0;

}

//GAME STATE
void game()
{
	//increment values
	timer++;
	player.bigCol++;

	


	updateOAM();

	REG_BG0HOFS = hOff/2;
	REG_BG0VOFS = 90;

	REG_BG1HOFS = 0;
	//this handles parallaxing
	hOff++;
	//when the player clears the level
	if(hOff > 1800)
		goToBossLvl();

	//hit the ground and lose
	if(SHIFTDOWN(player.row) > 144)
		goToLose();
		//press A to shoot
	if(BUTTON_PRESSED(BUTTON_A) && player.health > 0)
	{
		for(int i = 0; i < MAXBULLETS; i++)
		{
			if(!bullets[i].active)
			{
				playerShotSound();
				spawnPlayerBullet(&bullets[i], &player);
				break;
			}
		}
	}

	if(BUTTON_PRESSED(BUTTON_B) && player.health > 0)
	{
		for(int i = 0; i < MAXBULLETS; i++)
		{
			if(!bombs[i].active)
			{
				playerShotSound();
				spawnBomb(&bombs[i], &player);
				break;
			}
		}
	}
	//animating the player
	if(timer % 4 == 0) {
		player.rowFrame = animatePlayer(player.rowFrame);

	}

	if(timer%12 == 0)
	{
		for(int i = 0; i < MAXTANKS; i++)
		{
			if(tanks[i].active)
				tanks[i].colFrame = animateTank(tanks[i].colFrame);
		}
	}

	if(player.bigCol > 400 && hOff < 1600 && timer % 300 == 0)
	{
		for(int i = 0; i < MAXTANKS; i++)
		{
			if(!tanks[i].active)
			{
				spawnTank(&tanks[i]);
				break;
			}
				

		}
	}

	for(int i = 0; i < MAXTANKS; i++)
	{
		if(tanks[i].active)
		{
			if(tanks[i].col % 50 == 0 && tanks[i].col > 0)
			{
				for(int j = 0; j < MAXBULLETS; j++)
				{
					if(!rounds[j].active)
					{
						spawnTankBullet(&rounds[j], &tanks[i]);
						break;
					}
				}
			}
			
		}
	}
		

	if(timer % 64 == 0) {
		chargePlayer(&player);

	}

	//pause
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToPause();
	}

	if(BUTTON_PRESSED(BUTTON_R) && player.charge == 5) {
		for(int i = 0; i < MAXBEAMS; i++)
		{
			if(!playerBeams[i].active)
			{
				playerShotSound();
				spawnPlayerBeam(&playerBeams[i], &player);
				player.charge = 0;
				break;
			}
		}
	}
		//this changes how often airships show up. more show up later.
		//this also does the same with medkits
	if(hOff < 1600) {
		if(player.bigCol > 800) 
		{
		if(timer % 28 == 0) {
			for(int i = 0; i < SHIPS; i++)
			{
				if(!airships[i].active)
				{
					spawnAirship(&airships[i]);
					break;
				}
			}
		}
		if(timer % 100 == 0) {
			for(int i = 0; i < SHIPS; i++)
			{
				if(!medkits[i].active)
				{
					spawnMedkit(&medkits[i]);
					break;
				}

			}
		}
	} else if(player.bigCol > 500) {
		if(timer % 32 == 0) {
			for(int i = 0; i < SHIPS; i++)
			{
				if(!airships[i].active)
				{
					spawnAirship(&airships[i]);
					break;
				}
			}
		}
		if(timer % 150 == 0) {
			for(int i = 0; i < SHIPS; i++)
			{
				if(!medkits[i].active)
				{
					spawnMedkit(&medkits[i]);
					break;
				}

			}
		}
	} else if(player.bigCol > 200 ) {
		if(timer % 48 == 0) {
			for(int i = 0; i < SHIPS; i++)
			{
				if(!airships[i].active)
				{
					spawnAirship(&airships[i]);
					break;
				}
			}
		}
	} else {
		if(timer % 72 == 0) {
			for(int i = 0; i < SHIPS; i++)
			{
				if(!airships[i].active)
				{
					spawnAirship(&airships[i]);
					break;
				}

			}
		}
	}
	} else {
		if(timer % 200 == 0)
		{
			for(int i = 0; i < SHIPS; i++)
			{
				if(!medkits[i].active)
				{
					spawnMedkit(&medkits[i]);
					break;
				}

			}
		}
	}
	
	if(BUTTON_PRESSED(BUTTON_L)) {
		player.health = 5;
		playRestoreHealthSound();
	}
		
	
	//update everything

	if(player.health > 0)
		updatePlayer(&player);
	else
	{
		killPlayer(&player);
		for(int i = 0; i < MAXBULLETS; i++)
		{
			bullets[i].active = 0;
		}
		if(SHIFTDOWN(player.row) > 148)
			goToLose();
	}
		

	for(int i = 0; i < MAXBULLETS; i++)
	{
		if(bullets[i].active)
		{
			updatePlayerBullet(&bullets[i]);

		}
	}



	for(int i = 0; i < MAXBEAMS; i++)
	{
		if(playerBeams[i].active)
		{
			updatePlayerBeam(&playerBeams[i]);
			for(int j = 0; j < SHIPS; j++) {
				beamHitCheck(&playerBeams[i], &airships[j], &player);
			}
		}
	}

	for(int i = 0; i < SHIPS; i++)
	{
		if(airships[i].active)
		{
			updateAirship(&airships[i]);
			playerHitCheck(&airships[i], &player);
		}
	}

	for(int i = 0; i < MAXKITS; i++)
	{
		if(medkits[i].active)
		{
			if(timer % 2 < 1)
				updateMedkit(&medkits[i]);

			healthUpCheck(&medkits[i], &player);
		}
	}

	for(int i = 0; i < MAXBULLETS; i++)
	{
		for(int j = 0; j < SHIPS; j++)
		{
			if(bullets[i].active && airships[j].active)
				enemyHitCheck(&bullets[i], &airships[j], &player);
		}
	}

	for(int i = 0; i < MAXTANKS; i++)
	{
		if(tanks[i].active)
			updateTank(&tanks[i]);
	}

	for(int i = 0; i < MAXBULLETS; i++)
	{
		if(rounds[i].active) {
			updateTankBullet(&rounds[i]);
			playerHitByTankCheck(&rounds[i], &player);
		}
			
	}

	for(int i = 0; i < MAXBULLETS; i++)
	{
		if(bombs[i].active) {
			updateBomb(&bombs[i]);
			for(int j = 0; j < MAXTANKS; j++) 
			{
				bombHitCheck(&bombs[i], &tanks[j], &player);
			}
		}
			
	}

	//wait frame
	waitForVblank();
}

//GO TO BOSS LEVEL
void goToBossLvl() 
{
	state = BOSSLVL;
	timer = 0;
	spawnBoss(&boss);
	DMANow(3, shadowOAM, OAM, 128*4);
	for(int i = 0; i < MAXBULLETS; i++)
	{
		bombs[i].active = 0;
	}
}
//BOSS LEVEL
void bossLvl()
{
	updateOAM();
	timer++;
	if(boss.col > 160) {
		boss.col--;
	} else if(boss.health > 0) {
		updateBoss(&boss);
		if(timer % 100 == 0) {
			for(int x = 0; x < MAXBEAMS; x++) {
				if(beams[x].active == 0) {
					spawnBeam(&beams[x], &boss);
					break;
				}
			}
		}
		for(int j = 0; j < MAXBEAMS; j++) {
			if(beams[j].active) {
				updateBeam(&beams[j]);
				if(boss.health > 0)
					playerHitByBossCheck(&beams[j], &player);
			}
				
		}
		

	} else {
		killBoss(&boss);
		if(player.score > highScore)
			highScore = player.score;
		for(int x = 0; x < MAXBEAMS; x++)
				beams[x].active = 0;
		if(!boss.active) {
			hideSprites();
			goToWin(); //A winrar is you!

		}

		
	}
	
	if(boss.health == 0)
		player.winning = 1;

	if(player.health > 0)
		updatePlayer(&player);
	else {
		if(boss.health > 0)
			killPlayer(&player);
		for(int i = 0; i < MAXBULLETS; i++)
		{
			bullets[i].active = 0;
		}
		if(SHIFTDOWN(player.row) > 148)
		{
			hideSprites();
			for(int x = 0; x < MAXBEAMS; x++)
				beams[x].active = 0;
			boss.active = 0;
			if(!player.winning)
				goToLose(); //git gud m8
			else
				goToWin();
				
		}
	

	}
		

	if(BUTTON_PRESSED(BUTTON_L)) {
		player.health = 5;
		playRestoreHealthSound();
	}

	if(BUTTON_PRESSED(BUTTON_R) && player.charge == 5) {
		for(int i = 0; i < MAXBEAMS; i++)
		{
			if(!playerBeams[i].active)
			{
				playerShotSound();
				spawnPlayerBeam(&playerBeams[i], &player);
				player.charge = 0;
				break;
			}
		}
	}
		
	//fall down and lose
	if(SHIFTDOWN(player.row) > 144) 
		goToLose(); 

	if(BUTTON_PRESSED(BUTTON_A) && player.health > 0)
	{
		for(int i = 0; i < MAXBULLETS; i++)
		{
			if(!bullets[i].active)
			{
				playerShotSound();
				spawnPlayerBullet(&bullets[i], &player);
				break;
			}
		}
	}

	for(int i = 0; i < MAXBULLETS; i++)
	{
		if(bullets[i].active)
		{
			updatePlayerBullet(&bullets[i]);
			bossHitCheck(&bullets[i], &boss);
		}
	}

	for(int i = 0; i < MAXBEAMS; i++)
	{
		if(playerBeams[i].active)
		{
			updatePlayerBeam(&playerBeams[i]);
			beamHitBossCheck(&playerBeams[i], &boss);
			
		}
	}

	if(timer % 4 == 0)
	{
		player.rowFrame = animatePlayer(player.rowFrame);
		
			
	}
		

	if(timer % 64 == 0) {
		chargePlayer(&player);
	}

	if(BUTTON_PRESSED(BUTTON_START)) {
		hideSprites();
		goToBossPause();
	}
		

	waitForVblank();
}

void goToBossPause()
{
	pauseSound();
	playPauseSound();
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE0;
	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);
	state = BOSSPAUSE;
	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;
	loadPalette(pausePal);
	DMANow(3, pauseTiles, &CHARBLOCKBASE[0], pauseTilesLen/2);
	DMANow(3, pauseMap, &SCREENBLOCKBASE[27], pauseMapLen/2);
}

void bossPause()
{
	if(BUTTON_PRESSED(BUTTON_START))
		bossUnpause();
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
			boss.active = 0;
		boss.health = 0;
		for(int i = 0; i < MAXBEAMS; i++)
			beams[i].active = 0;
		goToStart();
	}
		
}

void bossUnpause()
{
	playGameMusic();
	REG_DISPCTL |= BG1_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(29) | BG_SIZE0 | 2;
	state = BOSSLVL;
	REG_BG0HOFS = hOff;
	REG_BG0VOFS = 80;
	loadPalette(cityPal);
	DMANow(3, cityTiles, &CHARBLOCKBASE[0], cityTilesLen/2);
	DMANow(3, cityMap, &SCREENBLOCKBASE[29], cityMapLen/2);
}

//PAUSE
void goToPause()
{
	pauseSound();
	playPauseSound();
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE0;
	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);
	state = PAUSE;
	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;
	loadPalette(pausePal);
	DMANow(3, pauseTiles, &CHARBLOCKBASE[0], pauseTilesLen/2);
	DMANow(3, pauseMap, &SCREENBLOCKBASE[27], pauseMapLen/2);
}
//YOu can go back to start here
void pause()
{
	
	if(BUTTON_PRESSED(BUTTON_START))
		unpause();
	if(BUTTON_PRESSED(BUTTON_SELECT))
		goToStart();
}
//back to game state. Can't pause in boss state.
void unpause()
{
	playGameMusic();
	REG_DISPCTL |= BG1_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(29) | BG_SIZE0 | 2;
	state = GAME;
	REG_BG0HOFS = hOff;
	REG_BG0VOFS = 80;
	loadPalette(cityPal);
	DMANow(3, cityTiles, &CHARBLOCKBASE[0], cityTilesLen/2);
	DMANow(3, cityMap, &SCREENBLOCKBASE[29], cityMapLen/2);

}

void goToLose()
{
	stopSound();
	playLoseSound();
	boss.active = 0;
	boss.health = 0;
	for(int i = 0; i < MAXBEAMS; i++)
		beams[i].active = 0;
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(28) | BG_SIZE0;
	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);
	state = LOSE;
	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;
	loadPalette(losePal);
	DMANow(3, loseTiles, &CHARBLOCKBASE[0], loseTilesLen/2);
	DMANow(3, loseMap, &SCREENBLOCKBASE[28], loseMapLen/2);

}

void lose()
{
	if(BUTTON_PRESSED(BUTTON_START))
		goToStart();
}


void goToWin()
{
	
	stopSound();
	playWinMusic();
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(28) | BG_SIZE0;
	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);
	state = LOSE;
	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;
	loadPalette(heliPal);
	DMANow(3, heliTiles, &CHARBLOCKBASE[0], heliTilesLen/2);
	DMANow(3, heliMap, &SCREENBLOCKBASE[28], heliMapLen/2);

}

void win()
{
	if(BUTTON_PRESSED(BUTTON_START))
		goToStart();
}
//EVERYTHING OAM
void updateOAM()
{	//player
	shadowOAM[0].attr0 = (ROWMASK & SHIFTDOWN(player.row)) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[0].attr1 = (ROWMASK & player.col) | ATTR1_SIZE32;
	shadowOAM[0].attr2 = SPRITEOFFSET16(player.rowFrame, player.colFrame);

	for(int i = 0; i < MAXBULLETS; i++)
	{
		if(bullets[i].active)
		{
			//bullets
			shadowOAM[i+1].attr0 = (ROWMASK & bullets[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i+1].attr1 = (COLMASK & bullets[i].col) | ATTR1_SIZE8;
			shadowOAM[i+1].attr2 = SPRITEOFFSET16(8, 0);
		}
			
		
		if(bullets[i].passed || bullets[i].hit || !bullets[i].active)
		{
			shadowOAM[i+1].attr0 = ATTR0_HIDE;
			bullets[i].passed = 0;
			bullets[i].hit = 0;
		}

	}

	for(int i = 0; i < SHIPS; i++)
	{
		if(airships[i].active)
		{	//airships
			shadowOAM[i+4].attr0 = (ROWMASK & airships[i].row) | ATTR0_4BPP |ATTR0_WIDE;
			shadowOAM[i+4].attr1 = (COLMASK & airships[i].col) | ATTR1_SIZE64;
			shadowOAM[i+4].attr2 = SPRITEOFFSET16(0, 4) | ATTR2_PRIORITY(1);
		} else {
			shadowOAM[i+4].attr0 = ATTR0_HIDE;
		}
	}

	
	//these bullet sprites indicate the player's health. There are 5 in total.
	for(int h = 0; h < 6; h++) {
		if(player.health > h) {
			//health indicator for player
			shadowOAM[h+20].attr0 = (ROWMASK & 4) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[h+20].attr1 = (COLMASK & (10 + h * 10)) | ATTR1_SIZE8;
			shadowOAM[h+20].attr2 = SPRITEOFFSET16(8, 3);
		} else {
			shadowOAM[h+20].attr0 = ATTR0_HIDE;
		}
	}
	//This bullet sprite indicates progress, so the player knows how close the end is
	shadowOAM[26].attr0 = (ROWMASK & 152) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[26].attr1 = (COLMASK & (hOff/8 + 10)) | ATTR1_SIZE8;
	shadowOAM[26].attr2 = SPRITEOFFSET16(8, 6);

	for(int i = 0; i < MAXKITS; i++) {
		if(medkits[i].active)
		{	//medkits
			shadowOAM[i+27].attr0 = (ROWMASK & medkits[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i+27].attr1 = (COLMASK & medkits[i].col) | ATTR1_SIZE16;
			shadowOAM[i+27].attr2 = SPRITEOFFSET16(medkits[i].rowFrame, medkits[i].colFrame);
		} else {
			shadowOAM[i+27].attr0 = ATTR0_HIDE;
		}
	}

	if(boss.active)
	{	//boss sprite
		shadowOAM[30].attr0 = (ROWMASK & boss.row) | ATTR0_4BPP | ATTR0_WIDE;
		shadowOAM[30].attr1 = (COLMASK & boss.col) | ATTR1_SIZE64;
		shadowOAM[30].attr2 = SPRITEOFFSET16(boss.rowFrame, boss.colFrame) | ATTR2_PRIORITY(2);	
	} else {
		shadowOAM[30].attr0 = ATTR0_HIDE;
	}

	for(int h = 0; h < 11; h++) {
		if(boss.health > h) {
			//boss's health indicator
			shadowOAM[h+31].attr0 = (ROWMASK & (10 + h * 10)) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[h+31].attr1 = (COLMASK & 232) | ATTR1_SIZE8;
			shadowOAM[h+31].attr2 = SPRITEOFFSET16(8, 3);
		} else {
			shadowOAM[h+31].attr0 = ATTR0_HIDE;
		}
	}

	for(int h = 0; h < 2; h++) {
		if(beams[h].active) {
			//boss's laser beams
			shadowOAM[h+42].attr0 = (ROWMASK & beams[h].row) | ATTR0_4BPP | ATTR0_WIDE;
			shadowOAM[h+42].attr1 = (COLMASK & beams[h].col) | ATTR1_SIZE8;
			shadowOAM[h+42].attr2 = SPRITEOFFSET16(8, 4);
		} else {
			shadowOAM[h+42].attr0 = ATTR0_HIDE;
		}
	}

	for(int h = 0; h < 2; h++) {
		if(playerBeams[h].active) {
			//boss's laser beams
			shadowOAM[h+44].attr0 = (ROWMASK & playerBeams[h].row) | ATTR0_4BPP | ATTR0_WIDE;
			shadowOAM[h+44].attr1 = (COLMASK & playerBeams[h].col) | ATTR1_SIZE8;
			shadowOAM[h+44].attr2 = SPRITEOFFSET16(8, 8);
		} else {
			shadowOAM[h+44].attr0 = ATTR0_HIDE;
		}
	}

	for(int h = 0; h < 6; h++) {
		if(player.charge > h) {
			//health indicator for player
			shadowOAM[h+46].attr0 = (ROWMASK & 12) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[h+46].attr1 = (COLMASK & (10 + h * 10)) | ATTR1_SIZE8;
			shadowOAM[h+46].attr2 = SPRITEOFFSET16(8, 10);
		} else {
			shadowOAM[h+46].attr0 = ATTR0_HIDE;
		}
	}

	if(player.health > 0){
		shadowOAM[52].attr0 = (ROWMASK & 152) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[52].attr1 = (COLMASK & 230) | ATTR1_SIZE8;
		shadowOAM[52].attr2 = SPRITEOFFSET16(8, 11);
	} else {
		shadowOAM[52].attr0 = ATTR0_HIDE;
	}

	shadowOAM[53].attr0 = (ROWMASK & 2) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[53].attr1 = (COLMASK & 96) | ATTR1_SIZE8;
	if(player.score % 2 == 0)
		shadowOAM[53].attr2 = SPRITEOFFSET16(11, 0);
	else
		shadowOAM[53].attr2 = SPRITEOFFSET16(11, 5);

	shadowOAM[54].attr0 = (ROWMASK & 2) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[54].attr1 = (COLMASK & 88) | ATTR1_SIZE8;
	if(player.score < 20) {
		shadowOAM[54].attr2 = SPRITEOFFSET16(11, player.score/2);
		shadowOAM[55].attr0 = (ROWMASK & 2) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[55].attr1 = (COLMASK & 80) | ATTR1_SIZE8;
		shadowOAM[55].attr2 = SPRITEOFFSET16(11, 0);
	}
	else {
		shadowOAM[54].attr2 = SPRITEOFFSET16(11, player.score/2 - 10);
		shadowOAM[55].attr0 = (ROWMASK & 2) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[55].attr1 = (COLMASK & 80) | ATTR1_SIZE8;
		shadowOAM[55].attr2 = SPRITEOFFSET16(11, 1);
	}
	
	shadowOAM[56].attr0 = (ROWMASK & 2) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[56].attr1 = (COLMASK & 136) | ATTR1_SIZE32;
	shadowOAM[56].attr2 = SPRITEOFFSET16(9, 2);

	shadowOAM[57].attr0 = (ROWMASK & 2) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[57].attr1 = (COLMASK & 192) | ATTR1_SIZE8;
	if(highScore % 2 == 0)
		shadowOAM[57].attr2 = SPRITEOFFSET16(11, 0);
	else
		shadowOAM[57].attr2 = SPRITEOFFSET16(11, 5);

	shadowOAM[58].attr0 = (ROWMASK & 2) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[58].attr1 = (COLMASK & 184) | ATTR1_SIZE8;
	if(highScore < 20) {
		shadowOAM[58].attr2 = SPRITEOFFSET16(11, highScore/2);
		shadowOAM[59].attr0 = (ROWMASK & 2) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[59].attr1 = (COLMASK & 176) | ATTR1_SIZE8;
		shadowOAM[59].attr2 = SPRITEOFFSET16(11, 0);
	}
	else {
		shadowOAM[58].attr2 = SPRITEOFFSET16(11, highScore/2 - 10);
		shadowOAM[59].attr0 = (ROWMASK & 2) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[59].attr1 = (COLMASK & 176) | ATTR1_SIZE8;
		shadowOAM[59].attr2 = SPRITEOFFSET16(11, 1);
	}

	shadowOAM[60].attr0 = (ROWMASK & 2) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[60].attr1 = (COLMASK & 0) | ATTR1_SIZE8;
	shadowOAM[60].attr2 = SPRITEOFFSET16(8, 12);

	shadowOAM[61].attr0 = (ROWMASK & 12) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[61].attr1 = (COLMASK & 0) | ATTR1_SIZE8;
	shadowOAM[61].attr2 = SPRITEOFFSET16(8, 13);

	for(int i = 0; i < MAXTANKS; i++)
	{
		if(tanks[i].active)
		{
			shadowOAM[62+i].attr0 = (ROWMASK & tanks[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[62+i].attr1 = (COLMASK & tanks[i].col) | ATTR1_SIZE32;
			shadowOAM[62+i].attr2 = SPRITEOFFSET16(4, tanks[i].colFrame);
		} else {
			shadowOAM[62+i].attr0 = ATTR0_HIDE;
		}

	}

	for(int i = 0; i < MAXBULLETS; i++)
	{
		if(rounds[i].active)
		{
			//bullets
			shadowOAM[i+64].attr0 = (ROWMASK & rounds[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i+64].attr1 = (COLMASK & rounds[i].col) | ATTR1_SIZE8;
			shadowOAM[i+64].attr2 = SPRITEOFFSET16(rounds[i].rowFrame, rounds[i].colFrame);
		} else {
			shadowOAM[i+64].attr0 = ATTR0_HIDE;
		}
	}

	for(int i = 0; i < MAXBULLETS; i++)
	{
		if(bombs[i].active)
		{
			//bullets
			shadowOAM[i+67].attr0 = (ROWMASK & bombs[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i+67].attr1 = (COLMASK & bombs[i].col) | ATTR1_SIZE8;
			shadowOAM[i+67].attr2 = SPRITEOFFSET16(bombs[i].rowFrame, bombs[i].colFrame);
		} else {
			shadowOAM[i+67].attr0 = ATTR0_HIDE;
		}
	}
	

	//copy to OAM
	DMANow(3, shadowOAM, OAM, 128*4);
}
//do this a lot
void hideSprites()
{
	for (int i = 0; i < 128; i++) {
    	shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

