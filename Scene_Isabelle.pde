
class Scene_Isabelle implements Scene{
  ArrayList<Ball> balls = new ArrayList<Ball>();
  
  void initialize(){
    
  }
  
  void display(PGraphics pg, float musicLevel){
    int num = (int)map(musicLevel, 0, 1, 1, 20);
    float r = random(num*2, num*8);
    float r2 = r*2;
    
    for(int i=0; i<num; i++){
      balls.add(new Ball(random(0+r2, width-r2), random(0+r2, height-r2), r, random(0, 255)));
    }
    
    for(int i=0; i<num; i++){
      Ball b = balls.get(i);
      b.display(pg);
    }
    fill(255);
    text("change this code", width/2, height/2);
    
  }
  
  class Ball{
    float x;
    float y;
    float r; 
    float c;
    Ball(float x, float y, float r, float c){
      this.x = x;
      this.y = y;
      this.r = r;
      this.c = c;
    }
    
    void display(PGraphics pg){
      pg.strokeWeight(1);
      pg.stroke(255);
      pg.fill(15, 15, c);
      pg.ellipse(x, y, r, r);
    }
    
    void resetValues(){
      
    }
    
    
  }
  

  
}