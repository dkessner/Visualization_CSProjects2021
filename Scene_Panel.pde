

class Scene_Panel extends Scene
{
  public Scene_Panel(Scene top, Scene bottom)
  {
    scenes = new ArrayList<Scene>();
    scenes.add(top);
    scenes.add(bottom);
    
    panels = new ArrayList<PGraphics>();    
  }
  
  void initialize (PGraphics pg)
  {
     int w = pg.width / 2;
     int h = pg.height / 2;
     
     for (int i=0; i<2; i++)
     {
        panels.add(createGraphics(w,h, P3D));
     }
     
      for (int i=0; i<2; i++)
        {
            Scene s = scenes.get(i);
            if (s != null)
            {
              panels.get(i).beginDraw();
              s.initialize(panels.get(i));
              panels.get(i).endDraw();
            }
                
        }
        
  }
  void display (PGraphics pg, float musicLevel)
  {
     for (int i=0; i<2; i++)
     {
        Scene s = scenes.get(i);
        if (s == null) continue;
        
        PGraphics panel = panels.get(i);
        panel.beginDraw();
        s.display(panel, musicLevel);
        panel.endDraw(); 
     }
     
      pg.image(panels.get(0), pg.height/2, 0);
      pg.image(panels.get(1), 0, pg.height/2);
  }
  
    private ArrayList<Scene> scenes;
    private ArrayList<PGraphics> panels;

    void keyPressed(){};
  
}
