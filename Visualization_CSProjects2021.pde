//
// Visualization_CSProjects2021.pde
//
//amber was here

import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioPlayer file;
AudioInput microphone;
AudioSource source; // either file or microphone
float highestLevel = 1e-6;


ArrayList<Scene> scenes;
Scene currentScene;


PGraphics offscreenBuffer;


void setup()
{
    size(800, 600);
    offscreenBuffer = createGraphics(width, height);

    initializeAudio();

    scenes = new ArrayList<Scene>();
    scenes.add(new Scene_Title());
    scenes.add(new Scene_Ball());
    scenes.add(new Scene_Brooke());
    scenes.add(new Scene_Isabelle());
    scenes.add(new Scene_Rain());
    scenes.add(new Scene_Velocity());

    currentScene = scenes.get(0);
    currentScene.initialize();
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
    offscreenBuffer.background(0);
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
          currentScene.initialize();
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
}
