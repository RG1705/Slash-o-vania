PImage town1Sprite;
PImage town2Sprite;
PImage backgroundSprite;
PImage moonSprite;


int creature1Amount; // number of creatures spawning on left side
int creature2Amount; // number of creatures spawning on right side
int creature3Amount; // number of creatures spawning from above


int winCounter;
int killCounter;
int loseCounter;
int deathcounter;
int playerX;
int playerY;
int playerSize;


int creature1X = -10;
int creature2X = 910;
int creature3X = 450;
int creature1Y = 80;
int creature2Y = 80;
int creature3Y = -10;
int creatureSize = 50;


int minPlatformDistance1 = 20;
int minPlatformDistance2 = 20;
int platform1X;
int platform2X;

float Timer1;
float Timer2;
float Timer3;

float creature1VelocityX;
float creature1VelocityY;
float creature12VelocityX;
float creature2VelocityY;
float creature3VelocityX;
float creature3VelocityY;

boolean Won;
boolean Lost;

PFont PlayerStat;
PFont CreatureStat;

void setup()
{
  size(900,900);
  backgroundSprite = loadImage("backgroundnomosaic1.png");
  town1Sprite = loadImage("rowofhousesfront1.png");
  town2Sprite = loadImage("rowofhousesback1.png");
  moonSprite = loadImage("gamemoon1.png");
}

void draw()
{
  image(backgroundSprite,0,0,900,900);
  image(moonSprite,370,90,150,150);
  image(town2Sprite,0,700,900,200);
  image(town1Sprite,0,700,900,200);
  
  
  
  
  
}
