
Particle [] field;
int timer = 0;
void setup()
{
  field = new Particle[500];
  for(int i = 0; i < field.length; i++)
  {
      field[i] = new NormalParticle();  
  }
  field[0] = new OddballParticle();
  field[1] = new JumboParticle();

  size(800, 800);
  noStroke();
  background(0);
}
void draw()
{
  background(0);
  for(int i = 0; i < field.length; i++)
  {
    field[i].move();
    field[i].show();
  }
  timer++;

}
class NormalParticle implements Particle
{
  float myX, myY;
  double myAngle, mySpeed;
  int myColor;
  NormalParticle()
  {
    myX = 400;
    myY = 400;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10;
    myColor = color(#E428FA);
  }

  public void move()
  {
      myX += (float)(mySpeed * Math.cos(myAngle));
      myY += (float)(mySpeed * Math.sin(myAngle));
      if(myX >= 810 || myX <= -10 || myY >= 810 || myY <= -10)
      {
        myX = 400;
        myY = 400;
      }
  }

  public void show()
  {
    fill(myColor);
    rect(myX, myY, Math.abs((400 - myY)/10), Math.abs((400 - myY)/10));
  }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle
{
  float myX, myY;
  double myAngle, mySpeed;
  int myColor;
  OddballParticle()
  {
    myX = 400;
    myY = 400;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10;
    myColor = color(255);
  }

  public void move()
  {
    if(timer % 255 == 0)
    {
      myX = (float)(Math.random() * 800);
      myY = (float)(Math.random() * 800);
    }
  }

  public void show()
  {
    fill(255 - timer % 255, 255 - timer % 255, 255 - timer % 255);
    ellipse(myX, myY, 80, 80);
  }
}
class JumboParticle implements Particle
{
  float myX, myY;
  double myAngle, mySpeed;
  int myColor;
  JumboParticle()
  {
    myX = 400;
    myY = 400;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10 + 5;
    myColor = color(#5DAAFA);
  }

  public void move()
  {
      myX += (float)(mySpeed * Math.cos(myAngle));
      myY += (float)(mySpeed * Math.sin(myAngle));
      if(myX >= 1000 || myX <= -200 || myY >= 1000 || myY <= -200)
      {
        myAngle = Math.random() * 2 * Math.PI;
        myX = 400;
        myY = 400;
      }
  }

  public void show()
  {
    fill(myColor);
    ellipse(myX, myY, Math.abs((100 - myY)), Math.abs((50 - myY)));
  }
}
