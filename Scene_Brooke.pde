


class Scene_Brooke implements Scene
{
  void initialize()
    {
      
    }
  
  void display(float musicLevel)
  {
    background (0);
  
  float level = file.mix.level();
  

  float radius = 100 + musicLevel * 100;
 // ellipse(width/2, height/2, radius*3, radius*3);
  
  fill(255,182,193);
  
  
       
  ellipse(width/2, width/2,radius*3, 30);
    
          
    
       
 // text("level: " + level, width/2, height/2);
    
  }
}