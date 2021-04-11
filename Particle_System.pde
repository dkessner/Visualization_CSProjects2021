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
  
  void run(PGraphics pg, float level, int n, color c)
  {
    for (int i = particles.size()-1; i>=0; i--)
    {
      Particle p = particles.get(i);
      p.display(pg, level, r, n, c);
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
  int n;
  color c;
  
  Particle(PVector l, float level)
  {
    a = new PVector(0, 0.05);
    v = new PVector (random(-1,1), random (-2,0));
    pos = l.copy();
    lifespan = 255.0;
    r = 3+1.2*level;
  }
  
  void update()
  {
    v.add(a);
    pos.add(v);
    lifespan -= 1.0;
    origin = new PVector (random(0,width), random (0,height));
  }
  
  void display(PGraphics pg, float level, float r, int n, color c)
  {
    //r is radius
    //n is the number of circles (make it 3 if you just want 1 circle
    //c is a color (set r, n, c in scene tab)
    pg.stroke (255, lifespan);
    pg.fill(255, lifespan);
    for (int i = 2; i < n; i++ ) 
    {
      pg.noStroke();
      pg.fill(c);
      pg.ellipse(pos.x, pos.y + i*2, i+r/3, i+r/2.5);
    }
    r*=.97;
    update();
  }
  
  boolean isDead()
  {
    if (lifespan < 0.0)
      return true;
    return false;
  }
}
}