//
// Scene_Particle_System.pde
//

class ParticleSystem
{
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector position)
  {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle(float level)
  {
    particles.add(new Particle(origin, level));
  }
  
  void run(PGraphics pg, float level)
  {
    for (int i = particles.size()-1; i>=0; i--)
    {
      Particle p = particles.get(i);
      p.run(pg, level);
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
  float r;
  
  Particle(PVector l, float level)
  {
    a = new PVector(0, 0.05);
    v = new PVector (random(-1,1), random (-2,0));
    pos = l.copy();
    lifespan = 255.0;
    r = 3+1.2*level;
  }
  
  void run(PGraphics pg, float level)
  {
    update();
    display(pg, level);
  }
  
  void update()
  {
    v.add(a);
    pos.add(v);
    lifespan -= 1.0;
    origin = new PVector (random(0,width), random (0,height));
  }
  
  void display(PGraphics pg, float level)
  {
    pg.stroke (255, lifespan);
    pg.fill(255, lifespan);
    for (int i = 2; i < 8; i++ ) 
    {
      pg.noStroke();
      pg.fill(0, 0, 255);
      pg.ellipse(pos.x, pos.y + i*2, i+r, i+r);
    }
    r*=.98;
  }
  
  boolean isDead()
  {
    if (lifespan < 0.0)
      return true;
    return false;
  }
}
}