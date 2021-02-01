
class Scene_Amber extends Scene
{
  int cols, rows;
  int scl = 20;
  int w = 2000;
  int h = 1600;
  
  float flying = 0;
  
  float[][] terrain;

  
  void initialize(PGraphics pg)
  {
    //size(600,600, P3D);
    cols = w / scl;
    rows = h/scl;
    terrain = new float[rows][cols];
    float yoff = 0;
    for(int y = 0; y < rows; y++) {
     float xoff = 0;
     for(int x = 0; x < cols; x++) {
       terrain[y][x] = map(noise(yoff, xoff), 0, 1, -100, 100);
       xoff += 0.2;
     }
     yoff += 0.2;
    }
  }
  
  void display(PGraphics pg, float musicLevel)
  {
    pg.background(0);
    flying -=0.1;
  
    float yoff = flying;
    for(int y = 0; y < rows; y++) {
     float xoff = 0;
     for(int x = 0; x < cols; x++) {
       terrain[y][x] = map(noise(yoff, xoff), 0, 1, -100, 100);
       xoff += 0.2;
     }
     yoff += 0.2;
    }
    
    pg.background(0);
    pg.noFill(); 
    pg.colorMode(HSB, 2*PI, 1, 1);
    pg.stroke((millis()/500.)%(2*PI), 1, 1);
    
    pg.translate(pg.width/2, pg.height/2+50);
    pg.rotateX(PI/3);
   
   pg.translate(-w/2, -h/2);
   for(int y = 0; y < rows-1; y++) {
     pg.beginShape(TRIANGLE_STRIP);
     for(int x = 0; x < cols; x++) {
       pg.vertex(x*scl, y*scl, terrain[y][x]);
       pg.vertex(x*scl, (y+1)*scl, terrain[y+1][x]);
     }
     pg.endShape();
   }
  }
}
