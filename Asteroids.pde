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
class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myXspeed += ((dAmount) * Math.cos(dRadians));    
    myYspeed += ((dAmount) * Math.sin(dRadians));       
  }   
  public void turn (double degreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=degreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
} 
class Spaceship extends Floater {
  public Spaceship() {
    corners = 4;
    xCorners = new int[]{-8, 16, -8, -2};
    yCorners = new int[]{-8, 0, 8, 0};
    myColor = 255;
    myCenterX = 300;
    myCenterY = 300;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }

  public void hyperspace() {
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);
    myPointDirection = (float)(Math.random()*500);
  }
  public void setY(int y) {
    myCenterY = myCenterY + y;
  }
  public void setX(int x) {
    myCenterX = myCenterX + x;
  }
  public double getY() {
    return myCenterY;
  }
  public double getX() {
    return myCenterX;
  }
}
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

