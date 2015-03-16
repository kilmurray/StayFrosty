class healthBar
{
  float health;
  
  void draw(float healthLevel)
  {
    healthLevel *= 4;
    update(healthLevel);
    melt();
  }
    
  void update(float healthLevel)
  {
      fill(0,255,0);
      rect(15,15,healthLevel-100,20);
  }
  
  void melt()
  {
    while(health > 0)
    {
      health -= 0.1;
    }
    
  }
  
  void redFlake()
  {
    health -= 10;
  }
  
  void blueFlake()
  {
    health += 5;
  }
}
