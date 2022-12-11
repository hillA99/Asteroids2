class Asteroid extends Floater
{
  private double rotSpeed; 
  public Asteroid() {
    corners = 6;
    xCorners = new int[]{-11, 7, 12, 6, -11, -15}; 
    yCorners = new int[]{-8, -8, 0, 10, 8, 0};
    myColor = color(79, 91, 102);
    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);
    myXspeed = (int)(Math.random()*5)-3;
    myYspeed = (int)(Math.random()*5)-3;
    myPointDirection = 0;
    rotSpeed = (int)(Math.random()*7);
  }
  public void move() { 
    turn (rotSpeed);
    super.move();
  }
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
}

