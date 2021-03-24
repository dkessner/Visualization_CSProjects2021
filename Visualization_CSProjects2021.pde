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

Scene currentScene;

Scene_Title sceneTitle;
Scene_Shapes sceneShapes;
Scene_Rain sceneRain;
Scene_Brooke sceneBrooke;
Scene_Amber sceneAmber;
Scene_Panel scenePanel;
Scene_Quad sceneQuad;
Scene_Water sceneWater;
MetaScene meta;
Scene_Black sceneBlack;

PGraphics offscreenBuffer;


void setup()
{
    size(800, 600, P3D);
    offscreenBuffer = createGraphics(width, height, P3D);

    initializeAudio();

    sceneTitle = new Scene_Title();
    sceneShapes = new Scene_Shapes();
    sceneBrooke = new Scene_Brooke();
    sceneRain = new Scene_Rain();
    sceneAmber = new Scene_Amber();
    scenePanel = new Scene_Panel(sceneBrooke, sceneAmber);
    sceneQuad = new Scene_Quad(sceneShapes, sceneRain, sceneRain, sceneShapes);
    sceneWater = new Scene_Water();
    sceneBlack = new Scene_Black();
    
    meta = new MetaScene();
    meta.addTimePoint(3, sceneShapes);
    meta.addTimePoint(3, sceneBrooke);
    meta.addTimePoint(3, sceneRain);
    meta.addTimePoint(3, sceneAmber);
    meta.addTimePoint(3, scenePanel);
    meta.addTimePoint(3, sceneQuad);
    meta.addTimePoint(3, sceneWater);
    meta.addTimePoint(5, sceneTitle);

    currentScene = sceneTitle;
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
        if (key == '0')
            currentScene = sceneTitle;
        else if (key == '1')
            currentScene = sceneBrooke;
        else if (key == '2')
            currentScene = sceneAmber;
        else if (key == '3')
            currentScene = scenePanel;
        else if (key == '4')
            currentScene = sceneWater;
        else if (key == '5')
            currentScene = sceneQuad;
        else if (key == '6')
            currentScene = meta;
    
        offscreenBuffer.beginDraw();
        offscreenBuffer.background(0);
        currentScene.initialize(offscreenBuffer);
        offscreenBuffer.endDraw();
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