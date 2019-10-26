int x = 200;
int y = 200;
int z = 0;
float rotating = 0;
float rotating2 = 0;
float chooseX = 400;
float chooseY = 400;
float vx;
float vy;
float vz;
float change = 1.0;
int count = 0;
float radius = 10;
int centerZ = 0;
float eyeZ = 692;
float angle = 6.0;
float angle2 = 46.0;
ArrayList<Box> boxes;
ArrayList<Box> boxes2;
ArrayList<Sphere> spheres;
ArrayList<Line> lines;
ArrayList<Circle> circles;
ArrayList<shootingLines> stars;

ArrayList<Line> lines2;
ArrayList<Line> lines3;
ArrayList<Line> lines4;
ArrayList<Line> lines5;

boolean addSpheres1 = false;
boolean addBoxes1 = false;
boolean addLines1 = false;
boolean addRays1 = false;
boolean addCircles1 = false;
boolean rotate = false;
boolean mod = false;
boolean kaleid = false;
boolean kaleidClass = false;
boolean shadeChange = false;
boolean noZ = false;
boolean circle = false;;
boolean solar;
boolean rotateLines = false;
boolean rotateBoxes = true;
boolean spiral = false;
float[] radiuses = {mouseX%20, mouseX/20, mouseX%400, mouseY%20};
boolean refresh = true;
int gameStage = 0;

color c1 = color(0, 0, 255);
color c2 = color(0, 255, 0);
color c3 = color(255, 0, 0);
color white = color(255);
color blue = color(0, 0, 255);


void setup()
{
   size(800, 800, P3D); 
   background(255);
   boxes = new ArrayList<Box>();
  
   
   spheres = new ArrayList<Sphere>();
   lines = new ArrayList<Line>();
   circles = new ArrayList<Circle>();
   radiuses = new float[4];
   boxes2 = new ArrayList<Box>();
   stars = new ArrayList<shootingLines>();
   color shade = color(random(256), random(256), 255);
     Box box2 = new Box(0, 0, 20, shade, 5);
     boxes2.add(box2);
        
     Box box3 = new Box(0, 0, -20, shade, 5);
     boxes2.add(box3);
        
     Box box4 = new Box(20, 0, -10, shade, 5);
     boxes2.add(box4);
        
     Box box5 = new Box(-40, 0, -10, shade, 5);
     boxes2.add(box5);
  
  
   //boxes.add(new Box(200, 200, 0));
}



