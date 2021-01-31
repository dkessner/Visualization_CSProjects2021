
class Scene_Amber extends Scene
{
  PImage[] explosion = new PImage[17];

  boolean exploding = false;
  int explosionIndex = 0;

  
  void initialize(PGraphics pg)
  {
    //imageMode(CENTER);

    for (int i=0; i<explosion.length; i++)
        explosion[i] = loadImage("data/explode" + i + ".png");
  }
  
  void display(PGraphics pg, float musicLevel)
  {
    background(0);

    if (exploding == true)
    {
        if (explosionIndex < explosion.length)
        {
            image(explosion[explosionIndex], width/2, height/2);
        }
        if (frameCount%10 == 0)
          explosionIndex++;
        
    }
  }
  
  /*
  void mousePressed()
  {
    if (exploding == true)
    {
        exploding = false;
    }
    else 
    {
        exploding = true;
        explosionIndex = 0;
    }
  }
  */
}
