//
// Scene_Rain.pde
//

ParticleSystem p;

class Scene_Rain implements Scene
{
    void initialize()
    {
      p = new ParticleSystem(new PVector (width/2, 50));
    }

   void display(PGraphics pg, float musicLevel)
    {
       //fill(255,0,0);
       float level = musicLevel*100;
       //ellipse(width/2, height/2, level+100, level+100);
       pg.fill(255);
       pg.text("level: " + level, 4*width/5-10, height/12);
       p.run(level);
       for(int i=0; i<int(level)/25; i++)
         p.addParticle(level);
    }
}