
float metaTime;
float metaStartTime;
int index=0;

class MetaScene extends Scene
{
  ArrayList<Pair> pairs;
  Scene currentScene;
  float limit;
  
  public MetaScene()
  {
    pairs = new ArrayList<Pair>();
    addTimePoint(5, sceneShapes);
    //addTimePoint(10, sceneBrooke);
    //addTimePoint(10, sceneRain);
    //addTimePoint(10, sceneAmber);
    //addTimePoint(15, scenePanel);
    //addTimePoint(10, sceneQuad);
    addTimePoint(10, sceneWater);
    addTimePoint(15, sceneTitle);
    initializeScene();
  }
  void initializeScene()
  {
    Pair pair = pairs.get(index);
    currentScene = pair.name;
    limit = pair.time;
  }
  void initialize(PGraphics pg)
  {
    currentScene.initialize(pg);
    metaStartTime = millis();
  }
  void addTimePoint(float time, Scene name)
  {
    pairs.add(new Pair(time, name));
  }
  void display(PGraphics pg, float musicLevel)
  {
    metaTime=(millis()-metaStartTime)/1000;
    if(metaTime<limit)
    {
      currentScene.display(pg, musicLevel);
    }
    else 
    {
      index++;
      index=index%pairs.size();
      initializeScene();
      currentScene.display(pg, musicLevel);
    }
  }
  void keyPressed()
  {
    currentScene.keyPressed();
  }
  void keyReleased()
  {
    currentScene.keyReleased();
  }
}
class Pair
{
  float time;
  Scene name;
  
  public Pair(float time, Scene name)
  {
    this.time=time;
    this.name=name;
  }  
}