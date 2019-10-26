int level = 0;
int level1 = 0;
int colorDot = 255;
int n = 5;
float radius = 10;
int s = 2;
int GameState = 0;
float w = 300;
float h = 200;
float x = -150;
float y = -100;
float centerX = 0;
float centerY = 0;
float length = (float) 10.0;
float x2 = 0;
float y2 = 10;
float LineX = 400;
float LineY = 700;
float LineX2 = 400;
float LineY2 = 500;
int startX = 600;
int startY = 400;
  
   float scale1 = 0.7f;
   int angle = 4;
   int g = 1;
   int times2 = 1;
   int angle2 = 4;
   int branchLength = 0;

void setup() {
 size(800, 800); 
}

void drawDot(int level, float radius)
{
  pushMatrix();
  if (level <= 0)
    ellipse(0, 0, radius, radius);
  else // up and down - user input
  {
    
    drawDot(level-1, radius);
    //strokeWeight(pow(4, level));
    for (int i = 0; i<n; i++)
    {  
      
      pushMatrix();
      rotate(i*2*PI/n);
      scale(1f/s); //change scale to get different figures
      radius += level*2;
      translate(250, 0);
      drawDot(level-1, radius);
      popMatrix();
      
    }
    //draw the dot w new origin, and rotate, w/ matrix 
  }
  popMatrix();
}

