

PImage town1Sprite;
PImage town2Sprite;
PImage backgroundSprite;
PImage moonSprite;
PImage platL;
PImage platR;
PImage swordCursor;

PFont gothicFont;

int winCounter;  //Total amount of kills to win
int killCounter = 20; //amount of creatures killed
int loseCounter = 20; //Total amount of creatures that need to land for a loss
int deathCounter; //How many creatures have landed


int playerX; //player's X position
int playerY;//player's Y position
int playerSize; //Player's size
int minSwordDistance = 30; //Minimum distance for sword to hit

//Original X and Y positions of each creature
int creature1XOrigin = -10;
int creature2XOrigin = -10;
int creature3XOrigin = -10;
int creature4XOrigin = 450;
int creature5XOrigin = 450;
int creature6XOrigin = 450;
int creature7XOrigin = 910;
int creature8XOrigin = 910;
int creature9XOrigin = 910;
int creature1YOrigin = 70;
int creature2YOrigin = 70;
int creature3YOrigin = 70;
int creature4YOrigin = -10;
int creature5YOrigin = -10;
int creature6YOrigin = -10;
int creature7YOrigin = 70;
int creature8YOrigin = 70;
int creature9YOrigin = 70;

//Current positions of each creatures
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
int creature7Y = 70;
int creature8Y = 70;
int creature9Y = 70;
int creatureSize = 50;

//minimum distance for platforms to be considered collided
int minPlatformDistance1 = 200;
int minPlatformDistance2 = 200;

//X and Y values of platforms
int platform1X = 0;
int platform2X = 700;
int platform1Y = 90;
int platform2Y = 90;

//Amount of seconds until a creature spawns
int timeDelay1 = (int)random(2, 20);
int timeDelay2 = (int)random(2, 20);
int timeDelay3 = (int)random(2, 20);
int timeDelay4 = (int)random(2, 20);
int timeDelay5 = (int)random(2, 20);
int timeDelay6 = (int)random(2, 20);
int timeDelay7 = (int)random(2, 20);
int timeDelay8 = (int)random(2, 20);
int timeDelay9 = (int)random(2, 20);

//framerate
int rate = 60;

//Amount of frames until a creature spawns
int remainingtimeDelay1 = timeDelay1 * rate;
int remainingtimeDelay2 = timeDelay2 * rate;
int remainingtimeDelay3 = timeDelay3 * rate;
int remainingtimeDelay4 = timeDelay4 * rate;
int remainingtimeDelay5 = timeDelay5 * rate;
int remainingtimeDelay6 = timeDelay6 * rate;
int remainingtimeDelay7 = timeDelay7 * rate;
int remainingtimeDelay8 = timeDelay8 * rate;
int remainingtimeDelay9 = timeDelay9 * rate;


//Speed and direction the creatures are going
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


boolean Won; //Whether or not the player wins the game
boolean Lost; //Whether or not the player loses the game

//Determines whether or not the creatures reset(When they land)
boolean timeReset1;
boolean timeReset2;
boolean timeReset3;
boolean timeReset4;
boolean timeReset5;
boolean timeReset6;
boolean timeReset7;
boolean timeReset8;
boolean timeReset9;

//Determines if a random velocity shold be retrieved
boolean randomVelocityLeft1;
boolean randomVelocityLeft2;
boolean randomVelocityLeft3;
boolean randomVelocityRight1;
boolean randomVelocityRight2;
boolean randomVelocityRight3;
boolean randomVelocityUp1;
boolean randomVelocityUp2;
boolean randomVelocityUp3;

//booleans for when the creatures are killed
boolean creature1Killed;
boolean creature2Killed;
boolean creature3Killed;
boolean creature4Killed;
boolean creature5Killed;
boolean creature6Killed;
boolean creature7Killed;
boolean creature8Killed;
boolean creature9Killed;

PFont PlayerStat;
PFont CreatureStat;

void setup()
{
  size(900, 900);
  frameRate(rate);
  backgroundSprite = loadImage("backgroundnomosaic1.png");
  town1Sprite = loadImage("rowofhousesfront1.png");
  town2Sprite = loadImage("rowofhousesback1.png");
  moonSprite = loadImage("gamemoon1.png");
  platL =loadImage("platformL.png");
  platR = loadImage("platformR.png");
  swordCursor =loadImage("swordcursor1.png");
  gothicFont = loadFont("OldEnglishTextMT-48.vlw");//the counter text font
  textFont(gothicFont);
}

