class colouredFlake
{
  float randy = random(0,displayWidth);
  float fally = 0;
  float rot = 0;
  float R;
  float G;
  float B;
  float t1x1=-15,t1x2=0,t1x3=15,t1y1=22,t1y2=0,t1y3=22;
  float t2x1=-15,t2x2=0,t2x3=15,t2y1=8,t2y2=30,t2y3=8;
  float yPos;
  float rotate = 0.12;
  float fallSpeed = 2;


  
  float draw()
  {  
      pushMatrix();    
      translate(randy, fally);
      rotate(rot);
      fill(R,G,B);
      triangle(t1x1,t1y1,t1x2,t1y2,t1x3,t1y3);
      triangle(t2x1,t2y1,t2x2,t2y2,t2x3,t2y3);
      popMatrix();   
  
      fally += fallSpeed;
      rot += rotate;
     
     return randy;    
  }
}





