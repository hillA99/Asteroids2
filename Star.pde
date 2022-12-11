class Star //note that this class does NOT extend Floater
{
  private int myX, myY;
  public Star()
  {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
  }
  public void show()
  {
    fill(255);
    noStroke();
    ellipse(myX, myY,(int)(Math.random()*7),(int)(Math.random()*7));
  }
}
