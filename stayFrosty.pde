character freezy = new character();
healthBar guage = new healthBar();
gameOver end = new gameOver();
ArrayList flakes;
ArrayList colourBlue;
ArrayList colourRed;
PImage back;
PImage ledge;
PImage logo;
float rand = random(50,180);
float angle;
int intRand = int(rand);
int block1PosX = 400;
int block1PosY = 360;
int block2PosX = 1100;
int block2PosY = 360;
float randyValBlue = 0;
float randyValRed = 0;
float healthLevel;
boolean endFlag = false;
boolean replayFlag = false;
boolean intro = true;
int logoTimer = 255;
boolean[] keys;

boolean lastPressed = false;



import ddf.minim.*;

AudioPlayer player;
Minim minim;




void setup()
{
  size(1570,620);
  flakes = new ArrayList();
  colourBlue = new ArrayList();
  colourRed = new ArrayList();
  back = loadImage("Snow_Background.png");//set backgrounf image
  logo = loadImage("log.png");//set logo
  frameRate(50);//limit framerate to 50fps
  ledge = loadImage("Ice.png");//set ice block image

  minim = new Minim(this);
  player = minim.loadFile("Song.mp3", 2048);//play background music
  player.play();
  
  keys = new boolean[3];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
}

void draw()
{  
   
    if(intro)//game start logo on timer
    {
      image(logo,0,0);
      tint(logoTimer,logoTimer,255);//fade to dark blue
      
      if(logoTimer <= 0)
      {
        intro = false;
      }
      
      logoTimer--;//decrement timer
    }
    else
    {
      
    
      text(freezy.reFreeze,100,100);
      background(back);
      noTint();//stop block going dark blue
      image(ledge,block1PosX,block1PosY);
      image(ledge,500,360);
      image(ledge,block2PosX,block2PosX);
      image(ledge,1100,360);
      
      snowfall flake = new snowfall(); 
      blueFlake addBlue = new blueFlake();
      redFlake addRed = new redFlake();
      
    
      colourBlue.add(addBlue);
      colourRed.add(addRed);
      flakes.add(flake);
    
      healthLevel = freezy.draw();
      guage.draw(healthLevel);
      freezy.jump(); 
      
      if(healthLevel <= 25)
      {
        end.draw();
       
        if(endFlag)
        {
          exit();
        }
        else if(replayFlag)
        {
          freezy.reset();
          replayFlag = false;
        }
        
      }
      
      for(int index = 0; index < flakes.size(); index++)
      {
          snowfall fall = (snowfall) flakes.get(index);
          fall.draw();
      }
      
      for(int index = 0; index < colourBlue.size(); index+=intRand+200)
      {
    
          blueFlake extra = (blueFlake) colourBlue.get(index);
          
          randyValBlue =  extra.draw();      
      }
      
      for(int indexer = 0; indexer < colourRed.size(); indexer+=40)
      {
         redFlake more = (redFlake) colourRed.get(indexer);
         randyValRed = more.draw();
      }
    
      smooth();
      freezy.starPosBlue(randyValBlue);
      freezy.starPosRed(randyValRed);
      
      if(keys[0])
      {
        freezy.move_right();
      }
      
      if(keys[1])
      {
        freezy.move_left();
      }
      
      if(keys[2])
      {
        freezy.jump();
        lastPressed = true;
      }
    }


}

void keyPressed()
{
  if(key == CODED)
  {
     
    if(keyCode == RIGHT)
    {
      keys[0] = true;
    }
    if(keyCode == LEFT)
    {
      keys[1] = true;
    }
      
  }
  
  if(key == ' ')
  {
    keys[2] = true;
  }
}

void keyReleased()
{
    if(key == CODED)
    {
      if(keyCode == RIGHT)
      {
        keys[0] = false;
      }
      
      if(keyCode == LEFT)
      {
        keys[1] = false;
      }
      
    }
     if(key == ' ')
      {
        keys[2] = false;
      }
}

void mousePressed()
{
  if((mouseX >= 750 && mouseX <= 780)&&(mouseY >= 380 && mouseY <= 410)&&(mousePressed))
  {
    endFlag = true;
  }
  if((mouseX >= 750 && mouseX <= 780)&&(mouseY >= 310 && mouseY <= 350)&&(mousePressed))
  {
    replayFlag = true;
  }
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
