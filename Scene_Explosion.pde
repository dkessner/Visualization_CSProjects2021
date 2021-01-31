
class Scene_Explosion extends Scene{
  
  PVector origin;
  float level;
  
  void initialize(PGraphics pg){
    origin = new PVector(width/2, height/2);
    ps1 = new ParticleSystem(origin);
  }
  
  void display(PGraphics pg, float musicLevel){
    pg.background(0);
    
   // ps1.addParticle(musicLevel);
    ps1.run(pg, musicLevel, 3, color(random(200, 255), random(0, 255), 0));
  
  }
  
  void addExplosion(float musicLevel){
    for(int i=0; i<20; i++)
       ps1.addParticle(musicLevel);
  }
  
  void keyPressed(){
      addExplosion(level);
  }
  
  ArrayList<ParticleSystem> systems;
  ParticleSystem ps1;
  
  
}
