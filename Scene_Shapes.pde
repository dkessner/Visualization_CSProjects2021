//
// Scene_Shapes.pde
//


class Scene_Shapes extends Scene
{
    void initialize()
    {
        shapes = new ArrayList<Shape>();
        shapes.add(new Shape(new PVector(width/4, height/4), 3, 30, 100));
        shapes.add(new Shape(new PVector(3*width/4, height/4), 4, 50, 50));
        shapes.add(new Shape(new PVector(width/4, 3*height/4), 5, 30, 80));
        shapes.add(new Shape(new PVector(3*width/4, 3*height/4), 6, 50, 50));

        bg = new BallGenerator(new PVector(width/2, height/2));
    }

    void display(PGraphics pg, float musicLevel)
    {
        for (Shape s : shapes)
            s.display(pg, musicLevel);

        pg.fill(255);
        pg.noStroke();
        pg.rect(0, height*(1-musicLevel), 10, height*musicLevel);

        bg.display(pg, musicLevel);

        if (mirror)
          applyMirrorFilter(pg);

        if (greyscale)
          applyGreyscaleFilter(pg);
        
        if(purple)
          applyPurpleFilter(pg);
        
        if(green)
          applyGreenFilter(pg);
        
    }

    void keyPressed()
    {
        if (key == 'm')
            mirror = !mirror;
        if (key == 'g')
            greyscale = !greyscale;
        if (key == 'u')
            purple = !purple;
        if (key == 'l')
            green = !green;


    }

    ArrayList<Shape> shapes;
    BallGenerator bg;

    boolean mirror = false;
    boolean greyscale = false;
    boolean purple = false;
    boolean green = false;
  
}


class Shape
{
    Shape(PVector position, int n, float minRadius, float maxRadius)
    {
        this.position = position;
        vertices = new ArrayList<PVector>();
        strokeColor = randomColor();
        do {fillColor = randomColor();} while (fillColor == strokeColor);

        float initialAngle = random(2*PI);

        for (int i=0; i<n; i++)
        {
            float angle = initialAngle + 2*PI*i/n;
            PVector vertex = PVector.fromAngle(angle);
            vertex.setMag(random(minRadius, maxRadius));
            vertices.add(vertex);
        }
    }

    void display(PGraphics pg, float musicLevel)
    {
        pg.stroke(strokeColor);
        pg.strokeWeight(10);
        pg.fill(fillColor);

        pg.pushMatrix();
        pg.translate(position.x, position.y);

        pg.scale(factor);
        pg.rotate(theta);
        
        pg.beginShape();
        for (PVector v : vertices)
            pg.vertex(v.x, v.y);
        pg.endShape(CLOSE);

        pg.popMatrix();

        // rotation

        theta += vtheta;

        if (musicLevel > .6)
        {
            float atheta = musicLevel * .05;
            if (random(1)<.5) atheta *= -1;
            vtheta += atheta;
        }

        vtheta *= .8;

        // scale

        float targetFactor = 1 + 2*musicLevel;

        if (factor < targetFactor)
            factor = targetFactor;
        else
            factor *= .95;
    }

    PVector position;
    ArrayList<PVector> vertices;
    int strokeColor, fillColor;

    float factor = 0, vfactor = 0;
    float theta = 0, vtheta = 0;

    int[] palette = {#e6d021, #e29e28, #d7573b, #73a5a8, #646199};    
    int randomColor() {return palette[(int)random(palette.length)];}
}