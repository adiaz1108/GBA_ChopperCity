# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
typedef struct
{

    int row;
 int col;
 int width;
 int height;
 int bigRow;
 int bigCol;
 int health;
 int rowFrame;
 int colFrame;
 int gravAcc;
 int rowDel;
 int charge;
 int score;
 int winning;
} PLAYER;

typedef struct
{


 int row;
 int col;
 int rowFrame;
 int colFrame;


 int active;
 int health;
 int cleared;
 int height;
 int width;

} AIRSHIP;

typedef struct
{
 int row;
 int col;
 int bigRow;
 int bigCol;
 int width;
 int height;
 int active;
 int hit;
 int passed;
 int rowFrame;
 int colFrame;
} BULLET;

typedef struct
{
 int row;
 int col;
 int bigRow;
 int bigCol;
 int width;
 int height;
 int active;
 int hit;
 int down;
 int rowFrame;
 int colFrame;
} MEDKIT;

typedef struct
{
 int row;
 int col;
 int width;
 int height;
 int health;
 int rowFrame;
 int colFrame;
 int del;
 int active;
} BOSS;

typedef struct
{
 int row;
 int col;
 int width;
 int height;
 int rowFrame;
 int colFrame;
 int active;
} BEAM;

typedef struct
{
 int row;
 int col;
 int chassisWidth;
 int chassisHeight;
 int gunWidth;
 int gunHeight;
 int rowFrame;
 int colFrame;
 int active;
} TANK;


void updatePlayer(PLAYER *player);

void updatePlayerBullet(BULLET *bullet);
void spawnPlayerBullet(BULLET *bullet, PLAYER *player);
void enemyHitCheck(BULLET *bullet, AIRSHIP *enemy, PLAYER *player);
void spawnAirship(AIRSHIP *airship);
void updateAirship(AIRSHIP *airship);
void spawnPlayerBeam(BEAM *beam, PLAYER *player);
void updatePlayerBeam(BEAM *beam);
void beamHitCheck(BEAM *beam, AIRSHIP *enemy, PLAYER *player);
void updateMedkit(MEDKIT *medkit);
void spawnMedkit(MEDKIT *medkit);

void spawnTank(TANK *tank);
void updateTank(TANK *tank);
int animateTank(int frame);

int animatePlayer(int frame);
void chargePlayer(PLAYER *player);

void healthUpCheck(MEDKIT *medkit, PLAYER *player);
void updateBeam(BEAM *beam);
void spawnBeam(BEAM *beam, BOSS *boss);
void updateBoss(BOSS *boss);
void spawnBoss(BOSS *boss);
void playerHitByBossCheck(BEAM *beam, PLAYER *player);
void bossHitCheck(BULLET *bullet, BOSS *enemy);

void bombHitCheck(BULLET *bullet, TANK *enemy, PLAYER *player);
void spawnBomb(BULLET *bullet, PLAYER *player);
void updateBomb(BULLET *bomb);

void killBoss(BOSS *boss);
# 2 "game.c" 2
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();
# 88 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 98 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 137 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 234 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 294 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 3 "game.c" 2
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 1 3
# 29 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 15 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/newlib.h" 1 3
# 16 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 1 3



# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 5 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 2 3
# 17 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
# 30 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 2 3




# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 211 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 35 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 2 3


# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stdarg.h" 1 3 4
# 40 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 38 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 2 3







# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 1 3
# 13 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 14 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 1 3
# 12 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_types.h" 1 3






# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 1 3
# 26 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t ;
typedef unsigned char __uint8_t ;
# 36 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed short __int16_t;
typedef unsigned short __uint16_t;
# 46 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
# 58 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
# 76 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
# 99 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed long long __int64_t;
typedef unsigned long long __uint64_t;
# 8 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_types.h" 2 3
# 13 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/lock.h" 1 3





typedef int _LOCK_T;
typedef int _LOCK_RECURSIVE_T;
# 14 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3


typedef long _off_t;







typedef int __dev_t;




typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



__extension__ typedef long long _off64_t;







typedef long _fpos_t;
# 56 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 3
typedef int _ssize_t;






# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 352 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 64 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;
# 15 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 37 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 89 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 105 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 169 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                     ;
  int (* _write) (struct _reent *, void *, const char *, int)
                            ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 273 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 305 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 579 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;


  struct _atexit *_atexit;
  struct _atexit _atexit0;


  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 817 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 46 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 1 3
# 69 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 149 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 323 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 70 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/types.h" 1 3
# 19 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/types.h" 3
typedef long int __off_t;
typedef int __pid_t;

