//
// Scene_Rain.pde
//

int n = 8;
color c = color(0,0,255);

ParticleSystem p;

class Scene_Rain implements Scene
{
    void initialize()
    {
      p = new ParticleSystem(new PVector (width/2, 50));
    }

   void display(PGraphics pg, float musicLevel)
    {
       float level = musicLevel*100;
       pg.fill(255);
       pg.text("level: " + level, 4*width/5-10, height/12);
       p.run(pg, level, n, c);
       for(int i=0; i<int(level)/25; i++)
         p.addParticle(level);
    }
}