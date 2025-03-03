PImage town1Sprite;
PImage town2Sprite;
PImage backgroundSprite;
PImage moonSprite;

PFont gothicFont;

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

int timeDelay1 = (int)random(2,20);
int timeDelay2 = (int)random(2,20);
int timeDelay3 = (int)random(2,20);
int timeDelay4 = (int)random(2,20);
int timeDelay5 = (int)random(2,20);
int timeDelay6 = (int)random(2,20);
int timeDelay7 = (int)random(2,20);
int timeDelay8 = (int)random(2,20);
int timeDelay9 = (int)random(2,20);

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

int seconds1;
int seconds2;
int seconds3;
int seconds4;
int seconds5;
int seconds6;
int seconds7;
int seconds8;
int seconds9;


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
float creature1VelocityXFall = random(1,3);
float creature1VelocityYFall = random(2,3);
float creature2VelocityXFall = random(1,3);
float creature2VelocityYFall = random(2,3);
float creature3VelocityXFall = random(1,3);
float creature3VelocityYFall = random(2,3);
float creature4VelocityXFall = random(-2,2);
float creature4VelocityYFall = random(2,3);
float creature5VelocityXFall = random(-2,2);
float creature5VelocityYFall = random(2,3);
float creature6VelocityXFall = random(-2,2);
float creature6VelocityYFall = random(2,3);
float creature7VelocityXFall = random(1,3);
float creature7VelocityYFall = random(2,3);
float creature8VelocityXFall = random(1,3);
float creature8VelocityYFall = random(2,3);
float creature9VelocityXFall = random(1,3);
float creature9VelocityYFall = random(2,3);

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
    gothicFont = loadFont("OldEnglishTextMT-48.vlw");//the counter text font
  textFont(gothicFont);
}

void draw()
{
  

  noCursor();
  image(backgroundSprite,0,0,900,900);
  image(moonSprite,370,90,150,150);
  image(town2Sprite,0,700,900,200);
    fill(255, 30, 40);
  textSize(30);
  textAlign(CENTER);
  int center=900/2;
  text("Foes Slain:"+killCounter, center, 65);

  
  seconds1 = (totaltimeDelay1 - frameCount)/rate;
  seconds2 = (totaltimeDelay2 - frameCount)/rate;
  seconds3 = (totaltimeDelay3 - frameCount)/rate;
  seconds4 = (totaltimeDelay4 - frameCount)/rate;
  seconds5 = (totaltimeDelay5 - frameCount)/rate;
  seconds6 = (totaltimeDelay6 - frameCount)/rate;
  seconds7 = (totaltimeDelay7 - frameCount)/rate;
  seconds8 = (totaltimeDelay8 - frameCount)/rate;
  seconds9 = (totaltimeDelay9 - frameCount)/rate;
  
  
  
   println(seconds1);
  
  
  if (seconds1 <= 0){
    
    creature1(creature1X,creature1Y,creatureSize);
    
    
    if (creature1Y > height + 10){
      creature1X = creature1XOrigin;
      creature1X = creature1YOrigin;
      creature1VelocityX = 0;
      creature1VelocityY = 0;
      
    }
     
  }
  
  if (seconds2 <= 0){
    
    
    creature2(creature2X,creature2Y,creatureSize);
    
    
  }
  
   if (seconds3 <= 0){
    
     
     creature3(creature3X,creature3Y,creatureSize);
     
    
  }
  
  if (seconds4 <= 0){
    
    
    creature4(creature4X,creature4Y,creatureSize);
    
      
  
  }
  
  if (seconds5 <= 0){
    
    
    creature5(creature5X,creature5Y,creatureSize);
    
      
  
  }
  
    if (seconds6 <= 0){
    
    
    creature6(creature6X,creature6Y,creatureSize);
    
      
  
  }
  
  if (seconds7 <= 0){
    
    
    creature7(creature7X,creature7Y,creatureSize);
    
      
  
  }
  
  if (seconds8 <= 0){
    
    
    creature8(creature8X,creature8Y,creatureSize);
    
      
  
  }
  
  if (seconds9 <= 0){
    
    
    creature9(creature9X,creature9Y,creatureSize);
    
      
  
  }
  

  
  rect(platform1X,platform1Y,200,50);
  rect(platform2X,platform2Y,200,50);

  
 
  
  image(town1Sprite,0,700,900,200);
  
  
  
  
  
}