void draw()
{


  noCursor();
  image(backgroundSprite, 0, 0, 900, 900);
  image(moonSprite, 370, 90, 150, 150);
  image(town2Sprite, 0, 700, 900, 200);
  fill(255);
  rect(platform1X, platform1Y, 200, 50);
  rect(platform2X, platform2Y, 200, 50);

  image(swordCursor, mouseX, 450);
  image(platR, 700, 90); //adds overlay platform on right
  image(platL, 0, 90); //adds overlay platform on left

  fill(255, 30, 40); //sets text color
  textSize(30);
  textAlign(CENTER);
  int center=900/2;
  text("Foes Slain:"+killCounter, center, 65);
  fill(255, 200, 0);
  text("Victory = 20 Kills", 850, 215);
  fill(255);
  text("Loss = 15 missed", 780, 270);

  //Makes the timers for each creature decrease every frame
  remainingtimeDelay1--;
  remainingtimeDelay2--;
  remainingtimeDelay3--;
  remainingtimeDelay4--;
  remainingtimeDelay5--;
  remainingtimeDelay6--;
  remainingtimeDelay7--;
  remainingtimeDelay8--;
  remainingtimeDelay9--;

  //N = respective creature number
  //After remainingtimeDelayN is 0 or below, creature N's function will activate
  if (remainingtimeDelay1 <= 0) {

    creature1(creature1X, creature1Y, creatureSize); //CreatureN function


    //If the creature reaches the ground, time Reset is true
    if (creature1Y > height + 10) {



      timeReset1 = true;
    }
  }

  //If timeResetN is true, randomize the time until the creature respawns
  if (timeReset1) {

    remainingtimeDelay1 = (int)random(120, 1200); //Randomizes the time
    creature1X = creature1XOrigin;
    creature1Y = creature1YOrigin;
    creature1VelocityX = 0;
    creature1VelocityY = 0;

deathCounter --;

    //Sets itself back to false
    timeReset1 = false;
  }


  if (remainingtimeDelay2 <= 0) {


    creature2(creature2X, creature2Y, creatureSize);

    if (creature2Y > height + 10) {



      timeReset2 = true;
    }
  }

  if (timeReset2) {

    remainingtimeDelay2 = (int)random(120, 1200);
    creature2X = creature2XOrigin;
    creature2Y = creature2YOrigin;
    creature2VelocityX = 0;
    creature2VelocityY = 0;

deathCounter --;

    timeReset2 = false;
  }

  if (remainingtimeDelay3 <= 0) {


    creature3(creature3X, creature3Y, creatureSize);

    if (creature3Y > height + 10) {



      timeReset3 = true;
    }
  }

  if (timeReset3) {

    remainingtimeDelay3 = (int)random(120, 1200);
    creature3X = creature3XOrigin;
    creature3Y = creature3YOrigin;
    creature3VelocityX = 0;
    creature3VelocityY = 0;

deathCounter --;

    timeReset3 = false;
  }

  if (remainingtimeDelay4 <= 0) {


    creature4(creature4X, creature4Y, creatureSize);

    if (creature4Y > height + 10) {



      timeReset4 = true;
    }
  }


  if (timeReset4) {

    remainingtimeDelay4 = (int)random(120, 1200);
    creature4X = creature4XOrigin;
    creature4Y = creature4YOrigin;
    creature4VelocityX = 0;
    creature4VelocityY = 0;
    
    deathCounter --;

    timeReset4 = false;
  }

  if (remainingtimeDelay5 <= 0) {


    creature5(creature5X, creature5Y, creatureSize);

    if (creature5Y > height + 10) {



      timeReset5 = true;
    }
  }

  if (timeReset5) {

    remainingtimeDelay5 = (int)random(120, 1200);
    creature5X = creature5XOrigin;
    creature5Y = creature5YOrigin;
    creature5VelocityX = 0;
    creature5VelocityY = 0;

deathCounter --;

   timeReset5 = false;
  }

  if (remainingtimeDelay6 <= 0) {


    creature6(creature6X, creature6Y, creatureSize);
    if (creature6Y > height + 10) {



      timeReset6 = true;
    }
  }
  if (timeReset6) {

    remainingtimeDelay6 = (int)random(120, 1200);
    creature6X = creature6XOrigin;
    creature6Y = creature6YOrigin;
    creature6VelocityX = 0;
    creature6VelocityY = 0;

deathCounter --;

    timeReset6 = false;
  }

  if (remainingtimeDelay7 <= 0) {


    creature7(creature7X, creature7Y, creatureSize);

    if (creature7Y > height + 10) {



      timeReset7 = true;
    }
  }

  if (timeReset7) {

    remainingtimeDelay7 = (int)random(120, 1200);
    creature7X = creature7XOrigin;
    creature7Y = creature7YOrigin;
    creature7VelocityX = 0;
    creature7VelocityY = 0;

deathCounter --;

    timeReset7 = false;
  }

  if (remainingtimeDelay8 <= 0) {


    creature8(creature8X, creature8Y, creatureSize);

    if (creature8Y > height + 10) {



      timeReset8 = true;
    }
  }

  if (timeReset8) {

    remainingtimeDelay8 = (int)random(120, 1200);
    creature8X = creature8XOrigin;
    creature8Y = creature8YOrigin;
    creature8VelocityX = 0;
    creature8VelocityY = 0;

deathCounter --;

    timeReset8 = false;
  }


  if (remainingtimeDelay9 <= 0) {


    creature9(creature9X, creature9Y, creatureSize);
    if (creature9Y > height + 10) {



      timeReset9 = true;
    }
  }


  if (timeReset9) {

    remainingtimeDelay9 = (int)random(120, 1200);
    creature9X = creature9XOrigin;
    creature9Y = creature9YOrigin;
    creature9VelocityX = 0;
    creature9VelocityY = 0;

deathCounter --;

    timeReset9 = false;
  }



playerX = mouseX;
  playerY = 450;
   image(swordCursor, playerX, playerY);
  image(town1Sprite, 0, 700, 900, 200);
  
}


