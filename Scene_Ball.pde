//
// Scene_Ball.pde
//


class Scene_Ball extends Scene
{
    void initialize(PGraphics pg)
    {
    }

    void display(PGraphics pg, float musicLevel)
    {
        int green = (int)map(musicLevel, 0, 1, 0, 255);
        pg.fill(0, 128, green);    

        float radius = 100 + musicLevel * 100;
        pg.ellipse(pg.width/2, pg.height/2, radius*2, radius*2);
    }
}
