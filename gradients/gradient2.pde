



void setup()
{
 size(500, 500);

 frameRate(20);
}


void draw() {
  int c1 = color(0, 0, 255);
  int c2 = color(0, 255, 0);
  int c3 = color(255, 0, 0);
  
  
  float T = 300;
  float t = (frameCount % T)/100;
  
  if (t < 1.0)
    background(lerpColor(c1, c2, t));
  else if (t >= 1.0 && t <= 2.0)
    background(lerpColor(c2, c3, t-1));
  else
    background(lerpColor(c3, c1, t-2));
  
 
  

  

    
}