void draw()
{
  if (refresh == true)
    background(255);
  
  camera(width/2.0, height/2.0, eyeZ, width/2.0, height/2.0, centerZ, 0, 1, 0);
  //fill(random(0, 256), random(0, 256), random(0, 256));
  //stroke(255);
  
  //float t2 = (frameCount%200) / 200.0;
  if (gameStage == 0)
  {
    pushMatrix();
    fill(#2315AD);
    translate(200, 200, 0);
    box(40);
    popMatrix();
    pushMatrix();
    fill(#AD153B);
    translate(600, 600);
    sphereDetail(15);
    sphere(40);
    popMatrix();
    pushMatrix();
    line(200, 600, 300, 600);
    popMatrix();
    pushMatrix();
    line(500, 200, 700, 400);
    line(490, 210, 700, 390);
    popMatrix();
    pushMatrix();
    ellipse(400, 400, 20, 20);
    popMatrix();
    //rect(0, 700, 100, 100);
    ellipse(50, 700, 10, 10);
    
    //line(0, 0, 0, 50, 50, 50);
   
  
    
    
  }
  
    
  
  if (gameStage == 1)
  {
     
   
     
     if (count == 2)
     {  
        boxes = new ArrayList<Box>();
        lines = new ArrayList<Line>();
        count ++;
     }
     if (addBoxes1 == true)
      {
        if (solar == true)
        {
           background(0); 
        }
       addBoxes();
       if (kaleidClass == true)
       {
         translate(400, 400);
       }
       float T = 200;
       float t = (frameCount % T)/200;
       for (int i = 0; i<boxes.size(); i++)
       {
          pushMatrix();
          if (kaleidClass == true)
          {
            rotate(2*PI*i/angle);
            
          }
          if (solar == true)
          {
             pushMatrix();
             
             translate(boxes.get(i).x, boxes.get(i).y, boxes.get(i).z);
             rotateY(rotating2*2*PI/48);
             
             for (int j = 0; j < boxes2.size(); j++)
             {
                 boxes2.get(j).shade = lerpColor(white, blue, (frameCount%200)/200.0);
                 boxes2.get(j).display();
             }
             popMatrix();
             rotating2 += 0.001;
             
          }
         
          if (solar == true)
          {
             
             pushMatrix();
             translate(boxes.get(i).x, boxes.get(i).y, boxes.get(i).z);
             rotate(rotating2*2*PI/40);
             popMatrix();
          }
          
          boxes.get(i).display(); 
          boxes.get(i).z ++;
          
          t += 0.001;
          popMatrix();
       }
      }
   
     if (addSpheres1 == true)
     {
       float T = 200;
       float t = (frameCount % T)/200;
       addSpheres();
       if (kaleidClass == true)
       {
         translate(400, 400);
       }
       for (int i = 0; i<spheres.size(); i++)
       {
          pushMatrix();
          if (kaleidClass == false)
          {
            spheres.get(i).shade = rainbow(t);
          }
          if (kaleidClass == true)
          {
            rotate(2*PI*i/angle);
            spheres.get(i).shade = rainbow(t);
          }
          spheres.get(i).display(); 
          spheres.get(i).z ++;
          popMatrix();
          t += 0.001;
       }
       
       
     }
     
     color from = color(0, 0, 255);
     color to = color(0, 255, 0);
     if (addLines1 == true) //different colors along lines
       {
          addLines();
          
          if (kaleidClass == true)
           {
             translate(400, 400);
             lines2 = lines;
             lines3 = lines;
             lines4 = lines;
             lines5 = lines;
             
           }
          for (int i = 0; i<lines.size(); i++)
           {
              if (shadeChange == true)
              {
                 
                 stroke(lerpColor(from, to, (frameCount%200)/200.0));
                  
              }
              
              pushMatrix();
              
              if (kaleidClass == true)
              {
                  pushMatrix();
                  rotate(2*PI/angle);
                  lines2.get(i).display();
                  popMatrix();
                  pushMatrix();
                  rotate(4*PI/angle);
                  lines3.get(i).display();
                  popMatrix();
                   pushMatrix();
                  rotate(6*PI/angle);
                  lines4.get(i).display();
                  popMatrix();
                   pushMatrix();
                  rotate(8*PI/angle);
                  lines5.get(i).display();
                  popMatrix();
                  
              }
              lines.get(i).display(); 
              
              lines.get(i).z ++;
              
              popMatrix();
              
           }  
         
       }
      if (addRays1 == true)
      {
          
         addRays(); 
         float T = 200;
         float t = (frameCount % T)/200;
         addSpheres();
         if (kaleidClass == true)
         {
            translate(400, 400, 0); 
         }
          for (int i = 0; i<lines.size(); i++)
           {
              pushMatrix();
              if (kaleidClass == true)
              {
                rotate(2*PI*i/angle);
                stroke(rainbow(t));
              }
              lines.get(i).display(); 
              lines.get(i).z ++;
              popMatrix();
           }  
      }
      if (addCircles1 == true)
      {
         addCircles();
         if (kaleidClass == true)
         {
         translate(400, 400);
         }
         for (int i = 0; i < circles.size(); i++)
         {
            pushMatrix();
            if (kaleidClass == true)
            {
              rotate(2*PI*i/angle);
            }
            circles.get(i).display();
            if (noZ == false)
            {
              circles.get(i).z ++;
            }
            popMatrix();
         }
      }
      
      
      
      
      
      if (rotate == true)
      {
        float T = 200;
         float t = (frameCount % T)/200;
        
        if (circle == true)
        {
          addCircles();
          pushMatrix();
          translate(400, 400);
        rotateY(PI*rotating/angle2);
         for (int i = 0; i < circles.size(); i++)
         {
           pushMatrix();
           rotate(2*PI*i/angle);
           //rotateY(((2*PI*((frameCount%60)/60))));
           
           circles.get(i).display();
         
           
           popMatrix();
           rotateY(2*PI*i/angle2);
           
           
         }
         //rotateY(2*PI*rotating/36);
         rotating += change;
         popMatrix();
        }
        else if (rotateBoxes == true)
        {
          addBoxes();
          pushMatrix();
          translate(400, 400);
          rotateY(PI*rotating/angle2);
           for (int i = 0; i < boxes.size(); i++)
           {
           pushMatrix();
           rotate(2*PI*i/angle);
           //rotateY(((2*PI*((frameCount%60)/60))));
           
           boxes.get(i).display();
         
           
           popMatrix();
           rotateY(2*PI*i/36);
           
           
         }
         //rotateY(2*PI*rotating/36);
         rotating += change;
         popMatrix();
        }
        
        else if (rotateLines == true){
          
          pushMatrix();
          
          translate(400, 400);
          addStar();
           rotateY(PI*rotating/angle2);
           
           
           c1 = color(#980E7A);
           c2 = color(#8CA2F7);
           c3 = color(#7EC96E);
         
           for (int i = 0; i < stars.size(); i++)
           {
              stroke(rainbow(t));
              stars.get(i).display(); 
              t += 0.0001;
           }
         //rotateY(2*PI*rotating/36);
         rotating += change;
         popMatrix();
          
          
        }
        
      }
      
      if (spiral == true)
      {
        addCircles();
        pushMatrix();
        translate(400, 400, 300);
        box(20);
        popMatrix();
        
      }
   
    eyeZ -= 0.5;
    pushMatrix();
     fill(0);
     rect(700, 700, 50, 20);
     triangle(700, 760, 650, 710, 700, 660);
     eyeZ += 0.5;
     popMatrix();
  }
  
  
  
}
float increment = 0.0;

void addBoxes()
{
    color shade =  color(random(0, 256), random(0, 256), 255);
    Box box = new Box(mouseX, mouseY, z, shade, 20);
    if (kaleidClass == true || rotate == true)
    {
      increment += 0.0075;
      //shade = color(noise(mouseX+10)*mouseX,  noise(mouseX)*mouseX, noise(mouseX+15)*mouseX);
      shade = color(noise(increment+20) * 256, noise(increment) * 256, noise(increment+4) * 256);
      box = new Box(mouseX-400, mouseY-400, z, shade, 20); 
    }
    
   
    
    
    boxes.add(box);
}

void addStar() 
{
   PVector point1 = new PVector(0, 0, 0);
   float theta = random(0, 2*PI);
   float phi = random(0, 2*PI);
   float r = random(1, 200);
   PVector point2 = new PVector(r*cos(theta)*sin(phi), r*sin(theta), r*cos(theta)*cos(phi));
   shootingLines line = new shootingLines(point1, point2);
   stars.add(line);
}



void addSpheres()
{
    color shade =  color(255, random(0, 256), random(0, 256));
    Sphere sphere = new Sphere(mouseX, mouseY, z, shade, 15);
    if (kaleidClass == true)
    {
       color shade2 = color(noise(mouseX+5)*mouseX, noise(mouseX)*mouseX, noise(mouseX*2)*width);
       sphere = new Sphere(mouseX-400, mouseY-400, z, shade2, 9);
    }
    spheres.add(sphere);
}

void addLines()
{
   Line line = new Line(pmouseX, pmouseY, mouseX, mouseY, 0);
   if (kaleidClass == true)
   {
      line = new Line(pmouseX-400, pmouseY-400, mouseX-400, mouseY-400, 0);
   }
   lines.add(line);
}



void addRays()
{
   Line line = new Line(chooseX, chooseY, mouseX, mouseY, 0);
   if (kaleidClass == true)
   {
      line = new Line(chooseX, chooseY, mouseX-400, mouseY-400, 0); 
   }
   lines.add(line);
}


void addCircles()
{
  color shade = color(255);
  if (kaleidClass == true)
    {
      increment += 0.01;
      shade = color(noise(increment+5) * 256, noise(increment) * 256, noise(increment+10) * 256);
    }
    Circle circle1;
    Circle circle2;
    if (kaleidClass == false && rotate == false)
    {
       circle1 = new Circle(mouseX, mouseY, 0, mouseX%radius, shade);
       circle2 = new Circle(mouseX, mouseY, 0, mouseX/radius, shade);
    }
    else
    {
       circle1 = new Circle(mouseX-400, mouseY-400, 0, mouseX%radius, shade);
       circle2 = new Circle(mouseX-400, mouseY-400, 0, mouseX/radius, shade);
    }
  if (mod == true)
    circles.add(circle1);
  else
    circles.add(circle2);
}
class Box 
{
   float x;
   float y;
   float z;
   color shade;
   float size;
   
   Box(float x, float y, float z, color shade, float size)
   {
      this.x = x;
      this.y = y;
      this.z = z;
      this.shade = shade;
      this.size = size;
   }
   
   void display()
   {
     translate(x, y, z);
     fill(shade);
     box(size);
   }
}

class Sphere
{
  float x;
   float y;
   float z;
   color shade;
   float size;
   
   Sphere(float x, float y, float z, color shade, float size)
   {
      this.x = x;
      this.y = y;
      this.z = z;
      this.shade = shade;
      this.size = size;
   }
   
   void display()
   {
     translate(x, y, z);
     fill(shade);
     sphereDetail(8);
     //noStroke();
     sphere(size);
   }
}

class shootingLines
{
  PVector point1;
  PVector point2;
  
  shootingLines(PVector point1, PVector point2)
  {
     this.point1 = point1;
     this.point2 = point2;
  }
  
  void display()
  {
     line(point1.x, point1.y, point1.z, point2.x, point2.y, point2.z);
  }
  
}

class Line
{
   float x1;
   float y1;
   float x2;
   float y2;
   float z;
   
   Line(float x1, float y1, float x2, float y2, float z)
   {
      this.x1 = x1;
      this.y1 = y1;
      this.x2 = x2;
      this.y2 = y2;
      this.z = z;
   }
   
   void display()
   {
      translate(0, 0, z);
      line(x1, y1, x2, y2);
   }
}

class Circle
{
   float x;
   float y;
   float z;
   float radius;
   color shade;
   
   Circle(float x, float y, float z, float radius, color shade)
   {
      this.x = x;
      this.y = y;
      this.z = z;
      this.radius = radius;
      this.shade = shade;
   }
   
   void display()
   {
      translate(0, 0, z);
      fill(shade);
      ellipse(x, y, radius, radius); 
   }
}

color rainbow(float t)
{
  if (rotate == true)
  {
    color fill;
    color c4 = color(#FFC83B);
    color c5 = color(#FFD5D1);
    color c6 = color(#1970CB);
    if (t < 1/6.)
    {
    t*=6;
    fill = lerpColor(c1, c2, t);
  }
  else if (t>= 1/6. && t<1/3.)
  {
   t = (t-1/6.)*6;
   fill = lerpColor(c2, c3, t);
  }
  else if (t>=1./3 && t <1/2.)
  {
   t = (t-1/3.)*6;
   fill = lerpColor(c3, c4, t);
  }
  else if (t >= 1/2. && t < 2/3.)
  {
     t = (t-1/2.)*6;
     fill = lerpColor(c4, c5, t);
  }
  else if (t>= 2/3. && t < 5/6.)
  {
     t = (t-2/3.)*6;
     fill = lerpColor(c5, c6, t);
  }
  else
  {
     t = (t-5/6.)*6;
     fill= lerpColor(c6, c1, t);
  }
    
    return fill;
  }
  else {
  color fill = 0;
  if (t < 1/3.)
  {
    t*=3;
    fill = lerpColor(c1, c2, t);
  }
  else if (t>= 1/3. && t<2/3.)
  {
   t = (t-1/3.)*3;
   fill = lerpColor(c2, c3, t);
  }
  else if (t>=2./3)
  {
   t = (t-2/3.)*3;
   fill = lerpColor(c3, c1, t);
  }
  return fill;
  }
  
  
}

void keyPressed()
{
    if (keyCode == RIGHT)
    {
       vx+= 1; 
    }
    
    else if (keyCode == LEFT)
    {
       vx -= 1; 
    }
    
    else if (keyCode == UP)
    {
       vy-= 1; 
    }
    else if (keyCode == DOWN)
    {
       vy+= 1; 
    }
    else if (key == 'w')
    {
      vz++;
    }  
    else
    {
       vz--; 
    }
    
    if (key == ' ')
    {
       refresh = false; 
    }
    
    if (key == 'k')
    {
       kaleidClass = true; 
    }
    
    if (keyCode == RIGHT && rotate != true)
    {
      angle ++;
    }
    
    else if (keyCode == LEFT && rotate != true)
    {
       angle --; 
    }
    
    if (key == 'z')
    {
       noZ = true; 
    }
    
    if (key == 'c')
    {
      if (rotateBoxes == true)
      {
          rotateBoxes = false;
         circle = true; 
         
      }
      else if (circle == true)
      {
        circle = false;
        rotateLines = true;
        
      }
      else if (rotateLines == true)
      {
        rotateBoxes = true;
        rotateLines = false;
      }
    }
    
    if (rotate == true && keyCode == RIGHT)
    {
       //angle2 ++; 
       change += 0.3;
       //rotating += ;
    }
    else if (rotate == true & keyCode == LEFT)
    {
       //angle2 --;
       change -= 0.3;
       //rotating += 0.1;
    }
    
    
    if (key == 's')
    {
       solar = true; 
    }
    
}

void mousePressed()
{
   if (gameStage == 0)
   {
      if (mouseX > 180 && mouseX < 220  && mouseY > 180 && mouseY < 220)
      {
        gameStage = 1;
        addBoxes1 = true;
      }
      else if (mouseX > 580 && mouseX < 620 && mouseY > 580 && mouseY < 620)
      {
        gameStage = 1;
        addSpheres1 = true;
      }
      else if (mouseX >180 && mouseX < 320 && mouseY > 580 && mouseY < 620)
      {
         gameStage = 1;
         addLines1 = true;
      }
      else if (mouseX > 580 && mouseY < 400)
      {
         gameStage = 1;
         addRays1 = true;
      }
     
      else if (mouseX <100 && mouseY > 680)
      {
        gameStage = 1;
        rotate = true;
      }
      else if (mouseX < 100 && mouseY<100)
      {
       gameStage = 1;
       spiral = true;
      }
      else
      {
         gameStage = 1;
         addCircles1 = true;
      }
     
   }
   
   if (gameStage == 1 && addRays1 == true)
   {
      chooseX = mouseX;
      chooseY = mouseY;
   }
   
   if (gameStage == 1 && mouseX > 660 && mouseY>660)
   {
     gameStage = 0;
     count = 2;
     if (addBoxes1 == true)
     {
        addBoxes1 = false; 
     }
     else if (addLines1 == true)
     {
        addLines1 = false; 
     }
     else if (addRays1 == true)
     {
        addRays1 = false; 
     }
     else if (addCircles1 == true)
     {
        addCircles1 = false; 
     }
     else if (addSpheres1 == true)
     {
        addSpheres1 = false; 
     }
     else if (rotate == true)
     {
      rotate = false; 
     }
     kaleidClass = false;
     refresh = true;
     stroke(0);
     noZ = false;
    }
    
     
   
   

   if (gameStage == 1 && addCircles1 == true)
   {
      radius = int(random(0, 100));
      if (mouseX>400)
        mod = true;
      else
        mod = false;
        
   }
   
   if (gameStage == 1 && addLines1 == true && kaleidClass == true)
   {
      shadeChange = true; 
   }
   
   if (gameStage == 1 && mouseX < 100 && mouseY < 100)
    {
       gameStage = 0;
       count = 2;
     }
     
   
   
}

void keyReleased()
{
   vx = 0;
   vy = 0;
   vz = 0;
}
