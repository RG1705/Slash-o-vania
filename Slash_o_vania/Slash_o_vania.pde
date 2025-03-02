PImage town1Sprite;
PImage town2Sprite;
PImage backgroundSprite;
PImage moonSprite;



int winCounter;
int killCounter;
int loseCounter;
int deathcounter;


int playerX;
int playerY;
int playerSize;
int swordDistance = 20;

int creature1XOrigin = -10;
int creature2XOrigin = -10;
int creature3XOrigin = -10;
int creature4XOrigin = 450;
int creature5XOrigin = 450;
int creature6XOrigin = 450;
int creature7XOrigin = 910;
int creature8XOrigin = 910;
int creature9XOrigin = 910;
int creature1YOrigin = 80;
int creature2YOrigin = 80;
int creature3YOrigin = 80;
int creature4YOrigin = -10;
int creature5YOrigin = -10;
int creature6YOrigin = -10;
int creature7YOrigin = 80;
int creature8YOrigin = 80;
int creature9YOrigin = 80;
int creature1X = -10;
int creature2X = -10;
int creature3X = -10;
int creature4X = 450;
int creature5X = 450;
int creature6X = 450;
int creature7X = 910;
int creature8X = 910;
int creature9X = 910;
int creature1Y = 70;
int creature2Y = 70;
int creature3Y = 70;
int creature4Y = -10;
int creature5Y = -10;
int creature6Y = -10;
int creature7Y = 80;
int creature8Y = 80;
int creature9Y = 80;
int creatureSize = 50;


int minPlatformDistance1 = 200;
int minPlatformDistance2 = 200;
int platform1X = 0;
int platform2X = 700;
int platform1Y = 90;
int platform2Y = 90;

int timeDelay1 = (int)random(2,6);
int timeDelay2 = (int)random(2,6);
int timeDelay3 = (int)random(2,6);
int timeDelay4 = (int)random(2,6);
int timeDelay5 = (int)random(2,6);
int timeDelay6 = (int)random(2,6);
int timeDelay7 = (int)random(2,6);
int timeDelay8 = (int)random(2,6);
int timeDelay9 = (int)random(2,6);

int rate = 60;

int totaltimeDelay1 = timeDelay1 * rate;
int totaltimeDelay2 = timeDelay2 * rate;
int totaltimeDelay3 = timeDelay3 * rate;
int totaltimeDelay4 = timeDelay4 * rate;
int totaltimeDelay5 = timeDelay5 * rate;
int totaltimeDelay6 = timeDelay6 * rate;
int totaltimeDelay7 = timeDelay7 * rate;
int totaltimeDelay8 = timeDelay8 * rate;
int totaltimeDelay9 = timeDelay9 * rate;



float creature1VelocityX;
float creature1VelocityY;
float creature2VelocityX;
float creature2VelocityY;
float creature3VelocityX;
float creature3VelocityY;
float creature4VelocityX;
float creature4VelocityY;
float creature5VelocityX;
float creature5VelocityY;
float creature6VelocityX;
float creature6VelocityY;
float creature7VelocityX;
float creature7VelocityY;
float creature8VelocityX;
float creature8VelocityY;
float creature9VelocityX;
float creature9VelocityY;

boolean Won;
boolean Lost;

PFont PlayerStat;
PFont CreatureStat;

void setup()
{
  size(900,900);
  frameRate(rate);
  backgroundSprite = loadImage("backgroundnomosaic1.png");
  town1Sprite = loadImage("rowofhousesfront1.png");
  town2Sprite = loadImage("rowofhousesback1.png");
  moonSprite = loadImage("gamemoon1.png");
}

