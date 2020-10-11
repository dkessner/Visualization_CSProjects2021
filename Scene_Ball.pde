//
// Scene_Ball.pde
//


class Scene_Ball implements Scene
{
    void initialize()
    {
    }

    void display(float musicLevel)
    {
        int green = (int)map(musicLevel, 0, 1, 0, 255);
        fill(0, 128, green);    

        float radius = 100 + musicLevel * 100;
        ellipse(width/2, height/2, radius*2, radius*2);
    }
}

