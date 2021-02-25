

class Scene_Panel extends Scene
{
  public Scene_Panel(Scene top, Scene bottom)
  {
    scenes = new ArrayList<Scene>();
    scenes.add(top);
    scenes.add(bottom);
    
    panel = new ArrayList<PGraphics>();    
  }
  
  void initialize (PGraphics pg)
  {
     int w = pg.width / 2;
     int h = pg.height / 2;
     
     for (int i=0; i<2; i++)
     {
        panel.add(createGraphics(w,h));
     }
     
      for (int i=0; i<2; i++)
        {
            Scene s = scenes.get(i);
            if (s != null)
            {
              panel.get(i).beginDraw();
              s.initialize(panel.get(i));
              panel.get(i).endDraw();
            }
                
        }
        
  }
  void display (PGraphics pg, float musicLevel)
  {
     for (int i=0; i<2; i++)
     {
        Scene s = scenes.get(i);
        if (s == null) continue;
        
        PGraphics panels = panel.get(i);
        panels.beginDraw();
        s.display(panels, musicLevel);
        panels.endDraw(); 
     }
     
      pg.image(panel.get(0), 0, 0);
      pg.image(panel.get(1), pg.width/2, 0);
  }
  
    private ArrayList<Scene> scenes;
    private ArrayList<PGraphics> panel;

    void keyPressed(){};
  
}
