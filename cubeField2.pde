//import processing.vr.*;
ArrayList<Cube> cubes;
color[][] screen;

float fov;
float cameraZ;

float eyeX;
float eyeY;
float eyeZ;
float centerX;
boolean done = false;
boolean start = false;


void setup() {
  size(800, 650, P3D);
  
 
  fov = PI/3.0;
  cameraZ = (height/2.0) / tan(fov/2.0);
  eyeX = width/2.0;
  eyeY = -25;
  eyeZ = (height/2.0) / tan(PI*30.0 / 180.0);
  centerX = width/2.0;
  
  
  
  cubes = new ArrayList<Cube>();
  
  for (int i = 0; i < 50; i++)
  {
     Cube cube = new Cube(random(100, 500), 0, random(-400, 400), true);
     
     cubes.add(cube);
     notTooClose(cube);
     
  }
  
}

void notTooClose(Cube cube)
{
  for (int j = 0; j<cubes.size(); j++)
     {
         if(abs(cubes.get(j).x - cube.x) < 100)
         {
           cubes.remove(cube);
           cube.x += 100*random(-3, 5);
           
           cubes.add(cube);
         }
         if (abs(cubes.get(j).z - cube.z) < 5)
           cube.z += 5;
     }
}

void draw()
{
  
  
  
    background(255);
    //pushMatrix();
    //drawAxis();
    //popMatrix();
    if (start == false) {
    startScreen();
  }
  else {
    stroke(0);
    
    
    camera(eyeX, eyeY, eyeZ, centerX, 0, 0, 0, 1, 0);
    perspective(fov, float(width)/float(height),
             cameraZ/10.0, cameraZ*20.0);
             
    
             
    pushMatrix();
    strokeWeight(0.1);
    fill(169, 169, 169);
    rotateX(-PI/2);
    translate(0, -600, 30);
    rect(-100, 0, 100*width, 100*height);
    popMatrix();
    strokeWeight(1);
    for (Cube cube: cubes)
    {
      if (done == false)
        cube.z+=2.5;
      if (start == true)
        collisionCheck();
      if (cube.z > 500)
        cube.alive = false;
      
      cube.display();
    }
    
    for (int i = cubes.size()-1; i >= 0; i--)
    {
        if (cubes.get(i).alive == false) 
        {
          cubes.get(i).z -= 800;
          cubes.get(i).x = random(100, 500);
          cubes.get(i).alive = true;
          notTooClose(cubes.get(i));
        }
    }
  
    
    
  
  
  }
  
}

void startScreen() {
  fill(255);
  rect(width/3, height/3, width/3, height/3);
  fill(0);
  text("Click anywhere to play Cube Field!\n Avoid the cubes at all costs.", 300, height/2);
  
  
  
}

class Cube
{
   float x;
   float y;
   float z;
   boolean alive;
   int c = 0;
   
   Cube(float x, float y, float z, boolean alive)
   {
      this.x = x;
      this.y = y;
      this.z = z;
      this.alive = alive;
      
      c = color(255, (int)random(255), 00);
      
   }
   
   void display()
   {
      
      pushMatrix();
      fill(c);
      translate(x, y, z);
      box(50);
      popMatrix();
     
   }
  
  
}

void collisionCheck()
{
   for (Cube cube: cubes)
   {
      if (abs(cube.x - eyeX) < 20 && cube.z > 480)
      {
        cube.c = color(255);
        done = true;
        start = false;
        
    
      }
       
   }
  
}


void drawAxis()
{
    //rotateX(-PI/2);
    stroke(255, 0, 0);
    line(0, 0, 0, width*100, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, width*100, 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, width*100);
   
}

void keyPressed()
{
  if (keyCode == LEFT)
    eyeX -=10;
  else if (keyCode == RIGHT)
    eyeX += 10;
}

void mousePressed()
{
   if (mousePressed == true) {
      start = true; 
      done = false;
   }
}
