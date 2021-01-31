


class Scene_Brooke extends Scene
{
  void initialize(PGraphics pg)
    {
      
    }
  
  void display(PGraphics pg, float musicLevel)
  {
    pg.background (0);
  
  //float level = file.mix.level();
  

  float radius = 100 + musicLevel * 100;
 // ellipse(width/2, height/2, radius*3, radius*3);
  
  pg.fill(255,182,193);
  
  
       
  pg.ellipse(pg.width/2, pg.width/2,radius*3, 30);
    
          
    
       
 // text("level: " + level, width/2, height/2);
    
  }
}
