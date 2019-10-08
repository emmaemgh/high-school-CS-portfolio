
color[][] screen; 

void setup()
{
   size(500, 500); 
   background(255);
   
   screen = new color[500][500];
   
   for (int i = 0; i < width; i++)
   {
       for (int j = 0; j < height; j++)
       screen[i][j] = color(255);
   }
  
}

int count = 0;
color c1 = color(0, 0, 255);
color c2 = color(0, 255, 0);
color c3 = color(255, 0, 0);

void draw()
{
  
  
  
  //int c1 = colors[count%3];
  //int c2 = colors[(count+1)%3];
  
  float T = 200;
  float t = (frameCount % T)/200;
  
  background(rainbow(t));
  
  
  for (int i = 0; i < width; i++)
  {
     for (int j = 0; j < height; j++)
     {
        screen[i][j] = rainbow(t);
        fill(screen[i][j]);
        noStroke();
        rect(i, j, 1, 1);
     }
     t += 0.001;
  }
  //count++;
  
  
  
  
}

color rainbow(float t)
{
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
  

  





     