void draw()
{
  

  noCursor();
  image(backgroundSprite,0,0,900,900);
  image(moonSprite,370,90,150,150);
  image(town2Sprite,0,700,900,200);
  rect(platform1X,platform1Y,200,50);
  rect(platform2X,platform2Y,200,50);
  
  int seconds1 = (totaltimeDelay1 - frameCount)/rate;
  int seconds2 = (totaltimeDelay2 - frameCount)/rate;
  int seconds3 = (totaltimeDelay3 - frameCount)/rate;
  int seconds4 = (totaltimeDelay4 - frameCount)/rate;
  int seconds5 = (totaltimeDelay5 - frameCount)/rate;
  int seconds6 = (totaltimeDelay6 - frameCount)/rate;
  int seconds7 = (totaltimeDelay7 - frameCount)/rate;
  int seconds8 = (totaltimeDelay8 - frameCount)/rate;
  int seconds9 = (totaltimeDelay9 - frameCount)/rate;
  
  
  
  if (seconds1 <= 0){
    
    
    creature1(creature1X,creature1Y,creatureSize);
    
      creature1X = creature1X + (int)creature1VelocityX;
  creature1Y = creature1Y + (int)creature1VelocityY;
  
    int dist1 = (int)distancePlatform1((int)creature1X, (int)creature1Y, (int)platform1X, (int)platform1Y);
  
  if(dist1 < minPlatformDistance1)
  {
    creature1VelocityY = 0;
    creature1VelocityX = 1;
    
    
  }else
  {
    
    creature1VelocityY = random(2,3);
    creature1VelocityX = random(1,3);
  }
  }
  
  if (seconds2 <= 0){
    
    
    creature2(creature2X,creature2Y,creatureSize);
    
      creature2X = creature2X + (int)creature2VelocityX;
  creature2Y = creature2Y + (int)creature2VelocityY;
  
    int dist2 = (int)distancePlatform1((int)creature2X, (int)creature2Y, (int)platform1X, (int)platform1Y);
  
  if(dist2 < minPlatformDistance1)
  {
    creature2VelocityY = 0;
    creature2VelocityX = 1;
    
    
  }else
  {
    
    creature2VelocityY = random(2,3);
    creature2VelocityX = random(1,3);
  }
  }
  
  if (seconds3 <= 0){
    
    
    creature3(creature3X,creature3Y,creatureSize);
    
      creature3X = creature3X + (int)creature3VelocityX;
  creature3Y = creature3Y + (int)creature3VelocityY;
  
    int dist3 = (int)distancePlatform1((int)creature3X, (int)creature3Y, (int)platform1X, (int)platform1Y);
  
  if(dist3 < minPlatformDistance1)
  {
    creature3VelocityY = 0;
    creature3VelocityX = 1;
    
    
  }else
  {
    
    creature3VelocityY = random(2,3);
    creature3VelocityX = random(1,3);
  }
  }
  
 
  

  
  

  
 
  
  image(town1Sprite,0,700,900,200);
  
  
  
  
  
}


void creature1(int x, int y, int size)
{
  
  ellipse(x,y,size,size);
  
  
}
void creature2(int x, int y, int size)
{
  
  ellipse(x,y,size,size);
  
  
}
void creature3(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  
}
void creature4(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  
}
  

void creature5(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  
}

  
  
  
  


void creature6(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  
}






void creature7(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  
}

  
  
  
  


void creature8(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  
}

  


void creature9(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  
}

  
  
  
  

float distancePlatform1(int x1, int y1, int x2, int y2)
{
  
  int XDist = abs(x1-x2);
  
  int YDist = abs(y1-y2);
  
  return sqrt((XDist*XDist)+(YDist * YDist));
  
  
}

float distancePlatform2(int x1, int y1, int x2, int y2)
{
  
  int XDist = abs(x1-x2);
  
  int YDist = abs(y1-y2);
  
  return sqrt((XDist*XDist)+(YDist * YDist));
  
  
}

float distanceSword(int x1, int y1, int x2, int y2)
{
  
  int XDist = abs(x1-x2);
  
  int YDist = abs(y1-y2);
  
  return sqrt((XDist*XDist)+(YDist * YDist));
  
  
}