ArrayList<Rectangle> rects = new ArrayList<Rectangle>();
  
  public ArrayList<Rectangle> split(ArrayList<Rectangle> rects)
  {
    ArrayList<Rectangle> result = new ArrayList<Rectangle>();
    
    for (Rectangle s: rects)
    {
      ArrayList<Rectangle> temp = s.split();
      result.add(s);
      for (Rectangle a: temp)
        result.add(a);
    }
    return result;
  }
  
 void recalculate()
  {
    rects.add(new Rectangle(x, y, w, h, 2));
    
    for (int i=0; i<level1; i++)
    {
      rects = split(rects);  
    }

  }
  
   void drawCheck(int level)
  {
    
    drawRect(rects);
    
  }
  
   void drawRect(ArrayList<Rectangle> rects)
  {
    
    for (int i=0;i<rects.size(); i++)
    {
      
      if (rects.get(i).rectColor == 1)
      {  
        fill(0);
        stroke(255);
      }
      else
      {
        fill(255);
      }
      
      rects.get(i).display();
    }
  
  }
  
  
   void recalc()
  {
    lines = new ArrayList<Line>();
    lines.add(new Line(LineX, LineY, LineX2, LineY2));
    for (int i = 0; i<level; i++)
      lines = branch(lines);
  
  }
  
  ArrayList<Line> lines = new ArrayList<Line>();
  
   ArrayList<Line> branch(ArrayList<Line> lines)
  {
    ArrayList<Line> result = new ArrayList<Line>();
    
    for (Line a: lines)
    {
      ArrayList<Line> temp = a.split(scale1, angle, g, times2, angle2, branchLength);
      result.add(a);
      for (Line c: temp)
        result.add(c);
    }
  
    return result;
  }
  
   void drawTree(int level)
  {
    drawLine(lines);
  }
  
   void drawLine(ArrayList<Line> lines)
  {
    for (Line b: lines)
    {
      stroke(0);
      b.display();
    }
  }
  
     void draw()
    {
        if (GameState == 0)
        {
          background(255);
          //startScreen();
          textSize(50);
          fill(0);
          text("FRACTALS. \n Click on a keyword", 200, 250); 
          textSize(20);
          text("Dots", 200, 400);
          text("Checkers", 400, 400);
          text("Tree", 650, 400);
        }
        else if (GameState == 1)
        {
          background(255);
          fill(0);
          textSize(20);
          text("Scale", 25, 50);
          text("Bigger", 100, 50);
          text("Smaller", 100, 100);
          text("Number of Turns", width-300, 50);
          text("Increase", width - 100, 50);
          text("Decrease", width - 100, 100);
          text("Back to home", 50, 750); 
          text("Black dot", 750, 750);
         
          translate(width/2, height/2);
          fill(colorDot);
        
          drawDot(level, radius);
        }
        else if (GameState == 2)
        {
          background(255);
          fill(0);
          text("Back to home", 50, 750);
          translate(width/2, height/2);
          drawCheck(level);
          fill(0);
          text(level1, 200, 200);
           
        }
        else if (GameState == 3)
        {
          background(255);
          text("Scale: ", 20, 50);
          text("Smaller", 75, 50);
          text("Bigger", 75, 100);
          text("Angles: ", 225, 50);
          text(" Increase ", 300, 50);
          text(" Decrease  ", 300, 100);
          
          text("Number of Branches:  ", 450, 50);
          text(" More ", 650, 50);
          text(" Less ", 650, 100);
          text("Longer branch ", 100, 780);
          text("Shorter branch", 300, 780);
          text("Make angles different.", 500, 780);
          text("Back to home", 2, 700); 
          drawTree(level);
        }
        
    }
    
     void deFault()
  {
    level = 0;
    scale1 = 0.7f;
    angle = 4;
    g = 1;
    times2 = 1;
    angle2 = 4;
    
  }
  
    ArrayList<Circle> circles = new ArrayList<Circle>();
    
    int standard = 5;
    float circlex = 399;
    float circley = 399;
    int red = 255;
    int green = 0;
    int blue = 0;
    int time = 0;
    int vx = 1;
    int vy = 1;
    
     void displayCircles()
    {
      for (Circle c: circles)
      {
        if (c.Time < standard)
        {
          c.display();
          standard++;
        }
      }
    
    }
    
     void addCircles(float Circlex, float Circley, int Red, int Green, int Blue, int Time)
    {
      if (Circlex + vx >= 775 || Circlex + vx <= 0)
        vx = -vx;
      else if (Circley + vy >= 0 || Circley + vy >= 775)
        vy = -vy;
      circles.add(new Circle(Circlex + vx, Circley + vy, Red, Green, Blue, Time));
      if (red > 0 && green < 255)
      {
        red -= 5;
        green += 5;
      }
      else if (green <= 255 && green > 0 && blue < 255)
      {
        green -= 5;
        blue += 5;
      }
      else if (blue <= 255 && blue > 0 && red <255)
      {
        blue -= 5;
        red += 5;
      }
      
    }
    
     void startScreen()
    {
      for (int i = 0; i < 100; i++)
      {
        addCircles(circlex, circley, red, green, blue, time);
        for (int j = 0; j < circles.size(); j++)
          circles.get(j).plusTime();
        displayCircles();
      }
      
      
    }
    
     void mousePressed()
    {
      if (GameState == 0)
      {
        if (mouseX < 300)
          GameState = 1;
        else if (mouseX < 600 && mouseX > 300)
          GameState = 2;
        else if (mouseX > 600)
        {
          stroke(0);
          fill(0);
          GameState = 3;
        }
      }
      else if (GameState == 1)
      {
        if (mouseX < 100 && mouseY > 700 & mouseY<790)
        {
          level = 0;
          GameState = 0;
        }
        else if (mouseX > 700 && mouseY > 700 && colorDot == 0)
          colorDot = 255;
        else if (mouseX > 700 && mouseY > 700)
          colorDot = 0;
        else if (mouseX > 70 && mouseX < 150 && mouseY < 75)
        {
          s --;
        }
        else if (mouseX > 70 && mouseX < 150 && mouseY > 25 && mouseY < 150)
        {
          s ++;
        }
        
        else if (mouseX > width - 290 && mouseY < 80)
        {
          n ++;
        }
        else if (mouseX > width - 290 && mouseY < 140 && mouseY > 90)
        {
          n --;
        }
        
      }
      else if (GameState == 2)
      {
        if (mouseX < 100 && mouseY > 700 & mouseY<790)
        {
          level1 = 0;
          GameState = 0;
        }
      
      }
      else if (GameState == 3)
      {
        if (mouseX>250 && mouseX<350 && mouseY<65)
        {
          angle ++;
          angle2 ++;
          recalc();
        }
        else if (mouseX>250 && mouseX<350 && mouseY>65 && mouseY < 135)
        {
          angle--;
          angle2--;
          recalc();
        }
        else if (mouseX > 30 && mouseX < 120 && mouseY < 65)
        {
          scale1 -= 0.1f;
          recalc();
      }
        else if (mouseX > 30 && mouseX < 120 && mouseY > 65 && mouseY < 135)
        {
          scale1 += 0.1f;
          recalc();
        }
      
        else if (mouseX>600 && mouseX<700 && mouseY<75)
        {
          g++;
          recalc();
        }
        else if (mouseX>600 && mouseX < 700 && mouseY > 75 && mouseY < 125)
        {
          g--;
          recalc();
        }
        
        else if (mouseX>100 && mouseX<250 && mouseY>750)
        {
          branchLength ++; 
          recalc();
        
        }
        else if (mouseX > 250 && mouseX < 400 && mouseY > 750)
        {
          branchLength --;
          recalc();
        }
        else if (mouseX>470 && mouseX<700 && mouseY>750)
        {
          angle2 = 2+ (int) (Math.random()*11);
          recalc();
        }
        else if (mouseX < 150 && mouseY > 650 & mouseY< 725)
        {
          deFault();
          recalc();
          GameState = 0;
          
        }
        
      
      }
      
    
    }
    
     void keyPressed()
    {
      if (GameState == 0)
      {
        if (key == '1')
          GameState = 1;
        else if (key == '2')
          GameState = 2;
        else if (key == '3')
          GameState = 3;
      }
      else if (GameState == 1)
      {
        if (keyCode == UP)
          level++;
        else if (keyCode == DOWN)
          level--;
        else if (key == 'e')
          s ++ ;
        else if (key == 'd')
          s -- ;
        else if (key == 'q')
          n ++;
        else if (key == 'a')
          n --;  
      }
      else if (GameState == 2)
      {
        if (keyCode == UP)
        {
          if (level1 < 3)
            level1 ++;
          recalculate();
          
          
        }
        else if (keyCode == DOWN)
        {
          level1--;
          recalculate();
        }
        
      
      }
      
      else if (GameState == 3)
      {
        if (keyCode == UP)
        {
          level ++;
          recalc();
        
        }
        else if (keyCode == DOWN)
        {  
          level --;
          recalc();
        }
        else if (key == 'w')
        {  
          scale1 += 0.1f;
          recalc();
          
        }
        else if (key == 's')
        {
          scale1 -= 0.1f;
          recalc();
        }
        else if (key == '1')
        {
          g = 6;
        }
      }
      
    }

   
    int count = 0;

    // private stuff below
    //private Dot d;
    
 class Circle
{

