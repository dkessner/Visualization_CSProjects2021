//
// Scene.pde
//


abstract class Scene
{
    abstract void initialize();
    abstract void display(PGraphics pg, float musicLevel);
    
    void keyPressed(){};
}
