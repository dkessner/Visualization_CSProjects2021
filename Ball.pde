//
// Ball.pde
//


public class Ball
{
    public Ball(PVector position, 
                PVector velocity, 
                PVector acceleration,
                float radius, 
                int c) 
    {
        this.position = position.copy();
        this.velocity = velocity.copy();
        this.acceleration = acceleration.copy();
        this.radius = radius;
        this.c = c;
    }

    public void display(PGraphics pg, float musicLevel)
    {
        pg.fill(c);
        pg.ellipse(position.x, position.y, radius*2, radius*2);

        position.add(velocity);
        velocity.add(acceleration);
    }

    private PVector position;
    private PVector velocity;
    private PVector acceleration;
    private float radius;
    private int c;
}


public class BallGenerator
{
    public BallGenerator(PVector position)
    {
        this.position = position.copy();
        balls = new ArrayList<Ball>();
    }

    public void display(PGraphics pg, float musicLevel)
    {
        for (Ball b : balls)
            b.display(pg, musicLevel);

        createBalls(musicLevel);

        cleanup();
    }

    public void createBalls(float rate)
    {
        if (rate < 1)
        {
            if (random(0,1)<rate)
                createBall();
        } 
        else
        {
            for (int i=0; i<rate; i++)
                createBall();
        }
    }

    public void createBall()
    {
        PVector position = this.position.copy();
        PVector velocity = PVector.random2D();
        velocity.setMag(random(3, 5));
        PVector acceleration = new PVector(0, .1);
        float radius = random(2, 5);
        int c = color(random(256), random(256), random(256));

        balls.add(new Ball(position, velocity, acceleration, radius, c));
    }

    public void cleanup()
    {
        for (int i=balls.size()-1; i>=0; i--)
        {
            Ball b = balls.get(i);
            if (b.position.y > height)
                balls.remove(i);
        }
    }

    private PVector position;
    private ArrayList<Ball> balls;
}


