import peasy.*;

float x = 7.01;
float y = 5.0;
float z = 12.0;

float a = 10;
float b = 28;
float c = 8/3;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;

void setup() 
{
  size(1920, 1000, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 900);
}

void draw() 
{
  background(0);
  float dt = 0.01;
  float dx = (a * (y - x))*dt;
  float dy = (x * (b - z) - y)*dt;
  float dz = (x * y - c * z)*dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;

  points.add(new PVector(x, y, z));

  scale(5);
  stroke(255);
  noFill();

  float hu = 0;
  beginShape();
  for (PVector v : points) {
    stroke(hu, 255, 255);
    vertex(v.x, v.y,v.z);
    //PVector offset = PVector.random3D();
    //offset.mult(0.1);
    //v.add(offset);

    hu += 1;
    if (hu > 255) 
    {
      hu = 0;
      background(0);
    }
  }
  endShape();
}
