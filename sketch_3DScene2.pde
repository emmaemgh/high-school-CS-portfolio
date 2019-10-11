
import peasy.*;

PeasyCam cam;
float x = PI/2;
String state = "normal";

void setup() {
  size(500,500,P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(20);
  cam.setMaximumDistance(35);
}
void draw() {
  rotateX(-.5);
  rotateY(-.5);
  background(0);
  fill(255);
  box(100);
  /*
  pushMatrix();
  translate(0,0, -10);
  fill(0,0,255);
  box(5);
  popMatrix();
  pushMatrix();
  translate(0, 10, -10);
  sphere(6);
  popMatrix();
  */
  pushMatrix();
  strokeWeight(0.3);
  fill(0, 255, 0);
  translate(-20, 5, -20);
  for (int i = 1; i <= 3; i++)
  {
     sphere(8); 
     translate(20, 0, 0);
  }
  popMatrix();
  
  
  
  pushMatrix();
  strokeWeight(1);
  fill(210,180,140);
  translate(-20, 22, -20);
  for (int i = 0; i < 3; i++)
  {
    box(5, 20, 5);
    translate(20, 0, 0);
  }
  
  popMatrix();
  
  pushMatrix();
  strokeWeight(0.3);
  fill(255, 0, 0);
  translate(-20, 5, 25);
  for (int i = 1; i <= 3; i++)
  {
     sphere(8); 
     translate(20, 0, 0);
  }
  popMatrix();
  
  
  
  pushMatrix();
  strokeWeight(1);
  fill(210,180,140);
  translate(-20, 22, 25);
  for (int i = 0; i < 3; i++)
  {
    box(5, 20, 5);
    translate(20, 0, 0);
  }
  
  popMatrix();
  pushMatrix();
  rotateY(-PI/2);
  fill(0, 0, 255);
  translate(0, 0, 40);
  rect(20, -10, -30, 80, 10);
  popMatrix();
  
  drawDoor();
 
  
}

void drawDoor()
{
  pushMatrix();
  fill(139,69,19);
  translate(40, 10, 0);
  pushMatrix();
  if (x == PI/2 && state == "changed")
     translate(0, 0, 0);
  else if (x == PI && state == "changed")
     translate(0, 0, -10);
  else
    translate(0, 0, 0);
  rotateY(x);
  
  box(20, 40, 5);
  
  popMatrix();
  fill(12);
  pushMatrix();
  translate(-5, -1, -5);
  if (x == PI/2 && state == "changed")
     translate(0, 0, 0);
  else if (x == PI && state == "changed")
     translate(0, 0, -10);
  else
    translate(0, 0, 0);
  sphere(2);
  popMatrix();
  popMatrix();
}

void keyPressed()
{
  
  if (key == 'o')
  {
      if (x == PI/2)
      {
        x = PI;
       
      }
      else
      {
         x = PI/2;
       
      }
      drawDoor();
      state = "changed";
  }
  
}