#include "mylib.h"
#include "sound.h"
#include <stdio.h>
#include "drum2.h"
#include "drum1.h"
#include "boom.h"
#include "blam.h"
#include "bling.h"
#include "pom.h"
#include "crash.h"
#include "winMusic2.h"


SOUND soundA;
SOUND soundB;



void playMenuMusic()
{
	playSoundA(drum2, DRUM2LEN/2, DRUM2FREQ);
	soundA.loops = 1;
}

void playGameMusic()
{
	playSoundA(drum1, DRUM1LEN, DRUM1FREQ);
	soundA.loops = 1;
}


void playerShotSound()
{
	playSoundB(boom, BOOMLEN, BOOMFREQ);
	soundB.loops = 0;
}

void playerHitSound()
{
	playSoundB(blam, BLAMLEN, BLAMFREQ);
	soundB.loops = 0;
}

void playRestoreHealthSound()
{
	playSoundB(bling, BLINGLEN, BLINGFREQ);
	soundB.loops = 0;
}

void playPauseSound()
{
	playSoundB(pom, POMLEN, POMFREQ);
	soundB.loops = 0;
}

void playLoseSound()
{
	playSoundB(crash, CRASHLEN, CRASHFREQ);
	soundB.loops = 0;
}

void playWinMusic()
{
	playSoundA(winMusic2, WINMUSIC2LEN, WINMUSIC2FREQ);
	soundA.loops = 0;
}

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency) {
        dma[1].cnt = 0;
	
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;
	
        //TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values
        soundA.data = sound;
        soundA.vbCount = 0;
        soundA.duration = ((VBLANK_FREQ*length)/frequency);
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.isPlaying = 1;
         
}


void playSoundB( const unsigned char* sound, int length, int frequency) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;
	
        // TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values
        soundB.data = sound;
        soundB.vbCount = 0;
        soundB.duration = ((VBLANK_FREQ*length)/frequency);
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.isPlaying = 1;

}

void pauseSound()
{
	soundA.isPlaying = 0;
	REG_TM0CNT = 0;

	soundB.isPlaying = 0;
	REG_TM1CNT= 0;
	// TODO: WRITE THIS FUNCTION

}

void unpauseSound()
{
	soundA.isPlaying = 1;
	REG_TM0CNT = 1;

	soundB.isPlaying = 1;
	REG_TM1CNT= 1;
	// TODO: WRITE THIS FUNCTION
	


}

void stopSound()
{
    // TODO: WRITE THIS FUNCTION
    dma[1].cnt = 0;
	soundA.isPlaying = 0;
	REG_TM0CNT = 0;

	dma[2].cnt = 0;
	soundB.isPlaying = 0;
	REG_TM1CNT = 0;

}

void setupInterrupts()
{
	REG_IME = 0;
	// TODO: SET UP THE INTERRUPT HANDLER HERE
	// HINT: THERE IS A REGISTER THAT NEEDS TO POINT TO A INTERRUPT FUNCTION
	// HINT: THAT INTERRUPT FUNCTION HAS TO BE CAST TO SOMETHING...
	REG_INTERRUPT = (unsigned int) interruptHandler;

	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		//TODO: FINISH THIS FUNCTION
		// This should be where you determine if a sound if finished or not
		if(soundA.isPlaying)
		{
			soundA.vbCount++;
			if(soundA.vbCount >= soundA.duration)
			{
				if(soundA.loops)
				{
					playSoundA(soundA.data, soundA.length, soundA.frequency);
				}
				else
				{
					dma[1].cnt = 0;
					soundA.isPlaying = 0;
					REG_TM0CNT = 0;
				}
			}
		}

		if(soundB.isPlaying)
		{
			soundB.vbCount++;
			if(soundB.vbCount >= soundB.duration)
			{
				if(soundB.loops)
				{
					playSoundB(soundB.data, soundB.length, soundB.frequency);
				} 
				else 
				{
					dma[2].cnt = 0;
					soundB.isPlaying = 0;
					REG_TM1CNT = 0;
				}
			}
		}

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}