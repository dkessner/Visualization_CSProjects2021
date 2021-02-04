//
// Visualization_CSProjects2021.pde
//

import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioPlayer file;
AudioInput microphone;
AudioSource source; // either file or microphone
float highestLevel = 1e-6;

ArrayList<Scene> scenes;
Scene currentScene;

Scene_Shapes sceneShapes;
Scene_Rain sceneRain;

PGraphics offscreenBuffer;


void setup()
{
    size(800, 600, P3D);
    offscreenBuffer = createGraphics(width, height, P3D);

    initializeAudio();

    scenes = new ArrayList<Scene>();
    scenes.add(new Scene_Title());

    sceneShapes = new Scene_Shapes();
    scenes.add(sceneShapes); // 1

    scenes.add(new Scene_Brooke()); // 2
    scenes.add(new Scene_Isabelle()); // 3

    sceneRain = new Scene_Rain();
    scenes.add(sceneRain); // 4

    scenes.add(new Scene_Velocity()); // 5
    scenes.add(new Scene_Amber()); // 6
    scenes.add(new Scene_Explosion());

    scenes.add(new Scene_Quad(sceneShapes, sceneRain, sceneRain, sceneShapes)); // 8

    scenes.add(new Scene_Water()); //9

    currentScene = scenes.get(0);
    currentScene.initialize(offscreenBuffer);
}


void initializeAudio()
{
    minim = new Minim(this);

    microphone = minim.getLineIn();
    file = minim.loadFile("superstylin.mp3");

    source = microphone;
}


void draw()
{
    // get audio level

    float level = source != null ? source.mix.level() : 0;
    if (level > highestLevel)
        highestLevel = level;

    level /= highestLevel;  // normalize to [0,1]

    // draw

    offscreenBuffer.beginDraw();
    currentScene.display(offscreenBuffer, level);
    offscreenBuffer.endDraw();

    image(offscreenBuffer, 0, 0);
}


void keyPressed()
{
    if (key >= '0' && key <= '9')
    {
        int index = (int)(key - '0');
        if (index < scenes.size())
        {
          currentScene = scenes.get(index);

          offscreenBuffer.beginDraw();
          offscreenBuffer.background(0);
          currentScene.initialize(offscreenBuffer);
          offscreenBuffer.endDraw();
        }
    }
    else if (key == 'p')
    {
        if (!file.isPlaying())
        {
            file.play();
            source = file;
        }
        else // already playing
        {
            file.pause();
            source = microphone;
        }
    }
    else if (key == 'z')
    {
        highestLevel = 0;
    }
    else
    {
        currentScene.keyPressed();
    }
}
void keyReleased()
{
  currentScene.keyReleased();
}