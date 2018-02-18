import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
float x, y;
float theta, r;
float camAngle;
ArrayList<PVector> points1 = new ArrayList<PVector>();
float hue = 0;

void setup()
{
  cam = new PeasyCam(this, 0, 0, 0, 500);
  theta = 0;
  camAngle = 0;
  fullScreen(P3D);
  colorMode(HSB);
}

void draw()
{
  background(hue, 70, 70);
  stroke(255);
  noFill();
  strokeWeight(17);
  rotateZ(camAngle / 1.3);
  camAngle += 0.1f;
  
  r = 8 * theta;//(200 * (1 - cos(theta) * sin(3 * theta))) * (theta / 20);
  
  x = r * cos(theta);
  y = r * sin(theta);
  
  points1.add(new PVector(x, y));
  
  if(theta < 25 * TWO_PI) theta += 0.1f;  
  
  stroke(hue, 255, 255);
  hue += 0.3;
    if(hue > 255) hue = 0;
  
  beginShape();
  for(PVector p : points1) {
    vertex(p.x, p.y);
  }
  endShape();
}