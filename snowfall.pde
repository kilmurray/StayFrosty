class snowfall
{
  float randy = random(0,displayWidth+400);
  float fally = 0;
  
  
  void draw()
  {
      fill(255);
      ellipse(randy,fally,4,4);
      fally += 1;
      randy -= 1;
  }
}


