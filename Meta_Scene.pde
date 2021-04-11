
float metaTime;
float metaStartTime;
int index=0;

public class MetaScene extends Scene
{
  ArrayList<Pair> pairs;
  Scene currentScene;
  float limit;
  
  public MetaScene()
  {
    pairs = new ArrayList<Pair>();
    addTimePoint(3, sceneBlack);
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
  public void addTimePoint(float time, Scene name)
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
      //index=index%pairs.size();
      if(index>=pairs.size())
        index=1;
      initializeScene();
      initialize(pg);
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