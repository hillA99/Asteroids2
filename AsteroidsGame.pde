Star[] ster = new Star[200];
Spaceship Falcon = new Spaceship();
ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();

public void setup()
{
  size(800, 800);
  for (int i = 0; i < ster.length; i++) {
    ster[i] = new Star();
  }
  for (int i = 0; i < 20; i++) {
    rocks.add (new Asteroid());
  }
}
public void draw()
{
  background(0);
  for (int i = 0; i < ster.length; i++)
  {
    ster[i].show();
  }
  for (int i = 0; i < rocks.size(); i++) {
    rocks.get(i).move();
    rocks.get(i).show();
    float myDist = dist((float)rocks.get(i).getX(), (float)rocks.get(i).getY(), (float)Falcon.getX(), (float)Falcon.getY());
    if (myDist < 30) {
      rocks.remove(i);
    }
  }
  Falcon.move();
  Falcon.show();
}

public void keyPressed()
{
  if (key == 'w')
  {
    Falcon.accelerate(0.3);
  }
  if (key == 'd')
  {
    Falcon.turn(8.0);
  }
  if (key == 'a')
  {
    Falcon.turn(-8.0);
  }
  if (key == 's')
  {
    Falcon.accelerate(-0.3);
  }

  if (key == 'h')
  {
    Falcon.hyperspace(); //OK!
  }
}
