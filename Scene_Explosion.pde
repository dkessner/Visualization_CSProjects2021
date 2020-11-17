
class Scene_Explosion implements Scene{
  
  void initialize(){
    ps1 = new ParticleSystem(new PVector(width/2, height/2));
  }
  
  void display(PGraphics pg, float musicLevel){
    pg.background(0);
    
    ps1.addParticle(musicLevel);
    ps1.run(pg, musicLevel, 3, color(random(200, 255), random(0, 255), 0));
    
  }
  
  ArrayList<ParticleSystem> systems;
  ParticleSystem ps1;
  
}