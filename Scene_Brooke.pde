


class Scene_Brooke extends Scene
{
  int n=5;
  float depth;
  Line[] line = new Line[n];
  void initialize(PGraphics pg)
  {
    //fullScreen(P3D);
    depth=pg.width;

    frameRate(20);
    pg.background (0);
    pg.colorMode(HSB,800,100,100);

    for (int i=0; i<n; i++)
    {
       line[i]=new Line(pg, random(width)-width/2, random(height)-height/2, random(depth)-depth/2, 20);
    }

    pg.background(0);
      
   }
  
  void display(PGraphics pg, float musicLevel)
  {

    pg.pushMatrix();
    pg.translate(width/2, height/2,0);
  
   for (int i=0; i<n; i++)
   {
     line[i].move();
   }

   
     pg.popMatrix();
    
  }
  
  class Line
{
  PGraphics pg;
  float time = radians(frameCount);
  float px, py, pz, x, y, z, l;
  Line(PGraphics pg, float inx, float iny, float inz, float inl) 
  {
    this.pg = pg;
    px=x=inx;
    py=y=iny;
    pz=z=inz;
    l=inl;
  }

  void move() 
  {
    switch (floor(random(3))) 
    {
    case 0: 
      x+=l; 
      break;
    case 1: 
      x-=l; 
      break;
    case 2: 
      y+=l; 
      break;
    case 3: 
      y-=l; 
      break;
    case 4: 
      z+=l; 
      break;
    case 5: 
      z-=l; 
      break;
    }
    

 float hue = 360 * sqrt( sq(x - width/2) + sq(y - height/2)) / max(width/2,height/2);
 pg.stroke(hue, 255, 255);
 
   pg.line(px, py, pz, x, y, z);

   if ((x>pg.width/2)||(x<-pg.width/2)) x=random(pg.width)-pg.width/2;
   if ((y>pg.height/2)||(y<-pg.height/2))y=random (pg.height)-pg.height/2;
   if ((z>depth/2)||(z<-depth/2)) z=random (depth)-depth/2;
    px=x;
    py=y;
    pz=z;
  }
}

void mousePressed()
{
  background (0);
}
}


 
