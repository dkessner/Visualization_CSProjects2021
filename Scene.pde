//
// Scene.pde
//


abstract class Scene
{
    abstract void initialize(PGraphics pg);
    abstract void display(PGraphics pg, float musicLevel);
    
    void keyPressed(){};
}