   float X1;
   float Y1;
   int Time;
   int red;
   int green;
   int blue;

   int Color;
  
   Circle(float x1, float y1, int red, int green, int blue, int time)
  {
    X1 = x1;
    Y1 = y1;
    this.red = red;
    this.blue = blue;
    this.green = green;
    Time = time;
    
  }
  
   void display()
  {
    stroke(red, green, blue);
    ellipse(X1, Y1, 50, 50);
  }
  
   void plusTime()
  {
    Time ++;
  }


  
}




 class Rectangle
{
   Rectangle(float x, float y, float w, float h, int rectColor)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    this.rectColor = rectColor;
  }
  
  
  
   void display()
  {
    
    rect(x,y,w,h);
  
  }
  
  
  
   ArrayList<Rectangle> split()
  {
    ArrayList<Rectangle> result = new ArrayList<Rectangle>();
    
    
    if (rectColor == 1)
      return result;
    else if (rectColor == 2)
    {
      result.add(new Rectangle(x, y, w/2, h/2, 1));
      result.add(new Rectangle(x+w/2, y+h/2, w/2, h/2, 1));


      result.add(new Rectangle(x, y+h/2, w/2, h/2, 2));
      result.add(new Rectangle(x+w/2, y, w/2, h/2, 2));
    }
      
      
    
    
    
    return result;
    
  }
    
  
   float x;
   float y;
   float w;
   float h;
   int rectColor;
  
  //ArrayList<Rectangle> rects;
  


}




public class Line
{


  public Line(float LineX, float LineY, float LineX2, float LineY2)
  {
    this.LineX = LineX;
    this.LineY = LineY;
    this.LineX2 = LineX2;
    this.LineY2 = LineY2;
    
    
    
  }
  
  
  public void display()
  {
    
    line(LineX,LineY,LineX2,LineY2);
  
  }
  
  
  
  
   ArrayList<Line> split(float scale1, int angle, int g, int times2, int angle2, int branchLength)
  {
    ArrayList<Line> result = new ArrayList<Line>();
    int times = 1;
    for (int i = 0; i<g ; i++)
    {
      endpoint = new PVector(LineX2-LineX, LineY2-LineY);
      endpoint.mult(scale1);
      endpoint.rotate(times*PI/angle);
      endpoint.add(LineX2, LineY2);
      result.add(new Line(LineX2, LineY2, endpoint.x, endpoint.y));
      
      endpoint2 = new PVector(LineX2-LineX, LineY2-LineY);
      endpoint2.mult(scale1);
      endpoint2.rotate(-PI*times2/angle2);
      endpoint2.add(LineX2 - branchLength, LineY2 - branchLength);
      result.add(new Line(LineX2, LineY2, endpoint2.x, endpoint2.y));
      
      times ++;
      times2 ++;
    }
    
    /*
    endpoint2 = new PVector(LineX2-LineX, LineY2-LineY);
    endpoint2.mult(scale);
    endpoint2.rotate(-PApplet.PI/4);
    endpoint2.add(LineX2, LineY2);
    result.add(new Line(papplet, LineX2, LineY2, endpoint2.x, endpoint2.y));
    */
    return result;
    
    
  }
    
  
  private float LineX;
  private float LineY;
  private float LineX2;
  private float LineY2;
  PVector endpoint, endpoint2;
  

}


  
