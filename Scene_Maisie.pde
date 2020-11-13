
/*
ParticleSystem p;
class Scene_Maisie implements Scene
{
  void initialize()
  {
    p = new ParticleSystem();
  }
}

Particle createParticle()
{
  float lifespan = 255.0;
  PVector position = new PVector (mouseX, mouseY);
  PVector velocity = new PVector(random (-500, 500),random (-500,500));
  velocity.setMag(1);
  PVector gravity = new PVector (0,random(0.01, 0.03));
  Particle p = new Particle (position.x, position.y, lifespan, velocity, position, gravity);
  return p;
}


class ParticleSystem()
{
  ArrayList<Particle> particles;
  float lifespan = 255.0;
  PVector position = new PVector (mouseX, mouseY);
  PVector velocity = new PVector(random (-500, 500),random (-500,500));
  velocity.setMag(1);
  PVector gravity = new PVector (0,random(0.01, 0.03));

  ParticleSystem()
  {
    particles = new ArrayList<Particle>();
  }

  void run()
  {
    for (int i = particles.size()-1; i > 0; i-- )
    {
      Particle p = particles.get(i);
      p.run();
      p.update();
      if (p.isDead())
        particles.remove(p);
    }
  }

  class Particle
  {
    float r;
    float startX;
    float startY;
    float lifespan;
    PVector velocity;
    PVector position;
    PVector gravity;

    Particle (float lifespan, PVector velocity, PVector position, PVector gravity)
    {
      this.lifespan = lifespan;
      this.velocity = velocity;
      this.position = position;
      this.gravity = gravity;
    }

    void update()
    {
      position.add(velocity);
      velocity.add(gravity);
      lifespan -=.5;
    }

    void display()
    {
      pg.noStroke();
      pg.fill (#FF5500, lifespan);
      pg.rect(position.x, position.y, 2,5);
    }

    boolean isDead()
    {
      if (lifespan <0.0)
        return true;
      else
        return false;
    }
  }
}


void mousePressed()
{
   for (int i = 0; i <= 100; i++)
  {
    Particle p = createParticle();
    particles.add(p);
  }
}*/
