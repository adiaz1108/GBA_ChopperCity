typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
} SOUND;

void playMenuMusic();
void playGameMusic();
void playWinMusic();
void playerShotSound();
void playerHitSound();
void playRestoreHealthsound();
void playDeadSound();
void playLoseSound();
void playPauseSound();


void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency);
void playSoundB( const unsigned char* sound, int length, int frequency);
void muteSound();
void unmuteSound();
void stopSound();
void pauseSound();

void setupInterrupts();
void interruptHandler();