//creatureN creation function
void creature1(int x, int y, int size)
{
  
  ellipse(x,y,size,size); //Creates the creature based on x, y and size
   creature1X = creature1X + (int)creature1VelocityX; //Determines creature's horiz speed and direction
  creature1Y = creature1Y + (int)creature1VelocityY; //Determines creature's vert speed and direction
  
  //distance equation which determines the distance between the creature and the platform
    int dist1 = (int)distancePlatform1((int)creature1X, (int)creature1Y, (int)platform1X, (int)platform1Y);
    
    int distKill = (int)distanceSword((int)creature1X, (int)creature1Y, (int)playerX, (int)playerY);

 if(distKill < minSwordDistance)
  {
    creature1Killed = true;
    
    
  }
  
  if(creature1Killed)
  {
    
    remainingtimeDelay1 = (int)random(120,1200); //Randomizes the time
       
       //Creature resets to original position
       creature1X = creature1XOrigin;
      creature1Y = creature1YOrigin;
      
      //Creature stops moving
      creature1VelocityX = 0;
      creature1VelocityY = 0;
      
     killCounter--;
     
        //Sets itself back to false
        creature1Killed = false;
    
  }
  
 
 
  //While the creature is on the platform, it moves toward the edge
  if(dist1 < minPlatformDistance1)
  {
    creature1VelocityY = 0;
    creature1VelocityX = 1;
    
    
    //If the creature goes off the platform, randomize the velocity
  }else if (dist1 > minPlatformDistance1 && creature1VelocityY == 0)
  {
    randomVelocityLeft1 = true;
    
  }
  
  if(randomVelocityLeft1)
  {
    
    creature1VelocityY = random(2,3); //Randomizes fall speed
    creature1VelocityX = random(1,3); //Randomizes trajectory
    
    //Makes itself false so it only happens once
    randomVelocityLeft1 = false;
  }
  
  
  
}
void creature2(int x, int y, int size)
{

  ellipse(x, y, size, size);

  creature2X = creature2X + (int)creature2VelocityX;
  creature2Y = creature2Y + (int)creature2VelocityY;

  int dist2 = (int)distancePlatform1((int)creature2X, (int)creature2Y, (int)platform1X, (int)platform1Y);

    int distKill = (int)distanceSword((int)creature2X, (int)creature2Y, (int)playerX, (int)playerY);

 if(distKill < minSwordDistance)
  {
    creature2Killed = true;
    
    
  }
  
  if(creature2Killed)
  {
    
    remainingtimeDelay2 = (int)random(120,1200); //Randomizes the time
       
       //Creature resets to original position
       creature2X = creature2XOrigin;
      creature2Y = creature2YOrigin;
      
      //Creature stops moving
      creature2VelocityX = 0;
      creature2VelocityY = 0;
      
     killCounter--;
     
        //Sets itself back to false
        creature2Killed = false;
    
  }

  if (dist2 < minPlatformDistance1)
  {
    creature2VelocityY = 0;
    creature2VelocityX = 1;
  } else if (dist2 > minPlatformDistance1 && creature2VelocityY == 0)
  {
    randomVelocityLeft2 = true;
  }

  if (randomVelocityLeft2)
  {

    creature2VelocityY = random(2, 3);
    creature2VelocityX = random(1, 3);

    randomVelocityLeft2 = false;
  }
}
void creature3(int x, int y, int size)
{


  ellipse(x, y, size, size);

  creature3X = creature3X + (int)creature3VelocityX;
  creature3Y = creature3Y + (int)creature3VelocityY;

  int dist3 = (int)distancePlatform1((int)creature3X, (int)creature3Y, (int)platform1X, (int)platform1Y);

    int distKill = (int)distanceSword((int)creature3X, (int)creature3Y, (int)playerX, (int)playerY);

 if(distKill < minSwordDistance)
  {
    creature3Killed = true;
    
    
  }
  
  if(creature3Killed)
  {
    
    remainingtimeDelay3 = (int)random(120,1200); //Randomizes the time
       
       //Creature resets to original position
       creature3X = creature3XOrigin;
      creature3Y = creature3YOrigin;
      
      //Creature stops moving
      creature3VelocityX = 0;
      creature3VelocityY = 0;
      
     killCounter--;
     
        //Sets itself back to false
        creature3Killed = false;
    
  }

  if (dist3 < minPlatformDistance1)
  {
    creature3VelocityY = 0;
    creature3VelocityX = 1;
  } else if (dist3 > minPlatformDistance1 && creature3VelocityY == 0)
  {
    randomVelocityLeft3 = true;
  }

  if (randomVelocityLeft3)
  {

    creature3VelocityY = random(2, 3);
    creature3VelocityX = random(1, 3);

    randomVelocityLeft3 = false;
  }
}
void creature4(int x, int y, int size)
{


  ellipse(x, y, size, size);
  creature4X = creature4X + (int)creature4VelocityX;
  creature4Y = creature4Y + (int)creature4VelocityY;

    int distKill = (int)distanceSword((int)creature4X, (int)creature4Y, (int)playerX, (int)playerY);

 if(distKill < minSwordDistance)
  {
    creature4Killed = true;
    
    
  }
  
  if(creature4Killed)
  {
    
    remainingtimeDelay4 = (int)random(120,1200); //Randomizes the time
       
       //Creature resets to original position
       creature4X = creature4XOrigin;
      creature4Y = creature4YOrigin;
      
      //Creature stops moving
      creature4VelocityX = 0;
      creature4VelocityY = 0;
      
     killCounter--;
     
        //Sets itself back to false
        creature4Killed = false;
    
  }

  if (creature4Y <= 0)
  {


    randomVelocityUp1 = true;
  }

  if (randomVelocityUp1)
  {

    creature4VelocityY = random(2, 3);
    creature4VelocityX = random(-2, 2);

    randomVelocityUp1 = false;
  }
}