__extension__ typedef long long int __loff_t;
# 71 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 2 3
# 92 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;



typedef unsigned short ushort;
typedef unsigned int uint;



typedef unsigned long clock_t;




typedef long time_t;




struct timespec {
  time_t tv_sec;
  long tv_nsec;
};

struct itimerspec {
  struct timespec it_interval;
  struct timespec it_value;
};


typedef long daddr_t;
typedef char * caddr_t;






typedef unsigned int ino_t;
# 162 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
typedef _off_t off_t;
typedef __dev_t dev_t;
typedef __uid_t uid_t;
typedef __gid_t gid_t;





typedef int pid_t;



typedef long key_t;

typedef _ssize_t ssize_t;
# 191 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
typedef unsigned int mode_t __attribute__ ((__mode__ (__SI__)));




typedef unsigned short nlink_t;
# 218 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
typedef long fd_mask;







typedef struct _types_fd_set {
 fd_mask fds_bits[(((64)+(((sizeof (fd_mask) * 8))-1))/((sizeof (fd_mask) * 8)))];
} _types_fd_set;
# 249 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 3
typedef unsigned long clockid_t;




typedef unsigned long timer_t;



typedef unsigned long useconds_t;
typedef long suseconds_t;

typedef __uint32_t fsblkcnt_t;
typedef __uint32_t fsfilcnt_t;

# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/features.h" 1 3
# 265 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/types.h" 2 3
# 47 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 2 3



typedef __FILE FILE;
# 59 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
typedef _fpos_t fpos_t;





# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/stdio.h" 1 3
# 66 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 2 3
# 175 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);
int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *, const char *, FILE *);
void setbuf (FILE *, char *);
int setvbuf (FILE *, char *, int, size_t);
int fprintf (FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int fscanf (FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int printf (const char *, ...) __attribute__ ((__format__ (__printf__, 1, 2)))
                                                            ;
int scanf (const char *, ...) __attribute__ ((__format__ (__scanf__, 1, 2)))
                                                           ;
int sscanf (const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int vfprintf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)))
                                                            ;
