# Music Visualization and Projection - CS Projects 2020-21


## Design

We have a simple interface for a Scene:

```java
interface Scene
{
    void initialize();
    void display(float musicLevel);
}
```

The main program has a global ArrayList of Scene objects, and a reference to
the current Scene.  

The `draw()` function does two things:

- get the current music level and normalize
- call the current Scene object's `display()` function

The main program is also responsible for handling user input to switch the
current Scene.