void creature5(int x, int y, int size)
{


  ellipse(x, y, size, size);
  creature5X = creature5X + (int)creature5VelocityX;
  creature5Y = creature5Y + (int)creature5VelocityY;

    int distKill = (int)distanceSword((int)creature5X, (int)creature5Y, (int)playerX, (int)playerY);

 if(distKill < minSwordDistance)
  {
    creature5Killed = true;
    
    
  }
  
  if(creature5Killed)
  {
    
    remainingtimeDelay5 = (int)random(120,1200); //Randomizes the time
       
       //Creature resets to original position
       creature5X = creature5XOrigin;
      creature5Y = creature5YOrigin;
      
      //Creature stops moving
      creature5VelocityX = 0;
      creature5VelocityY = 0;
      
     killCounter--;
     
        //Sets itself back to false
        creature5Killed = false;
    
  }

  if (creature5Y <= 0)
  {


    randomVelocityUp2 = true;
  }

  if (randomVelocityUp2)
  {

    creature5VelocityY = random(2, 3);
    creature5VelocityX = random(-2, 2);

    randomVelocityUp2 = false;
  }
}







void creature6(int x, int y, int size)
{


  ellipse(x, y, size, size);
  creature6X = creature6X + (int)creature6VelocityX;
  creature6Y = creature6Y + (int)creature6VelocityY;

    int distKill = (int)distanceSword((int)creature6X, (int)creature6Y, (int)playerX, (int)playerY);

 if(distKill < minSwordDistance)
  {
    creature6Killed = true;
    
    
  }
  
  if(creature6Killed)
  {
    
    remainingtimeDelay6 = (int)random(120,1200); //Randomizes the time
       
       //Creature resets to original position
       creature6X = creature6XOrigin;
      creature6Y = creature6YOrigin;
      
      //Creature stops moving
      creature6VelocityX = 0;
      creature6VelocityY = 0;
      
     killCounter--;
     
        //Sets itself back to false
        creature6Killed = false;
    
  }

  if (creature6Y <= 0)
  {


    randomVelocityUp3 = true;
  }

  if (randomVelocityUp3)
  {

    creature6VelocityY = random(2, 3);
    creature6VelocityX = random(-2, 2);

    randomVelocityUp3 = false;
  }
}






