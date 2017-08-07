#include "game.h"
#include "myLib.h"
#include <stdio.h>
#include "sound.h"
//updating the player
void updatePlayer(PLAYER *player)
{
    if(player->rowDel < 250)
        player->rowDel += player->gravAcc;

    if(BUTTON_HELD(BUTTON_LEFT) || BUTTON_HELD(BUTTON_RIGHT))

    //increase speed to the left if the left button is held
    if(BUTTON_HELD(BUTTON_LEFT))
    {
        if(player->col > 0)
            player->col -=2;
    }
    //increase speed to the right if the right button is held
    if(BUTTON_HELD(BUTTON_RIGHT))
    {
        if(player->col < 120)
            player->col += 2;
    }
    if(BUTTON_HELD(BUTTON_UP))
    {
        if(SHIFTDOWN(player->row) > 0) {
            if(player->rowDel > -250)
                player->rowDel -=20;
        }
            
    }
    if(BUTTON_HELD(BUTTON_DOWN))
    {
        if(SHIFTDOWN(player->row)< 144) {
            if(player->rowDel < 250)
               player->rowDel +=10; 
        }
            
    }



    player->row += player->rowDel;

    if(SHIFTDOWN(player->row )< 0)
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
    
    if(SHIFTDOWN(player->row) < 148) {
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
    bullet->row = SHIFTDOWN(player->row)+4;
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
    beam->row = SHIFTDOWN(player->row) + 4;
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
    bullet->row = SHIFTDOWN(player->row)+4;
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
    //bomb->col+=3;
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
    //if they overlap in columns
    if(col1 + w1 >= col2 && col1 + w1 <= col2 + w2)
    {
        //if one side is within the other's y coordinates or the left one is larger
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
    //if they overlap in rows
    if(row1 + h1 >= row2 && row1 + h1 <= row2 + h2)
    {
        //if one side is within the other's x coordinates or the left one is larger
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
        if(collideUp(SHIFTDOWN(player->row), player->col, player->height, player->width,
            airship->row, airship->col, 24, 62)
            || collideUp(airship->row, airship->col, 24, 62,
            SHIFTDOWN(player->row), player->col, player->height, player->width)) {
            playerHitSound();
            player->health--;
            airship->active = 0;
            airship->health = 0;

        } else {
            if(collideLeft(SHIFTDOWN(player->row), player->col, player->height, player->width,
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
        if(collideUp(SHIFTDOWN(player->row), player->col, player->height, player->width,
            beam->row, beam->col, 8, 16)
            || collideUp(beam->row, beam->col, 8, 16,
            SHIFTDOWN(player->row), player->col, player->height, player->width)) {
            playerHitSound();
            player->health--;
            beam->active = 0;

        } else {
            if(collideLeft(SHIFTDOWN(player->row), player->col, player->height, player->width,
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
        if(collideUp(SHIFTDOWN(player->row), player->col, player->height, player->width,
            beam->row, beam->col, 5, 5)
            || collideUp(beam->row, beam->col, 5, 5,
            SHIFTDOWN(player->row), player->col, player->height, player->width)) {
            playerHitSound();
            player->health--;
            beam->active = 0;

        } else {
            if(collideLeft(SHIFTDOWN(player->row), player->col, player->height, player->width,
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
        if(collideUp(SHIFTDOWN(player->row), player->col, player->height, player->width,
            medkit->row+8, medkit->col+2, 8, 8)
            || collideUp(medkit->row+8, medkit->col+2, 8, 8,
            SHIFTDOWN(player->row), player->col, player->height, player->width)) {

            player->health++;
            playRestoreHealthSound();
            medkit->hit = 1;
            medkit->active = 0;

        } else {
            if(collideLeft(SHIFTDOWN(player->row), player->col, player->height, player->width,
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