void setup()
{
  size(700, 700);
   
  for (int i=0; i<3; i++)
  {
     for (int j=0; j<7; j++)
     {
        visible[i][j] = true; 
     }
  }
  
  Brick brick = new Brick();
  brick.x = 150;
  brick.y = 250;
  bricks.add(brick);
   
  brick = new Brick();
  brick.x = 250;
  brick.y = 250;
  bricks.add(brick);
  
  brick = new Brick();
  brick.x = 350;
  brick.y = 250;
  bricks.add(brick);
  
  brick = new Brick();
  brick.x = 450;
  brick.y = 250;
  bricks.add(brick);
  
  brick = new Brick();
  brick.x = 200;
  brick.y = 200;
  bricks.add(brick);
  
  brick = new Brick();
  brick.x = 300;
  brick.y = 200;
  bricks.add(brick);
  
  brick = new Brick();
  brick.x = 400;
  brick.y = 200;
  bricks.add(brick);
  
  brick = new Brick();
  brick.x = 150;
  brick.y = 150;
  bricks.add(brick);
  
  brick = new Brick();
  brick.x = 250;
  brick.y = 150;
  bricks.add(brick);
  
  brick = new Brick();
  brick.x = 350;
  brick.y = 150;
  bricks.add(brick);
  
  brick = new Brick();
  brick.x = 450;
  brick.y = 150;
  bricks.add(brick);
}

int upperLeft = 0;
int upperMiddle = 0;
int upperRight = 0;
int middleLeft = 0;
int middleMiddle = 0;
int middleRight = 0;
int lowerLeft = 0;
int lowerMiddle = 0;
int lowerRight = 0;
int current = 1;

int gameState = 0;
int winner = 0;

float ballx,bally=400;
int start=0;
float vx=random(-6,6);
float vy=random(3,6);
int base=200;
float brickx=random(25, 725);
float bricky=random(25, 400);

boolean[][] visible = new boolean[3][7];

ArrayList<Brick> bricks = new ArrayList<Brick>();


void draw()
{
    if (gameState == 0)
    {
      background(0);
      text("Press 't' to play Tic Tac Toe or 'b' to play Brick Breaker", width/10, height/10);
    }
    else if (gameState == 1)
    {
      drawStart();
    }
    else if (gameState == 2)
    {
      drawGame(); 
    }
   else if (gameState == 3)
    {
      drawEndTicTacToe();
      gameState = 0;
    }
   
   else if (gameState == 4)
     drawBrickBreaker();
   
   else if (gameState == 5)
     drawEndBrickBreaker();
     
   /*else if (gameState == 6)
     drawNibble();
     */
}

void drawStart()
{
  background(0);
  fill(255);
  text("Press any key to start.", width/5, height/5);
}

void drawEndTicTacToe()
{
  background(0);
  fill(255);
  text("The end", width/5, height/5);
  
  if (winner == 1)
    text("X wins", 300, 300);
  else if (winner == 2)
     text("O wins", 300, 300);
  else
    text("No one wins", 300, 300);
  
    
}

/*void drawNibble()
{
  background(0);
*/
  

class Brick
{
  int x;
  int y;
  boolean visible = true;
 
  void display()
  {
    if (visible)
    {
      fill(0, 255, 0);
      rect(x, y, 75, 30);
    }
  }
}

void drawBrickBreaker()
{
 
    fill(255);
    background(0);
    rect(mouseX,600,base,40);
    ellipse(ballx,bally,10,10);
    

    
    ballx=ballx+vx;
    bally=bally+vy;
    if (ballx<0 || ballx>750)
    {
      vx=-vx;
    }
    if (bally<0 || ballx > mouseX && ballx < mouseX+base && bally>600)
    {
      vy=-vy;
      //vx=vx+random(-2,4);
    }
   
   for (Brick b : bricks)
   {
      b.display(); 
      
      if (b.visible == true && ballx > b.x && ballx < b.x+75 && bally > b.y && bally < b.y+30)
      {
         b.visible = false; 
         vy = -vy;
      }    
   
     
   }
   
 
    
    // collision detection
    //list of balls next
    
   if (bally > 640)
     gameState = 5;
  
}

