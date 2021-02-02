//
// Scene_Water.pde
//

class Scene_Water extends Scene
{
    void initialize(PGraphics pg)
    {
        
    }
  
    void display(PGraphics pg, float musicLevel) 
    {
        //float level = musicLevel * 100;
        pg.background(0);
        pg.translate(width/2, height/2, tz);
        pg.rotateX(rx);
        pg.rotateY(ry);
        pg.rotateZ(rz);
        pg.pushMatrix();
        standardAxesTransformation(pg);
        drawAxes(pg);
        drawXYPlane(pg);
        drawSurface(time, pg);
        pg.popMatrix();
    
        rx+=vx;
        ry+=vy;
        rz+=vz;
        tz+=tvz;
    
        //time
        time = (millis()-startTime)/1000;
        pg.fill(255);
        pg.strokeWeight(3);
        pg.text("Time: " + time, 0, 100, 50);
    }
    void keyPressed()
    {
        if (keyCode == RIGHT)
        {
          vy=.05;
        } 
        else if (keyCode == LEFT)
        {
          vy=-.05;
          
        } 
        else if (keyCode == UP)
        {
          vx=.05;
        }
        else if (keyCode == DOWN)
        {
          vx=-.05;
        }
        else if (key == 'a')
        {
          vz=.05;
        }
        else if (key == 'z')
        {
          vz=-.05;
        }
        else if (key == 'i')
        {
          tvz=10;
        }
        else if (key == 'm')
        {
          tvz=-10;
        }
    }
    
    void keyReleased()
    {
      vx=0;
      vy=0;
      vz=0;
      tvz=0;
    }
}
float axesRadius = 100;
int subdivisionCount = 16;
float gridSize = axesRadius/subdivisionCount;

float noiseScale = .02;

float startTime = millis();
float time;

float tz = 0;
float tvz=0;

float rx = 0;
float ry = 0;
float rz = 0;
float vx, vy, vz;

void standardAxesTransformation(PGraphics pg)
{
    pg.scale(1, -1, 1);
    pg.rotateX(-PI/2);
    pg.rotateZ(-PI/2);
}

void drawAxes(PGraphics pg)
{
    pg.strokeWeight(3);

    pg.stroke(255);
    pg.line(-axesRadius, 0, 0, 0, 0, 0);
    pg.stroke(255, 0, 0);
    pg.line(0, 0, 0, axesRadius, 0, 0);

    pg.stroke(255);
    pg.line(0, -axesRadius, 0, 0, 0, 0);
    pg.stroke(0, 255, 0);
    pg.line(0, 0, 0, 0, axesRadius, 0);

    pg.stroke(255);
    pg.line(0, 0, -axesRadius, 0, 0, 0);
    pg.stroke(0, 0, 255);
    pg.line(0, 0, 0, 0, 0, axesRadius);
}

void drawXYPlane(PGraphics pg)
{
    pg.stroke(100, 100);
    pg.strokeWeight(1);

    for (int i =-8; i<9; i++)
    {
      pg.line(gridSize*i, -axesRadius, 0, gridSize*i, axesRadius, 0);
      pg.line(-axesRadius, gridSize*i, 0, axesRadius, gridSize*i, 0); 
    }
}
float n (float x, float y, float time)
{
  x+=time;
  y+=time/15;
  return noise(x, y)*1.5;
}

void drawSurface(float time, PGraphics pg)
{
  pg.stroke(0, 200, 200);
  pg.strokeWeight(1);
  pg.noFill();

  for (float i = -subdivisionCount; i <= subdivisionCount; i++)
  {
    pg.beginShape();
    float x = i*gridSize;
    for (float j = -subdivisionCount; j <= subdivisionCount; j++)
    {
      float y = j*gridSize;
      float z = n(i,j,time)*gridSize;
      pg.vertex(x, y, z);
    }
    pg.endShape();
  }
    
  for (float j = -subdivisionCount; j <= subdivisionCount; j++)
  {
    pg.beginShape();
    float y = j*gridSize;
    for (float i = -subdivisionCount; i <= subdivisionCount; i++)
    {
      float z = n(i,j,time)*gridSize;
      float x = i*gridSize;
      pg.vertex(x, y, z);
    }
    pg.endShape();
  }
}