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
       p.run(pg, level);
       for(int i=0; i<int(level)/25; i++)
         p.addParticle();
    }
}

class ParticleSystem
{
  ArrayList<Particle> particles;
  PVector origin;
  float r;
  
  ParticleSystem(PVector position)
  {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle()
  {
    particles.add(new Particle(origin));
  }
  
  void run(PGraphics pg, float r)
  {
    for (int i = particles.size()-1; i>=0; i--)
    {
      Particle p = particles.get(i);
      p.run(pg, r);
      if (p.isDead())
        particles.remove(i);
    }
  }
class Particle
{
  PVector pos;
  PVector v;
  PVector a;
  float lifespan;
  
  Particle(PVector l)
  {
    a = new PVector(0, 0.05);
    v = new PVector (random(-1,1), random (-2,0));
    pos = l.copy();
    lifespan = 255.0;
  }
  
  void run(PGraphics pg, float r)
  {
    update();
    display(pg, r);
  }
  
  void update()
  {
    v.add(a);
    pos.add(v);
    lifespan -= 1.0;
  }
  
  void display(PGraphics pg, float r)
  {
    pg.stroke (255, lifespan);
    pg.fill(255, lifespan);
    for (int i = 2; i < 8; i++ ) 
    {
      pg.noStroke();
      pg.fill(0, 0, 255);
      pg.ellipse(pos.x, pos.y + i*2, i*1.5+r, i*1.5+r);
    }
  }
  
  boolean isDead()
  {
    if (lifespan < 0.0)
      return true;
    return false;
  }
}

}