int vsprintf (char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int fgetc (FILE *);
char * fgets (char *, int, FILE *);
int fputc (int, FILE *);
int fputs (const char *, FILE *);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *, size_t _size, size_t _n, FILE *);
size_t fwrite (const void * , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *, fpos_t *);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *_name, const char *_type);
int sprintf (char *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int remove (const char *);
int rename (const char *, const char *);
# 246 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
int asiprintf (char **, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
char * asniprintf (char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * asnprintf (char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int asprintf (char **, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;

int diprintf (int, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;

int fcloseall (void);
int fiprintf (FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int fiscanf (FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int iprintf (const char *, ...) __attribute__ ((__format__ (__printf__, 1, 2)))
                                                            ;
int iscanf (const char *, ...) __attribute__ ((__format__ (__scanf__, 1, 2)))
                                                           ;
int siprintf (char *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int siscanf (const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int snprintf (char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int sniprintf (char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * tempnam (const char *, const char *);
int vasiprintf (char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
char * vasniprintf (char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
char * vasnprintf (char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vasprintf (char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vdiprintf (int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vfiprintf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vfiscanf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int vfscanf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int viprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)))
                                                            ;
int viscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)))
                                                           ;
int vscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)))
                                                           ;
int vsiprintf (char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vsiscanf (const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int vsniprintf (char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vsnprintf (char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vsscanf (const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
# 361 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
char * _asnprintf_r (struct _reent *, char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _asprintf_r (struct _reent *, char **, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _diprintf_r (struct _reent *, int, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _dprintf_r (struct _reent *, int, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *, int, FILE *);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fiscanf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
FILE * _fmemopen_r (struct _reent *, void *, size_t, const char *);
FILE * _fopen_r (struct _reent *, const char *, const char *);
FILE * _freopen_r (struct _reent *, const char *, const char *, FILE *);
int _fprintf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *, FILE *);
size_t _fread_r (struct _reent *, void *, size_t _size, size_t _n, FILE *);
int _fscanf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void * , size_t _size, size_t _n, FILE *);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _iscanf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *, const char *_old, const char *_new)
                                          ;
int _scanf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int _siprintf_r (struct _reent *, char *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _siscanf_r (struct _reent *, const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _snprintf_r (struct _reent *, char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _sprintf_r (struct _reent *, char *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _sscanf_r (struct _reent *, const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdprintf_r (struct _reent *, int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vfprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vprintf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _vscanf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsnprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsprintf_r (struct _reent *, char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 519 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 687 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdio.h" 3

# 4 "game.c" 2
# 1 "sound.h" 1
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
# 5 "game.c" 2

void updatePlayer(PLAYER *player)
{
    if(player->rowDel < 250)
        player->rowDel += player->gravAcc;

    if((~(*(volatile unsigned int *)0x04000130) & ((1<<5))) || (~(*(volatile unsigned int *)0x04000130) & ((1<<4))))


    if((~(*(volatile unsigned int *)0x04000130) & ((1<<5))))
    {
        if(player->col > 0)
            player->col -=2;
    }

    if((~(*(volatile unsigned int *)0x04000130) & ((1<<4))))
    {
        if(player->col < 120)
            player->col += 2;
    }
    if((~(*(volatile unsigned int *)0x04000130) & ((1<<6))))
    {
        if(((player->row) >> 8) > 0) {
            if(player->rowDel > -250)
                player->rowDel -=20;
        }

    }
    if((~(*(volatile unsigned int *)0x04000130) & ((1<<7))))
    {
        if(((player->row) >> 8)< 144) {
            if(player->rowDel < 250)
               player->rowDel +=10;
        }

    }



    player->row += player->rowDel;

    if(((player->row) >> 8)< 0)
        player->row = 0;
}

int animatePlayer(int frame)
{
    if(frame == 0)
        return 2;
    if(frame == 2)
        return 4;
    if(frame == 4)
        return 6;
    if(frame == 6)
        return 0;

}

void chargePlayer(PLAYER *player)
{
    if(player->charge < 5)
        player->charge++;
}

void killPlayer(PLAYER *player)
{

    if(((player->row) >> 8) < 148) {
        if(player->rowDel < 850)
           player->rowDel +=30;
    }
    player->row += player->rowDel;
}

void spawnPlayerBullet(BULLET *bullet, PLAYER *player)
{

    bullet->active = 1;
    bullet->height = 4;
    bullet->width = 6;
    bullet->row = ((player->row) >> 8)+4;
    bullet->col = player->col+24;
    bullet->hit = 0;
    bullet->passed = 0;
    bullet->bigRow = player->bigRow + 4;
    bullet->bigCol = player->bigCol+24;
    bullet->rowFrame = 8;
    bullet->colFrame = 0;
}


void updatePlayerBullet(BULLET *bullet)
{
   bullet->col += 6;
    if(bullet->col+bullet->width > 240)
    {
        bullet->active = 0;
        bullet->passed = 1;
    }
}


void spawnPlayerBeam(BEAM *beam, PLAYER *player)
{
    beam->active = 1;
    beam->height = 5;
    beam->width = 16;
    beam->rowFrame = 8;
    beam->colFrame = 8;
    beam->row = ((player->row) >> 8) + 4;
    beam->col = player->col + 20;
}

void updatePlayerBeam(BEAM *beam)
{
    beam->col+=3;
    if(beam->col > 240)
        beam->active = 0;
}

void spawnTank(TANK *tank)
{
    tank->active = 1;
    tank->row = 137;
    tank->col = -32;
    tank->chassisHeight = 15;
    tank->chassisWidth = 18;
    tank->gunWidth = 14;
    tank->gunHeight = 13;
    tank->rowFrame = 4;
    tank->colFrame = 9;
}

void updateTank(TANK *tank)
{
    tank->col++;
    if(tank->col > 240)
        tank->active = 0;
}



int animateTank(int frame)
{
    if(frame == 9)
        return 13;
    if(frame == 13)
        return 9;
}

void spawnBomb(BULLET *bullet, PLAYER *player)
{
    bullet->active = 1;
    bullet->height = 8;
    bullet->width = 8;
    bullet->row = ((player->row) >> 8)+4;
    bullet->col = player->col+16;
    bullet->hit = 0;
    bullet->passed = 0;
    bullet->bigRow = player->bigRow + 4;
    bullet->bigCol = player->bigCol+20;
    bullet->rowFrame = 8;
    bullet->colFrame = 1;
}

void updateBomb(BULLET *bomb)
{
    bomb->row+=3;

    if(bomb->row > 160)
        bomb->active = 0;
}

void spawnTankBullet(BULLET *bullet, TANK *tank)
{
    bullet->active = 1;
    bullet->row = tank->row;
    bullet->bigRow = tank->row;
    bullet->bigCol = tank->col;
    bullet->col = tank->col;
    bullet->rowFrame = 8;
    bullet->colFrame = 7;
    bullet->hit = 0;
    bullet->passed = 0;
    bullet->width = 5;
    bullet->height = 5;
}

void updateTankBullet(BULLET *bullet)
{
    bullet->row-=3;
    bullet->col-=3;
    if(bullet->row < 0 || bullet->col < 0)
        bullet->active = 0;
}

void spawnAirship(AIRSHIP *airship)
{

    airship->active = 1;
    airship->height = 26;
    airship->width = 62;
    airship->col = 302;
    airship->row = rand() % 5 * 30;
    airship->health = 3;
    airship->rowFrame = 0;
    airship->colFrame = 4;

}

void spawnMedkit(MEDKIT *medkit)
{
    medkit->active = 1;
    medkit->height = 8;
    medkit->width = 8;
    int top = rand() % 2;
    medkit->row = rand() % 5 * 10;
    medkit->col = 240;
    medkit->hit = 0;
    medkit->down = 0;
    medkit->rowFrame = 9;
    medkit->colFrame = 0;

}


void updateMedkit(MEDKIT *medkit)
{
    medkit->col -=3;
    medkit->row ++;
    if(medkit->row > 144 & medkit->col < -16)
    {
        medkit->down = 1;
        medkit->active = 0;
    }
}

void updateAirship(AIRSHIP *airship)
{
    airship-> col -=2;
    if(airship->col < -62 || airship->health == 0)
    {
        airship->cleared = 1;
        airship->active = 0;
    }
}

void enemyHitCheck(BULLET *bullet, AIRSHIP *enemy, PLAYER *player) {
    if(enemy->health > 0 && bullet->active){
        if(collideLeft(bullet->row, bullet->col, bullet->height, bullet->width,
            enemy->row, enemy->col, enemy->height, enemy->width)) {
            enemy->health--;
            bullet->hit = 1;
            bullet->active = 0;
            if(enemy->health == 0)
                player->score++;
        }
    }

}



void beamHitCheck(BEAM *beam, AIRSHIP *enemy, PLAYER *player)
{
    if(enemy->health > 0 && beam->active){
        if(collideLeft(beam->row, beam->col, beam->height, beam->width,
            enemy->row, enemy->col, enemy->height, enemy->width)) {
            enemy->health = 0;
            player->score++;
        }
    }
}

void bossHitCheck(BULLET *bullet, BOSS *enemy) {
    if(enemy->health > 0 && bullet->active){
        if(collideLeft(bullet->row, bullet->col, bullet->height, bullet->width,
            enemy->row, enemy->col, enemy->height, enemy->width)) {
            enemy->health--;
            bullet->hit = 1;
            bullet->active = 0;

        }
    }

}

void beamHitBossCheck(BEAM *bullet, BOSS *enemy) {
    if(enemy->health > 0 && bullet->active){
        if(collideLeft(bullet->row, bullet->col, bullet->height, bullet->width,
            enemy->row, enemy->col, enemy->height, enemy->width)
            || collideUp(bullet->row, bullet->col, bullet->height, bullet->width,
            enemy->row, enemy->col, enemy->height, enemy->width)
            || collideUp(enemy->row, enemy->col, enemy->height, enemy->width,
            bullet->row, bullet->col, bullet->height, bullet->width)) {
            if(enemy->health < 3)
                enemy->health = 0;
            else
                enemy->health-=3;
            bullet->active = 0;

        }
    }

}

void bombHitCheck(BULLET *bullet, TANK *enemy, PLAYER *player) {
    if(enemy->active && bullet->active){
        if(collideLeft(bullet->row, bullet->col, bullet->height, bullet->width,
            enemy->row, enemy->col, enemy->gunHeight, enemy->gunWidth)
            || collideUp(bullet->row, bullet->col, bullet->height, bullet->width,
            enemy->row, enemy->col, enemy->gunHeight, enemy->gunWidth)
            || collideLeft(bullet->row, bullet->col, bullet->height, bullet->width,
            enemy->row+8, enemy->col+8, enemy->chassisHeight, enemy->chassisWidth)
            || collideUp(bullet->row, bullet->col, bullet->height, bullet->width,
            enemy->row+8, enemy->col+8, enemy->chassisHeight, enemy->chassisWidth))
        {
            enemy->active = 0;
            bullet->active = 0;
            player->score += 2;
        }
    }
}

int collideLeft(int row1, int col1, int h1, int w1, int row2, int col2, int h2, int w2)
{

    if(col1 + w1 >= col2 && col1 + w1 <= col2 + w2)
    {

        if((row1 >= row2 && row1 <= row2 + h2)
            || (row1 + h1 <= row2 + h2 && row1 + h1 >= row2)
            || (row1 <= row2 && row1 + h1 >= row2 + h2))
        {
            return 1;
        } else {
            return 0;
        }
    } else {
        return 0;
    }
}

int collideUp(int row1, int col1, int h1, int w1, int row2, int col2, int h2, int w2)
{

    if(row1 + h1 >= row2 && row1 + h1 <= row2 + h2)
    {

        if((col1 >= col2 && col1 <= col2 + w2)
            || (col1 + w1 <= col2 + w2 && col1 + w1 >= col2)
            || (col1 <= col2 && col1 + w1 >= col2 + w2))
        {
            return 1;
        } else {
            return 0;
        }
    } else {
        return 0;
    }

}





void playerHitCheck(AIRSHIP *airship, PLAYER *player) {
    if(player->health > 0 && airship->active){
        if(collideUp(((player->row) >> 8), player->col, player->height, player->width,
            airship->row, airship->col, 24, 62)
            || collideUp(airship->row, airship->col, 24, 62,
            ((player->row) >> 8), player->col, player->height, player->width)) {
            playerHitSound();
            player->health--;
            airship->active = 0;
            airship->health = 0;

        } else {
            if(collideLeft(((player->row) >> 8), player->col, player->height, player->width,
            airship->row, airship->col, 24, 62))
            {
                playerHitSound();
                player->health--;
                airship->active = 0;
                airship->health = 0;
            }
        }
    }
}

void playerHitByBossCheck(BEAM *beam, PLAYER *player) {
    if(player->health > 0 && beam->active){
        if(collideUp(((player->row) >> 8), player->col, player->height, player->width,
            beam->row, beam->col, 8, 16)
            || collideUp(beam->row, beam->col, 8, 16,
            ((player->row) >> 8), player->col, player->height, player->width)) {
            playerHitSound();
            player->health--;
            beam->active = 0;

        } else {
            if(collideLeft(((player->row) >> 8), player->col, player->height, player->width,
            beam->row, beam->col, 8, 16))
            {
                playerHitSound();
                player->health--;
                beam->active = 0;
            }
        }
    }
}


void playerHitByTankCheck(BULLET *beam, PLAYER *player) {
    if(player->health > 0 && beam->active){
        if(collideUp(((player->row) >> 8), player->col, player->height, player->width,
            beam->row, beam->col, 5, 5)
            || collideUp(beam->row, beam->col, 5, 5,
            ((player->row) >> 8), player->col, player->height, player->width)) {
            playerHitSound();
            player->health--;
            beam->active = 0;

        } else {
            if(collideLeft(((player->row) >> 8), player->col, player->height, player->width,
            beam->row, beam->col, 5, 5))
            {
                playerHitSound();
                player->health--;
                beam->active = 0;
            }
        }
    }
}

void healthUpCheck(MEDKIT *medkit, PLAYER *player) {
    if(player->health < 5 && medkit->active) {
        if(collideUp(((player->row) >> 8), player->col, player->height, player->width,
            medkit->row+8, medkit->col+2, 8, 8)
            || collideUp(medkit->row+8, medkit->col+2, 8, 8,
            ((player->row) >> 8), player->col, player->height, player->width)) {

            player->health++;
            playRestoreHealthSound();
            medkit->hit = 1;
            medkit->active = 0;

        } else {
            if(collideLeft(((player->row) >> 8), player->col, player->height, player->width,
            medkit->row+8, medkit->col+2, 8, 8))
            {
                player->health++;
                playRestoreHealthSound();
                medkit->hit = 1;
                medkit->active = 0;
            }
        }
    }
}


void spawnBoss(BOSS *boss)
{
    boss->active = 1;
    boss->row = 32;
    boss->col = 240;
    boss->rowFrame = 0;
    boss->colFrame = 12;
    boss->health = 10;
    boss->width = 62;
    boss->height = 29;
    boss->del = 0;

}

void updateBoss(BOSS *boss)
{
    if(boss->row < rand() % 4 * 10 + 10)
        boss->del = 1;

    if(boss->row > rand() % 4 * 10 + 90)
        boss->del = -1;

    boss->row += boss->del;
}

void killBoss(BOSS *boss)
{
    if(boss->row < 165)
        boss->row += 2;
    else
        boss->active = 0;
}


void spawnBeam(BEAM *beam, BOSS *boss)
{
    beam->active = 1;
    beam->col = boss->col + 3;
    beam->row = boss->row + 11;
    beam->colFrame = 4;
    beam->rowFrame = 8;
    beam->width = 16;
    beam->height = 8;
}

void updateBeam(BEAM *beam)
{
    beam->col -= 3;
    if(beam->col < -16)
        beam->active = 0;
}
