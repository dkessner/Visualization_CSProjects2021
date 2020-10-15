//
// Scene_Title.pde
//


class Scene_Title implements Scene
{
    void initialize()
    {
    }

    void display(float musicLevel)
    {
        int green = (int)map(musicLevel, 0, 1, 0, 255);
        fill(0, 128, green);    

        pushMatrix();
        translate(width/2, height/2);
        scale(1 + musicLevel*3);
        textAlign(CENTER, CENTER);
        text("CS Projects 2020-21", 0, 0);
        popMatrix();

        fill(255);
        text("Press 0-9 to change scene", width/2, height-100);
    }
}