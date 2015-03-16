class character
{
    //gravity variables for jumping and falling
    float jumpHeight = 138; 
    float velocity = 0;
    float accelaration = 29.8;
    float T = sqrt((2 * jumpHeight)/accelaration);
    float deltaV = accelaration*T;
    float time = .01666;
    float u = 0;
    float deltaT = .01666;
    float deltaP = velocity * deltaT;
    float speed = u * deltaT +(0.5*accelaration*(deltaT*deltaT));
    
    //seperately drawn body part starting positions
    float legsx = 50;
    float legsy = 50;
    float midx = 35;
    float midy = 35;
    float headx = 20;
    float heady = 20;
    float legsPosy = 550;
    float startLegsPosY = 550;
    float midPosy = 510;
    float headPosy = 487.5;
    float startPos = 250;
    float maxSpeed = 5;
    float moveSpeed = 0.5;
    
    float jump = 0; 
    float height;
    boolean hasJumped = false;
    boolean jumping = false;
    boolean revMelt = false;
    float meltCounter = 200;
    float reFreeze = 1;
    float healthBar;
  
    //facial component starting positions
    float eyePosY = headPosy - 4;
    float buttonPosX = startPos;
    float hatPeakX = startPos;
    float hatPeakY = headPosy - 9;
    float hatBoxX = startPos-8;
    float hatBoxY = headPosy - 17;
    float hatTopX = hatPeakX;
    float hatTopY = hatPeakY-8;
    
    float hatColourR = 0;//hat colours
    float hatColourG = 0;
    float hatColourB = 0;
    
    //star collision detectors
    float starRedY = 0;
    float starBlueY = 0;
    
    ArrayList<Float> xStar = new ArrayList<Float>();//array list for storing x positioin of blue stars
    ArrayList<Float> yStar = new ArrayList<Float>();//array list for storing y positioin of blue stars
    boolean xflag = false;
    
    ArrayList<Float> xStarRed = new ArrayList<Float>();//array list for storing x positioin of red stars
    ArrayList<Float> yStarRed = new ArrayList<Float>();//array list for storing y positioin of red stars
    boolean xflagRed = false;
   
   float heightCheck = 0;//jump height counter
    
  float draw()
  {
      healthBar = melt();//call melt method with healthBar value returned
      
      starBlueY += 2;
      starRedY += 2;
    
      if(hasJumped)
      {
    
        return healthBar;
      }

       fill(255);
       ellipse(startPos,legsPosy,legsx,legsy);
       fill(255);
       ellipse(startPos,midPosy,midx,midy);
       fill(255);
       ellipse(startPos,headPosy,headx,heady);
       fill(0);
       ellipse(startPos-4,eyePosY,3,3);
       fill(0);
       ellipse(startPos+4,eyePosY,3,3);
       noStroke();
       fill(255,100,0);
       triangle(startPos-2,eyePosY+5,startPos,eyePosY+8,startPos+2,eyePosY+5);
       fill(hatColourR,hatColourG,hatColourB);
       ellipse(startPos,hatPeakY,21,5);
       fill(hatColourR,hatColourG,hatColourB);
       rect(startPos-8,hatBoxY,15,10);
       fill(hatColourR,hatColourG,hatColourB);
       ellipse(startPos,hatTopY,13,4);         
   
       return healthBar;    
      
  }
  
  void reset()
  {
     legsx = 50;
     legsy = 50;
     midx = 35;
     midy = 35;
     headx = 20;
     heady = 20;
     legsPosy = 550;
     startLegsPosY = 550;
     midPosy = 510;
     headPosy = 487.5;
     startPos = 250;
     
     hatPeakY = headPosy - 9;
     hatBoxY = headPosy - 17;
     hatTopY = hatPeakY-8;
     eyePosY = headPosy - 4;
  }
  

  
   
  
    float melt()
    {
      if(revMelt)//has character touched blue star
      {
        meltCounter --;//decrement timer for melt reverse
       
        if(meltCounter <= 0)//if timer if up
        {
          reFreeze = 1;//change melt direction and re-start timer
          revMelt = false;
          meltCounter = 200;
         hatColourR = 0;
         hatColourG = 0;
         hatColourB = 0;   
        }
        
        
      
      }
      
      if(legsx <= 50)
      {
         legsx -= .012*reFreeze;//melt frequency
         legsy -= .012*reFreeze;
         midx -= .002*reFreeze;
         midy -= .002*reFreeze;
         headx -= .002*reFreeze;
         heady -= .002*reFreeze;
         legsPosy += .015*reFreeze;
         midPosy += 0.04*reFreeze;
         headPosy += 0.048*reFreeze;
         eyePosY += 0.048*reFreeze;
         hatBoxY += 0.048*reFreeze;
         hatTopY += 0.048*reFreeze;
         hatPeakY += 0.048*reFreeze;
      }
      return legsx;
    }
    
    //method to move right on screen
    void  move_right()
     {
       if((hatTopY <= block1PosY+100 && hatTopY >= block1PosY)&&(startPos >= block1PosX-30 && startPos <= block1PosX+200))//collision detection dont move if touching left side of ice
       {
             //do nothing if collision detection for block is positive
       }
       else if ((hatTopY <= block1PosY+100 && hatTopY >= block1PosY)&&(startPos >= block2PosX-30 && startPos <= block2PosX+100))//collision detection dont move if touching left side of ice
       {
             //do nothing if collision detection for block is positive
       }
       else
       {
           startPos += moveSpeed;//if no collision detected move
           if(moveSpeed <= maxSpeed)
           {
             moveSpeed += 0.2;
           }
       }  
     }
     
     void stop_move()
     {
         moveSpeed = 0.1;
     }
     
     void move_left()
     {
     
       if((hatTopY <= block1PosY+100 && hatTopY >= block1PosY)&&(startPos <= block1PosX+230 && startPos >= block1PosX))//collision detection dont move if touching right side of ice
       {
                  //do nothing if collision detection for block is positive

       }
       else if ((hatTopY <= block1PosY+100 && hatTopY >= block1PosY)&&(startPos <= block2PosX+130 && startPos >= block2PosX))//collision detection dont move if touching right side of ice
       {
                  //do nothing if collision detection for block is positive
       }
       else
       {
           startPos -= moveSpeed;//if no collision detected move
           if(moveSpeed <= maxSpeed)
           {
             moveSpeed += 0.1;
           }
       }
   
     }
     

       

     void down()
     {
         legsPosy += maxSpeed;
         midPosy += maxSpeed;
         eyePosY += maxSpeed;
         headPosy += maxSpeed;
         hatBoxY += maxSpeed;
         hatTopY += maxSpeed;
         hatPeakY += maxSpeed;
     }
     
    //collision detection for blue stars
    void starPosBlue(float XBlue)
    {
       int counter = 0;
       boolean onList = true;
       if(xflag == false)
       {
         xStar.add(XBlue);
         yStar.add(0f);
         xflag = true;
       }
       
       for(int indexer = 0; indexer < xStar.size(); indexer++)//for loop to check if XBlue is on list
       {          
         if(XBlue == xStar.get(indexer))
         {
           onList = true;
           break;
           //if Xblue is on xStar list set flag for true and break 
         }
         else
         {
           onList = false;//else change flag
         }
       }
       
       if(onList == false)
       {
         xStar.add(XBlue);//if flag is false, XBlue is not in list, add to list
         yStar.add(0f);//add accompoanying y position
         onList = true;
       }
      
        
       // yStar.add(0f);
       // (hatTopY <= yStar.get(indexer)+35 && hatTopY >= yStar.get(indexer)-35)&&
       for(int indexer = 0; indexer < xStar.size(); indexer++)
       {
           float temp = yStar.get(indexer);
           temp += 2;
           yStar.set(indexer, temp);
           
           if(hatColourR == 0)
           {
             if((hatTopY <= yStar.get(indexer)+35 && hatTopY >= yStar.get(indexer)-35)&&(startPos <= xStar.get(indexer)+40 && startPos >=xStar.get(indexer)-40))//if hat touches star
             {
                 reFreeze = -1;//if detected change melt direction
                 revMelt = true;//flag for melt direction timer
                 hatColourB = 255;
             }
           }
       }
    } 
    
    //code taken from flappy bird lab
    void jump()
    {
       {
        if(lastPressed == false)//bool check for height of character
        {
          if(legsPosy <= 550)
          {
             if((startPos >= block1PosX && startPos <= block1PosX+200)||(startPos >= block2PosX && startPos <= block2PosX+100))//check for over head blocks
             {
               if(legsPosy >= block1PosY-23)//if over block do nothing
               {
               }
               else
               {
       
                  deltaP = velocity * deltaT +(0.5*accelaration*(deltaT*deltaT));
                  time = time + deltaT;
                  height = height - deltaP;
                  velocity = velocity + accelaration * deltaT;
                            
                   legsPosy += deltaP;
                   midPosy += deltaP;
                   eyePosY += deltaP;
                   headPosy += deltaP;
                   hatBoxY += deltaP;
                   hatTopY += deltaP;
                   hatPeakY += deltaP;
                   
                            
                   legsPosy += 2;
                   midPosy += 2;
                   eyePosY += 2;
                   headPosy += 2;
                   hatBoxY += 2;
                   hatTopY += 2;
                   hatPeakY += 2;
                   draw();
          
               }
             }
             else
             {
                 deltaP = velocity * deltaT +(0.5*accelaration*(deltaT*deltaT));
                  time = time + deltaT;
                  height = height - deltaP;
                  velocity = velocity + accelaration * deltaT;
                            
                   legsPosy += deltaP;
                   midPosy += deltaP;
                   eyePosY += deltaP;
                   headPosy += deltaP;
                   hatBoxY += deltaP;
                   hatTopY += deltaP;
                   hatPeakY += deltaP;
                   
                            
                   legsPosy += 2;
                   midPosy += 2;
                   eyePosY += 2;
                   headPosy += 2;
                   hatBoxY += 2;
                   hatTopY += 2;
                   hatPeakY += 2;
                   draw();
             }
            
           
          }
     
      
      }
      else
      {
       if((startPos >= block1PosX && startPos <= block1PosX+200)&&(hatTopY >= block1PosY))//collision detection dont jump if under ice
       {
        
          //minijump
       }
       else if((startPos >= block2PosX && startPos <= block2PosX+100)&&(hatTopY >= block2PosY))//collision detection dont jump if under ice
       {
     
       }
       else
       {
           heightCheck += 1;
           deltaP *= -1;
         
           legsPosy += deltaP;
           midPosy += deltaP;
           eyePosY += deltaP;
           headPosy += deltaP;
           hatBoxY += deltaP;
           hatTopY += deltaP;
           hatPeakY += deltaP;
        

           legsPosy -= 3;
           midPosy -= 3;
           eyePosY -= 3;
           headPosy -= 3;
           hatBoxY -= 3;
           hatTopY -= 3;
           hatPeakY -= 3;

        
          
          draw();

            
          if(heightCheck >= 55)
          {
            heightCheck = 0;
            lastPressed = false;
           }
       }
      
      }
  }
}

    
    //collision detection for red stars
    void starPosRed(float XRed)
    {
       //int counter = 0;
       boolean onListRed = true;
       if(xflagRed == false)
       {
         xStarRed.add(XRed);
         yStarRed.add(0f);
         xflagRed = true;
       }
       
       for(int indexer = 0; indexer < xStarRed.size(); indexer++)//for loop to check if XRed is on list
       {           
         if(XRed == xStarRed.get(indexer))
         {
           onListRed = true;
           break;
           //if XRed is on xStarRed list set flag for true and break 
         }
         else
         {
           onListRed = false;//else change flag
         }
       }
       
       if(onListRed == false)
       {
         xStarRed.add(XRed);//if flag is false, XRed is not in list, add to list
         yStarRed.add(0f);//add accompoanying y position
         onListRed = true;
       }
      
        
     
       //star hit detection
       for(int indexer = 0; indexer < xStarRed.size(); indexer++)
       {    
           float tempRed = yStarRed.get(indexer);
           tempRed += 2;//move y tracker to follow star
           yStarRed.set(indexer, tempRed);//replace y positioin with temp
          
           if(hatColourB == 0)
           {
             if((hatTopY <= yStarRed.get(indexer)+35 && hatTopY >= yStarRed.get(indexer)-35)&&(startPos <= xStarRed.get(indexer)+40 && startPos >=xStarRed.get(indexer)-40))//if hat touches star
             {
                 reFreeze = 2;//if detected increase melt rate
                 revMelt = true;//flag for melt direction timer
                 hatColourR = 255;
             }
           }
       }
    } 
 
 
}
