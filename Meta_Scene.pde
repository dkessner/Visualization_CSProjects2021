
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
    addTimePoint(10, sceneWater);
    addTimePoint(15, sceneTitle);
    addTimePoint(20, sceneWater);
    initializeScene();
    metaStartTime = millis()/1000;
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
  }
  void addTimePoint(float time, Scene name)
  {
    pairs.add(new Pair(time, name));
  }
  void display(PGraphics pg, float musicLevel)
  {
    metaTime=(millis()/1000-metaStartTime);
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