void drawEndBrickBreaker()
{
  background(255);
  text ("You Lost", width/30, height/10);   
  gameState = 0;
}
  

boolean isTopRow(int value)
{
  if (upperLeft == value && upperMiddle == value && upperRight == value)
    return true;
  else
    return false;
}

boolean isMiddleRow(int value)
{
  if (middleLeft == value && middleMiddle == value && middleRight == value)
    return true;
  else
    return false;
}

boolean isLowerRow(int value)
{
  if (lowerLeft == value && lowerMiddle == value && lowerRight == value)
    return true;
  else
    return false;
}

boolean isLeftColumn(int value)
{
  if (upperLeft == value && middleLeft == value && lowerLeft == value)
    return true;
  else
    return false;
}

boolean isMiddleColumn(int value)
{
  if (upperMiddle == value && middleMiddle == value && lowerMiddle == value)
    return true;
  else
    return false;
}

boolean isRightColumn(int value)
{
  if (upperRight == value && middleRight == value && lowerRight == value)
    return true;
  else
    return false;
}

boolean isNegativeDiagonal(int value)
{
  if (upperLeft == value && middleMiddle == value && lowerRight == value)
    return true;
  else
    return false;
}

boolean isPositiveDiagonal(int value)
{
  if (lowerLeft == value && middleMiddle == value && upperRight == value)
    return true;
  else
    return false;
}

void checkForWin()
{
  if (isTopRow(1))  // || isMiddleRow(1))
  {
     winner = 1;
     gameState = 3;
  }
  
  if (isTopRow(2))
  {
     winner = 2;
     gameState = 3;
  }
  
  
  
  if (isMiddleRow(1))  // || isMiddleRow(1))
  {
     winner = 1;
     gameState = 3;
  }
  
  if (isMiddleRow(2))
  {
     winner = 2;
     gameState = 3;
  }
  
  
  
  if (isLowerRow(1))  // || isMiddleRow(1))
  {
     winner = 1;
     gameState = 3;
  }
  
  if (isLowerRow(2))
  {
     winner = 2;
     gameState = 3;
  }
  
  
  
  if (isLeftColumn(1))  // || isMiddleRow(1))
  {
     winner = 1;
     gameState = 3;
  }
  
  if (isLeftColumn(2))
  {
     winner = 2;
     gameState = 3;
  }
  
  
  
  if (isMiddleColumn(1))  // || isMiddleRow(1))
  {
     winner = 1;
     gameState = 3;
  }
  
  if (isMiddleColumn(2))
  {
     winner = 2;
     gameState = 3;
  }
  
  
  
  if (isRightColumn(1))  // || isMiddleRow(1))
  {
     winner = 1;
     gameState = 3;
  }
  
  if (isRightColumn(2))
  {
     winner = 2;
     gameState = 3;
  }
  
  
  
  if (isNegativeDiagonal(1))  // || isMiddleRow(1))
  {
     winner = 1;
     gameState = 3;
  }
  
  if (isNegativeDiagonal(2))
  {
     winner = 2;
     gameState = 3;
  }
  
  
  
  if (isPositiveDiagonal(1))  // || isMiddleRow(1))
  {
     winner = 1;
     gameState = 3;
  }
  
  if (isPositiveDiagonal(2))
  {
     winner = 2;
     gameState = 3;
  }
}


