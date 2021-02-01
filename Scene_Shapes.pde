//
// Scene_Shapes.pde
//


class Scene_Shapes extends Scene
{
    void initialize(PGraphics pg) 
    {
        shapes = new ArrayList<Shape>();
        shapes.add(new Shape(new PVector(pg.width/4, pg.height/4), 3, pg.width/30, pg.width/10));
        shapes.add(new Shape(new PVector(3*pg.width/4, pg.height/4), 4, pg.width/20, pg.width/20));
        shapes.add(new Shape(new PVector(pg.width/4, 3*pg.height/4), 5, pg.width/30, pg.width/12));
        shapes.add(new Shape(new PVector(3*pg.width/4, 3*pg.height/4), 6, pg.width/20, pg.width/20));

        bg = new BallGenerator(new PVector(pg.width/2, pg.height/2));
    }

    void display(PGraphics pg, float musicLevel)
    {
        for (Shape s : shapes)
            s.display(pg, musicLevel);

        pg.fill(255);
        pg.noStroke();
        pg.rect(0, pg.height*(1-musicLevel), 10, pg.height*musicLevel);

        bg.display(pg, musicLevel);

        if (mirror)
          applyMirrorFilter(pg);

        if (greyscale)
          applyGreyscaleFilter(pg);
        
        if(purple)
          applyPurpleFilter(pg);
        
        if(green)
          applyGreenFilter(pg);
          
        if(blur)
          applyBlurFilter(pg, (int)(musicLevel*7));
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
        if (key=='b')
            blur = !blur;


    }

    ArrayList<Shape> shapes;
    BallGenerator bg;

    boolean mirror = false;
    boolean greyscale = false;
    boolean purple = false;
    boolean green = false;
    boolean blur = false;
    
    int blurRadius = 3;
  
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
        int strokeWidth = pg.width/100;

        pg.stroke(strokeColor);
        pg.strokeWeight(strokeWidth);
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

        pg.strokeWeight(1);
    }

    PVector position;
    ArrayList<PVector> vertices;
    int strokeColor, fillColor;

    float factor = 0, vfactor = 0;
    float theta = 0, vtheta = 0;

    int[] palette = {#e6d021, #e29e28, #d7573b, #73a5a8, #646199};    
    int randomColor() {return palette[(int)random(palette.length)];}
   
}
