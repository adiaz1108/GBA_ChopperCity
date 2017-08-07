typedef struct
{
	//dimensions
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

	//position and dimensions
	int row;
	int col;
	int rowFrame;
	int colFrame;
	//int bigRow;
	//int bigCol;
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

//prototypes for updates and checks
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
/*
void updateEnemy(INVADER *invader, int count);
void spawnEnemyBullet(BULLET *bullet, INVADER *enemy);
void updateEnemyBullet(BULLET *bullet);

*/