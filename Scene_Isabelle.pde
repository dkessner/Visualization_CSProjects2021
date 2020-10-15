
class Scene_Isabelle implements Scene{
  ArrayList<Ball> balls = new ArrayList<Ball>();
  
  void initialize(){
    
  }
  
  void display(float musicLevel){
    int num = (int)map(musicLevel, 0, 1, 1, 20);
    float r = random(num*2, num*8);
    float r2 = r*2;
    
    for(int i=0; i<num; i++){
      balls.add(new Ball(random(0+r2, width-r2), random(0+r2, height-r2), r, random(0, 255)));
    }
    
    for(int i=0; i<num; i++){
      Ball b = balls.get(i);
      b.display();
    }
    
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
    
    void display(){
      strokeWeight(1);
      stroke(255);
      fill(15, 15, c);
      ellipse(x, y, r, r);
    }
    
    void resetValues(){
      
    }
    
    
  }
  

  
}