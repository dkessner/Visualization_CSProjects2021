//
// Scene_Quad.pde
//


class Scene_Quad extends Scene
{
    public Scene_Quad(Scene upperLeft, Scene upperRight, Scene lowerLeft, Scene lowerRight)
    {
        scenes = new ArrayList<Scene>();
        scenes.add(upperLeft);
        scenes.add(upperRight);
        scenes.add(lowerLeft);
        scenes.add(lowerRight);

        quadrants = new ArrayList<PGraphics>();
    }

    void initialize(PGraphics pg)
    {
        int w = pg.width / 2;
        int h = pg.height / 2;

        // create each quadrant (PGraphics, offscreen buffer)

        for (int i=0; i<4; i++)
            quadrants.add(createGraphics(w,h));

        // initialize the Scenes

        for (int i=0; i<4; i++)
        {
            Scene s = scenes.get(i);
            if (s != null)
                s.initialize(quadrants.get(i));
        }
    }

    void display(PGraphics pg, float musicLevel)
    {
        // draw each Scene into the quadrant (offscreen)  

        for (int i=0; i<4; i++)
        {
            Scene s = scenes.get(i);
            if (s == null) continue;

            PGraphics quadrant = quadrants.get(i);
            quadrant.beginDraw();
            quadrant.background(0);
            s.display(quadrant, musicLevel);
            quadrant.endDraw();
        }

        // draw the quadrants to the screen

        pg.image(quadrants.get(0), 0, 0);
        pg.image(quadrants.get(1), pg.width/2, 0);
        pg.image(quadrants.get(2), 0, pg.height/2);
        pg.image(quadrants.get(3), pg.width/2, pg.height/2);
    }

    private ArrayList<Scene> scenes;
    private ArrayList<PGraphics> quadrants;

    void keyPressed(){};
}

