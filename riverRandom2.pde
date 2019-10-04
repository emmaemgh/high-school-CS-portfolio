

//import processing.vr.*;

float eyeY;
float z;
float eyeX;
int h = 10;
ArrayList<RiverSlice> slices;
ArrayList<PShape> ground;
ArrayList<Tree> trees;
int currentZ = 90;
int changeZ = 10;
float xoff = 0;
boolean getZ = false;
float centerX;
ArrayList<Cloud> clouds;
int counter = 0;
PImage grass3;
PImage river;
int change;

ArrayList<Rock> rocks;

void setup()
{
  //fullScreen(STEREO);
  size(800, 800, P3D);
  //cameraUP();
  
  eyeY =  height/2;
  eyeX = width/2.1;
  centerX = width/1.5;
  slices = new ArrayList<RiverSlice>();
  trees = new ArrayList<Tree>();
  rocks = new ArrayList<Rock>();
  /*
  PVector point = new PVector(300, 652, -500);
  Tree first = new Tree(point);
  trees.add(first);
  */
  
  RiverSlice current = new RiverSlice(300);
   PVector vector = new PVector(300, 650, 100);
   current.vectors.add(vector);
   
   PVector vector2 = new PVector(300, 650, 90);
   current.vectors.add(vector2);
   
   PVector vector3 = new PVector(300 + current.riverLength, 650, 90);
   current.vectors.add(vector3);
   
   PVector vector4 = new PVector(300 + current.riverLength, 650, 100);
   current.vectors.add(vector4);
      
   slices.add(current);
   
   grass3 = loadImage("greenTexture.jpg");
   river = loadImage("river5.jpg");
   
   clouds = new ArrayList<Cloud>();
   
   ground = new ArrayList<PShape>();
   PShape rect = createShape();
   rect.beginShape();
   rect.texture(grass3);
   rect.vertex(-5000, 651, 600-jump, 0, 0);
   rect.vertex(-5000, 651,  -6000-jump, grass3.width, 0);
   rect.vertex(5000, 651,   -6000-jump, grass3.width, grass3.height);
   rect.vertex(5000, 651, 600-jump, 0, grass3.height);
   rect.endShape();
   ground.add(rect);
   
   
  
}
int count = 0;
int countTree = 0;
void draw()
{
  
  background(#52AAFF);
  camera(eyeX, eyeY+100, (height/2.0) / tan(PI*30.0 / 180.0), centerX, height/2.0, 0, 0, 1, 0);
  //drawHorizon();
  
  
   pushMatrix();
   if (count < 20)
   {
     addClouds();
     
     count++;
   }
    for (Cloud current: clouds)
     {
        current.display(); 
     } 
   pushMatrix();
   drawSky();
   popMatrix();
   
   
   
  noStroke();
  fill(#0747F2);
   
   addSlices();
   z += 3;
   translate(0, 0, z);
    removeSlices();   
   println(z);
   counter ++;
   changeX();
   drawRiver();
   
   pushMatrix();
   addRocks();
   fill(#808080);
   for (int i = 0; i<rocks.size(); i++)
   {
      rocks.get(i).display(); 
   }
   popMatrix();
   
   
   
   if (counter%600 == 0)
    {
     addGround();
    }
   noStroke();
   drawGround();
   
   pushMatrix();
   directionalLight(240, 240, 240, -1, 0, 0);
   directionalLight(240, 240, 240, 1, 0, 0);
  ambientLight(240, 240, 240);
  
   //pushMatrix();
   
  if (countTree % 15 == 0)
  {
     addTrees();
     change += 300;
  }  
     removeTree();
     //println(trees.size());
     
     
  
  
  
  countTree ++;
   
   for (Tree tree: trees)
   {
       tree.display();
       
   }
   
   
    
   //popMatrix();
   popMatrix();
   
   
   popMatrix();
   
   
   
 
}


void addTrees()
{
 
 PVector leftSide = new PVector(random(-600, 300), 649, random(-2000-z-change, 0-z-change));
 PVector rightSide = new PVector(random(800, 1800), 649, random(-2000-z, 0-z));
 int choose = int(random(0, 2));
 PVector center;
 if (choose == 0)
    center = leftSide;
 else
    center = rightSide;
 color colors = color(0, int(random(100, 150)), 0);
 Tree current = new Tree(center, colors);
 for (int i = 0; i < 60; i++)
 {
    current.leaves.add(new PVector(random(-70,70), random(-90, 0), random(-30, 30)));
    
 }
 
 trees.add(current);
 
 
  
}

void removeTree()
{
   for (int i = trees.size()-1; i >= 0; i--)
   {
      if (trees.get(i).center.z > -z + 400)
      {
         trees.remove(i);
         
      }
   }
  
}


void addRocks()
{
    PVector center = new PVector(random(300, 700), 680, -z-100);
    float radius = random(10, 50);
    int sphereDetail = int(random(5, 20));
    Rock rock = new Rock(center, sphereDetail, radius);
    rocks.add(rock);
}

void drawBoat()
{
   fill(#986402);
   translate(500, 649, 340);
   box(70, 10, 150);
}

void addClouds()
{
   PVector center = new PVector(random(-500, 1500), random(0, 200), random(-500, 500));
   int number = int(random(7, 20));
   Cloud current = new Cloud(center, number);
   for (int i = 0; i < number; i++)
   {
      current.parts.add(new PVector(random(center.x - 30, center.x + 30), random(center.y - 10, center.y + 10), random(center.z-10, center.z+10))); 
   }
   clouds.add(current);
}

float jump = 1;
void addGround()
{
    PShape rect = createShape();
    rect.beginShape();
    rect.texture(grass3);
    rect.vertex(-5000, 651, 600-jump*6600, 0, 0);
    rect.vertex(-5000, 651,  -6000-jump*6600, grass3.width, 0);
    rect.vertex(5000, 651,   -6000-jump*6600, grass3.width, grass3.height);
    rect.vertex(5000, 651, 600-jump*6600, 0, grass3.height);
    rect.endShape();
    ground.add(rect);
    jump++;
}
void drawGround()
{
   noStroke();
   for (PShape x: ground)
   {
     shape(x);
   }
   
   
}

void drawSky()
{
   fill(#ECF50F);
   noStroke();
   translate(500, 0, -1000);
   sphere(30);
}

void addSlices()
{
   int x = 360;
   RiverSlice current = slices.get(slices.size()-1);
   RiverSlice next = current.newSlice(x);
   slices.add(next); 
   
   
}

void removeSlices()
{
   
   for (int i = 0; i < slices.size(); i++) {
      if (slices.get(i).vectors.get(0).z + z > 500)
      {
         slices.remove(i); 
         i--;
      }
   }
}
   

void drawRiver()
{
   int phase = 1;
  for (int i = 0; i<slices.size(); i++)
  {
    beginShape();
    texture(river);
    //for (int j = 0; j < 4; j++)
    //{
      PVector point = slices.get(i).vectors.get(0);
      vertex(point.x, point.y, point.z, 0, phase + 0);
      PVector point2 = slices.get(i).vectors.get(1);
      vertex(point2.x, point2.y, point2.z, 0, phase+river.height/20);
      PVector point3 = slices.get(i).vectors.get(2);
      vertex(point3.x, point3.y, point3.z, river.width, phase + river.height/50);
      PVector point4 = slices.get(i).vectors.get(3);
      vertex(point4.x, point4.y, point4.z, river.width, phase + 0);
    //}
    endShape(CLOSE);
    phase += 10;
    if (phase > river.height)
      phase = 1;
  }
  
  
  
}

void changeX()
{
   getZ = false;
   int check = -1;
   while (getZ == false && check < slices.size()-1)
   {
       check ++;
       if (abs(slices.get(check).vectors.get(0).z - (-z)) < 10 && check < slices.size()-1)
       {
         if (centerX - slices.get(check+1).vectors.get(0).x > 0)
         {
           centerX -= 1;
           eyeX += 1;
           //translate(-10, 0, 0);
         }
         else
         {
           centerX += 1;
           eyeX -= 1;
           //translate(10, 0, 0);
         }
         getZ = true;
       }
   } 
}



class RiverSlice
{
  ArrayList<PVector> vectors;
  float riverLength;
  
  RiverSlice(float riverLength)
  {
     vectors = new ArrayList<PVector>();
     this.riverLength = riverLength;
  }
  
  RiverSlice newSlice(float riverLength)
  {
      RiverSlice current = new RiverSlice(riverLength);
      float x = vectors.get(1).x;
      
      float x2 = vectors.get(2).x;
      xoff += .01;
      float noiseX = noise(xoff) * current.riverLength;
      if (noiseX < x)
        noiseX += 200;
      else if (noiseX > x)
        noiseX -= 400;
     
      current.vectors.add(new PVector(x, 650, currentZ));
      current.vectors.add(new PVector(noiseX, 650, currentZ - changeZ));
      current.vectors.add(new PVector(x + current.riverLength, 650, currentZ-changeZ));
      current.vectors.add(new PVector(x2, 650, currentZ));
      currentZ-=10;
      return current;
  }
  
  
  
  
  
}

class Rock {
 PVector center;
 int sphereDetail;
 float radius;
 
 Rock(PVector center, int sphereDetail, float radius)
 {
    this.center = center;
    this.sphereDetail = sphereDetail;
    this.radius = radius;
 }
 
 void display()
 {
    translate(center.x, center.y, center.z); 
    sphereDetail(sphereDetail);
    sphere(radius);
    
 }
  
}

class Cloud
{
  PVector center;
  int cloudPeice;
  ArrayList<PVector> parts;
  
  Cloud(PVector center, int number)
  {
     this.center = center; 
     cloudPeice = number;
     parts = new ArrayList<PVector>();
  }
  
  void display()
  {
    fill(255);
    noStroke();
    for (int i = 0; i < cloudPeice; i++)
    {
      pushMatrix();
      translate(0, 0, -parts.get(i).z);
      ellipse(parts.get(i).x, parts.get(i).y, 50, 50);
      popMatrix();
    }
  }
  
}

class Tree 
{
   PVector center;
   ArrayList<PVector> leaves;
   color colors;
   
   Tree(PVector center, color colors)
   {
    this.center = center;
    leaves = new ArrayList<PVector>();
    this.colors = colors;
   }
   
   void cylinder()
   {
     pushMatrix();
     fill(#371b07);
     translate(center.x, center.y, center.z);
     for (int i = 0; i<20; i++)
     {
         beginShape();
         vertex(30, 0, 20);
         vertex(30, -200, 20);
         vertex(30, -200, 0);
         vertex(30, 0, 0);
         endShape();
        rotateY(PI/10);
     }
     
    
      //translate(center.x, center.y, center.z);
      for (int i = 0; i < 60; i++)
      {
        fill(colors);
        pushMatrix();
        translate(leaves.get(i).x, leaves.get(i).y-150, leaves.get(i).z);
         box(40);
         popMatrix();
      }
     popMatrix();
   }
   /*
   void leaves()
   {
      fill(#046727);
      //translate(center.x, center.y, center.z);
      for (int i = 0; i < 10; i++)
      {
        pushMatrix();
        translate(leaves.get(i).x, leaves.get(i).y, center.z);
         box(5);
         popMatrix();
      }
   }
   */
   
   void display()
   {
    cylinder();
    //leaves();
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
   if (keyCode == UP)
   {
      int x = 360;
      RiverSlice current = slices.get(slices.size()-1);
      RiverSlice next = current.newSlice(x);
      slices.add(next);
      
   }
   
   if (keyCode == RIGHT)
   {
      //centerX --; 
      eyeX=5*height;
   }
   
   if (keyCode == LEFT)
   {
      centerX ++; 
      eyeX --;
   }
}