void creature1(int x, int y, int size)
{
  
  ellipse(x,y,size,size);
   creature1X = creature1X + (int)creature1VelocityX;
  creature1Y = creature1Y + (int)creature1VelocityY;
  
    int dist1 = (int)distancePlatform1((int)creature1X, (int)creature1Y, (int)platform1X, (int)platform1Y);
 
  
  if(dist1 < minPlatformDistance1)
  {
    creature1VelocityY = 0;
    creature1VelocityX = 1;
    
    
  }else
  {
    
    creature1VelocityY = creature1VelocityYFall;
    creature1VelocityX = creature1VelocityXFall;
  }
  
  
}
void creature2(int x, int y, int size)
{
  
  ellipse(x,y,size,size);
  
    creature2X = creature2X + (int)creature2VelocityX;
  creature2Y = creature2Y + (int)creature2VelocityY;
  
    int dist2 = (int)distancePlatform1((int)creature2X, (int)creature2Y, (int)platform1X, (int)platform1Y);
  
  if(dist2 < minPlatformDistance1)
  {
    creature2VelocityY = 0;
    creature2VelocityX = 1;
    
    
  }else
  {
    
    creature2VelocityY = creature2VelocityYFall;
    creature2VelocityX = creature2VelocityXFall;
  }
  
  
}
void creature3(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  
  creature3X = creature3X + (int)creature3VelocityX;
  creature3Y = creature3Y + (int)creature3VelocityY;
  
    int dist3 = (int)distancePlatform1((int)creature3X, (int)creature3Y, (int)platform1X, (int)platform1Y);
  
  if(dist3 < minPlatformDistance1)
  {
    creature3VelocityY = 0;
    creature3VelocityX = 1;
    
    
  }else
  {
    
    creature3VelocityY = creature3VelocityYFall;
    creature3VelocityX = creature3VelocityXFall;
  }
  
}
void creature4(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  creature4X = creature4X + (int)creature4VelocityX;
  creature4Y = creature4Y + (int)creature4VelocityY;
  
   
    creature4VelocityY = creature4VelocityYFall;
    creature4VelocityX = creature4VelocityXFall;
}
  

void creature5(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  creature5X = creature5X + (int)creature5VelocityX;
  creature5Y = creature5Y + (int)creature5VelocityY;
  
   
    creature5VelocityY = creature5VelocityYFall;
    creature5VelocityX = creature5VelocityXFall;
  
}

  
  
  
  


void creature6(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  creature6X = creature6X + (int)creature6VelocityX;
  creature6Y = creature6Y + (int)creature6VelocityY;
  
   
    creature6VelocityY = creature6VelocityYFall;
    creature6VelocityX = creature6VelocityXFall;
  
}






void creature7(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  
  creature7X = creature7X - (int)creature7VelocityX;
  creature7Y = creature7Y + (int)creature7VelocityY;
  
    int dist7 = (int)distancePlatform2((int)creature7X, (int)creature7Y, (int)platform2X+230, (int)platform2Y);
  
  if(dist7 < minPlatformDistance2 + 20)
  {
    creature7VelocityY = 0;
    creature7VelocityX = 1;
    
    
  }else
  {
    
    creature7VelocityY = creature7VelocityYFall;
    creature7VelocityX = creature7VelocityXFall;
  }
  
}

  
  
  
  


void creature8(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  creature8X = creature8X - (int)creature8VelocityX;
  creature8Y = creature8Y + (int)creature8VelocityY;
  
    int dist8 = (int)distancePlatform2((int)creature8X, (int)creature8Y, (int)platform2X+230, (int)platform2Y);
  
  if(dist8 < minPlatformDistance2 + 20)
  {
    creature8VelocityY = 0;
    creature8VelocityX = 1;
    
    
  }else
  {
    
    creature8VelocityY = creature8VelocityYFall;
    creature8VelocityX = creature8VelocityXFall;
  }
  
  
  
}



  


void creature9(int x, int y, int size)
{
  
  
  ellipse(x,y,size,size);
  
  creature9X = creature9X - (int)creature9VelocityX;
  creature9Y = creature9Y + (int)creature9VelocityY;
  
    int dist9 = (int)distancePlatform2((int)creature9X, (int)creature9Y, (int)platform2X+230, (int)platform2Y);
  
  if(dist9 < minPlatformDistance2 + 20)
  {
    creature9VelocityY = 0;
    creature9VelocityX = 1;
    
    
  }else
  {
    
    creature9VelocityY = creature9VelocityYFall;
    creature9VelocityX = creature9VelocityXFall;
  }
  
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
