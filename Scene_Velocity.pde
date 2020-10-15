//
// Scene_Velocity.pde
//

float x = 400; 
float y = 300;
float r = 50;

class Scene_Velocity implements Scene
{
    void initialize()
    {
    }

    void display(float musicLevel)
    {
      
        fill(255);
        ellipse(x, y, r, r);
        
        float level = musicLevel * 100;
        float vx = level/10;
        float vy = level/10;
        if (x>(float)width-r/2||x<(float)r/2)
           vx = -vx;
        if (y>(float)height-r/2||y<(float)r/2)
           vy = -vy;
        if (level>5)
        {
          x+=vx;
          y+=vy;
        }
        else
        {
          vx = 0;
          x+=vx;
          y+=vy;
        }  
    }
}