void creature7(int x, int y, int size)
{


  ellipse(x, y, size, size);

  creature7X = creature7X - (int)creature7VelocityX;
  creature7Y = creature7Y + (int)creature7VelocityY;

  int dist7 = (int)distancePlatform2((int)creature7X, (int)creature7Y, (int)platform2X+230, (int)platform2Y);

    int distKill = (int)distanceSword((int)creature7X, (int)creature7Y, (int)playerX, (int)playerY);

 if(distKill < minSwordDistance)
  {
    creature7Killed = true;
    
    
  }
  
  if(creature7Killed)
  {
    
    remainingtimeDelay6 = (int)random(120,1200); //Randomizes the time
       
       //Creature resets to original position
       creature7X = creature7XOrigin;
      creature7Y = creature7YOrigin;
      
      //Creature stops moving
      creature7VelocityX = 0;
      creature7VelocityY = 0;
      
     killCounter--;
     
        //Sets itself back to false
        creature7Killed = false;
    
  }

  if (dist7 < minPlatformDistance2 + 20)
  {
    creature7VelocityY = 0;
    creature7VelocityX = 1;
  } else if (dist7 > minPlatformDistance2 && creature7VelocityY == 0)
  {
    randomVelocityRight1 = true;
  }

  if (randomVelocityRight1)
  {

    creature7VelocityY = random(2, 3);
    creature7VelocityX = random(1, 3);

    randomVelocityRight1 = false;
  }
}



void creature8(int x, int y, int size)
{


  ellipse(x, y, size, size);
  creature8X = creature8X - (int)creature8VelocityX;
  creature8Y = creature8Y + (int)creature8VelocityY;

  int dist8 = (int)distancePlatform2((int)creature8X, (int)creature8Y, (int)platform2X+230, (int)platform2Y);

    int distKill = (int)distanceSword((int)creature8X, (int)creature8Y, (int)playerX, (int)playerY);

 if(distKill < minSwordDistance)
  {
    creature8Killed = true;
    
    
  }
  
  if(creature8Killed)
  {
    
    remainingtimeDelay8 = (int)random(120,1200); //Randomizes the time
       
       //Creature resets to original position
       creature8X = creature8XOrigin;
      creature8Y = creature8YOrigin;
      
      //Creature stops moving
      creature8VelocityX = 0;
      creature8VelocityY = 0;
      
     killCounter--;
     
        //Sets itself back to false
        creature8Killed = false;
    
  }

  if (dist8 < minPlatformDistance2 + 20)
  {
    creature8VelocityY = 0;
    creature8VelocityX = 1;
  } else if (dist8 > minPlatformDistance2 && creature8VelocityY == 0)
  {
    randomVelocityRight2 = true;
  }

  if (randomVelocityRight2)
  {

    creature8VelocityY = random(2, 3);
    creature8VelocityX = random(1, 3);

    randomVelocityRight2 = false;
  }
}






void creature9(int x, int y, int size)
{


  ellipse(x, y, size, size);

  creature9X = creature9X - (int)creature9VelocityX;
  creature9Y = creature9Y + (int)creature9VelocityY;

  int dist9 = (int)distancePlatform2((int)creature9X, (int)creature9Y, (int)platform2X+230, (int)platform2Y);

    int distKill = (int)distanceSword((int)creature9X, (int)creature9Y, (int)playerX, (int)playerY);

 if(distKill < minSwordDistance)
  {
    creature9Killed = true;
    
    
  }
  
  if(creature9Killed)
  {
    
    remainingtimeDelay9 = (int)random(120,1200); //Randomizes the time
       
       //Creature resets to original position
       creature9X = creature9XOrigin;
      creature9Y = creature9YOrigin;
      
      //Creature stops moving
      creature9VelocityX = 0;
      creature9VelocityY = 0;
      
     killCounter--;
     
        //Sets itself back to false
        creature9Killed = false;
    
  }

  if (dist9 < minPlatformDistance2 + 20)
  {
    creature9VelocityY = 0;
    creature9VelocityX = 1;
  } else if (dist9 > minPlatformDistance2 && creature9VelocityY == 0)
  {
    randomVelocityRight3 = true;
  }

  if (randomVelocityRight3)
  {

    creature9VelocityY = random(2, 3);
    creature9VelocityX = random(1, 3);

    randomVelocityRight3 = false;
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
