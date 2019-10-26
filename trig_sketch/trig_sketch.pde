

float circle = 200;
float rotation;
float circleColor;
float freq = 0.000005; 
float cont = 0;
float r; 





void setup() {
  size(500, 500);
  
}

void draw() {
  background(255);
  translate(250, 250);
  rotate(radians(rotation));
  
  

 ellipseMode(RADIUS);
  for (int i=0; i<500; i ++) {
    circle= 200 + 60*sin(millis()*freq*i);
    circleColor=map(circle,200,250,255,1);
    r=map(circle,200,250,10,20);
    
    //fill(color(frameCount%360,10,200));
    //noStroke (jk);
    ellipse(circle*cos(i), circle*sin(i),r,r);    
    rotation+=0.0009;
  }
}