void drawGame()
{
  background(255);
  stroke(0);
  strokeWeight(4);
 
  
  line(225, 100, 225, 600);
  line(450, 100, 450, 600);
  line(80, 250, 605, 250);
  line(80, 450, 605, 450);
  
  if (upperLeft == 1)  // x
  {
    line(100, 100, 200, 200);
    line(200, 100, 100, 200);
  }
  else if (upperLeft == 2) // o
  {
    ellipse(150, 150, 100, 100);
  }
  
  if (upperMiddle == 1)  // x
  {
    line(300, 100, 400, 200);
    line(400, 100, 300, 200);
  }
  else if (upperMiddle == 2) // o
  {
    ellipse(300, 150, 100, 100);
  }
  
  if (upperRight == 1)  // x
  {
    line(500, 100, 600, 200);
    line(600, 100, 500, 200);
  }
  else if (upperRight == 2) // o
  {
    ellipse(550, 150, 100, 100);
  }
  
  if (middleLeft == 1)  // x
  {
    line(100, 275, 200, 375);
    line(200, 275, 100, 375);
  }
  else if (middleLeft == 2) // o
  {
    ellipse(150, 350, 100, 100);
  }
  if (middleMiddle == 1)  // x
  {
    line(300, 275, 400, 375);
    line(400, 275, 300, 375);
  }
  else if (middleMiddle == 2) // o
  {
    ellipse(350, 350, 100, 100);
  }
  if (middleRight == 1)  // x
  {
    line(500, 275, 600, 375);
    line(600, 275, 500, 375);
  }
  else if (middleRight == 2) // o
  {
    ellipse(550, 350, 100, 100);
  }
   if (lowerLeft == 1)  // x
  {
    line(100, 500, 200, 600);
    line(200, 500, 100, 600);
  }
  else if (lowerLeft == 2) // o
  {
    ellipse(150, 525, 100, 100);
  }
   if (lowerMiddle == 1)  // x
  {
    line(300, 500, 400, 600);
    line(400, 500, 300, 600);
  }
  else if (lowerMiddle == 2) // o
  {
    ellipse(350, 525, 100, 100);
  }
  if (lowerRight == 1)  // x
  {
    line(500, 500, 600, 600);
    line(600, 500, 500, 600);
  }
  else if (lowerRight == 2) // o
  {
    ellipse(550, 525, 100, 100);
  }
  
  checkForWin();
}

void mousePressed()
{
  if (mouseX < 250 && mouseY < 250)
    {
    upperLeft = current;
    current = 3 - current;
    }
  else if (mouseX < 400 && mouseY < 250)
    {
    upperMiddle = current;
    current = 3 - current;
    }
  else if (mouseX < 600 && mouseY < 250)
    {
    upperRight = current;
    current = 3 - current;
    }
  else if (mouseX < 250 && mouseY > 300 && mouseY < 450)
    {
    middleLeft = current;
    current = 3 - current;
    }
  else if (mouseX < 400 && mouseX > 250 && mouseY > 300 && mouseY < 450)
    {
    middleMiddle = current;
    current = 3 - current;
    }
  else if (mouseX < 700 && mouseX > 400 && mouseY > 300 && mouseY < 450)
    {
    middleRight = current;
    current = 3 - current;
    }
  else if (mouseX < 250 && mouseY > 300 && mouseY > 450)
    {
    lowerLeft = current;
    current = 3 - current;
    }
  else if (mouseX < 400 && mouseX > 250 && mouseY > 450)
    {
    lowerMiddle = current;
    current = 3 - current;
    }
  else if (mouseX > 400 && mouseY > 550)
    {
    lowerRight = current;
    current = 3 - current;
    }
}
 

void keyPressed()
{
   if (gameState == 0)
   {
      if (key == 't')
        gameState = 1; 
      else if (key == 'b')
        gameState = 4;
   }
   else if (gameState == 1)
   {
      if (key == 's') // skip
        gameState = 2;
      else
        gameState = 2;
   }
   else if (gameState == 2)
   {
      gameState = 0; 
      upperLeft = 0;
      upperMiddle = 0;
      upperRight = 0;
      middleLeft = 0;
      middleMiddle = 0;
      middleRight = 0;
      lowerLeft = 0;
      lowerMiddle = 0;
      lowerRight = 0;
   }
  
}