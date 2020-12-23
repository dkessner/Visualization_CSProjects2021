//
// Scene_Title.pde
//


class Scene_Title extends Scene
{
    void initialize()
    {
    }

    void display(PGraphics pg, float musicLevel)
    {
        int green = (int)map(musicLevel, 0, 1, 0, 255);
        pg.fill(0, 128, green);    
        pg.stroke(0);

        pg.pushMatrix();
        pg.translate(width/2, height/2);
        pg.scale(1 + musicLevel*3);
        pg.textAlign(CENTER, CENTER);
        pg.text("CS Projects 2020-21", 0, 0);
        pg.popMatrix();

        float radius = 50 + musicLevel * 50;
        pg.ellipse(pg.width/2, pg.height/4, radius*2, radius*2);

        pg.fill(255);
        pg.text("Press 0-9 to change scene", width/2, height-100);
    }
}
