PImage town1Sprite;
PImage town2Sprite;
PImage backgroundSprite;
PImage moonSprite;

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
