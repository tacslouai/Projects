// Declare variables
ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
ArrayList<Integer> x2 = new ArrayList<Integer>(), y2 = new ArrayList<Integer>();
String gameOverText = "";
String welcomeText = "Welcome to 2-Player Snake! \n Press any button to play...";
String controlText = "Controls: \n Player 1: W - up A - left S - down D - right \n Player 2: I - up J - left K - down L - right";
int w = 40;
int h = 40;
int bs = 20;
int dir = 2;
int dir2 = 1;
int ax = 12;
int ay = 10;
int[]dx = {0,0,1,-1};
int[]dy = {1,-1,0,0};
int ax2 = 12;
int ay2 = 10;
int[]dx2 = {0,0,1,-1};
int[]dy2 = {1,-1,0,0};
boolean gameOver = false;
boolean gameStart = false; 
PFont font;
// Set window size and snake starting position
void setup() 
{ 
  font = createFont("ZCOOLQingKeHuangYou-Regular.ttf", 500);
  size(800, 800); 
  x.add(5); 
  y.add(5);
  
  x2.add(100);
  y2.add(100);
  
}
void draw() 
{  
  if(gameStart == false)
{
    background(0);
    fill(255);
    textFont(font);
    textSize(50); 
    textAlign(CENTER); 
    text(welcomeText, 400, 200);
    text(controlText, 400, 420);
    if(keyPressed == true)
    {
      gameStart = true;
    }
}
  if(gameStart == true)
 {
  // Draw grid and background
  background(255);
  for (int i=0;i<w;i++) line(i*bs,0,i*bs,height);
  for(int i=0;i<h;i++)line(0,i*bs,width,i*bs);
  // Set snake colors and shape
  fill(0, 255, 0); 
  for (int i = 0 ; i < x.size(); i++) rect(x.get(i)*bs, y.get(i)*bs, bs, bs);
  fill(0, 0, 255);
  for (int i = 0 ; i < x2.size(); i++) rect(x2.get(i)*bs, y2.get(i)*bs, bs, bs);
  
  if (!gameOver) 
  {
    fill(255, 0, 0); 
    rect(ax*bs, ay*bs, bs, bs);
    if (frameCount%5==0) 
    {
      x.add(0, x.get(0) + dx[dir]); y.add(0, y.get(0) + dy[dir]);
      if(x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h)
      {
        gameOver(1);
      }
      x2.add(0, x2.get(0) + dx2[dir2]); y2.add(0, y2.get(0) + dy2[dir2]);
      if(x2.get(0) < 0 || y2.get(0) < 0 || x2.get(0) >= w || y2.get(0) >= h)
      {
        gameOver(2);
      }
      
      for(int i=1;i<x.size();i++){ 
        if(x.get(0) == x.get(i) && y.get(0) == y.get(i)) 
          gameOver=true;
      }
      for(int i=1;i<x2.size();i++){ 
        // Snake collision loss as player 2
        if(x2.get(0)== x2.get(i) && y2.get(0)==y2.get(i))
        {
          gameOver(2);
        }
          // Snake collision loss as player 1
          for(int j=0;j<x.size();j++){
            if(x2.get(0) == x.get(j) && y2.get(0) ==y.get(j))
            {
              gameOver(1);
            }
          }
      }
      if (x.get(0)==ax && y.get(0)==ay) 
      { 
        ax = (int)random(0, w); ay = (int)random(0, h); // Random position of snake food
      }
      else
      {
          x.remove(x.size()-1); y.remove(y.size()-1); 
      }
      if (x2.get(0)==ax && y2.get(0)==ay) 
      { 
        ax = (int)random(0, w); ay = (int)random(0, h); // Random position of snake food
      }
      else 
      {
        x2.remove(x2.size()-1); y2.remove(y2.size()-1); 
      }
    }
  }
  else 
  {
    
    fill(0); 
    textSize(75); 
    textAlign(CENTER); 
    text(gameOverText, 400, 380);
    if(keyPressed&&key==' ') 
    { 
      gameOverText = "";
      x.clear(); 
      y.clear(); 
      x.add(5);  
      y.add(5);
      x2.clear();
      y2.clear();
      x2.add(10);
      y2.add(10);
      gameOver = false;
    }
  }
}
}
void gameOver(int playerNum)
{
  gameOver = true;

  if(playerNum == 1)
  {
    fill(0);
    textAlign(CENTER);
    textFont(font);
    gameOverText = "Player 1... you kinda suck...\n Press Spacebar to Restart";
  }
  if(playerNum == 2)
  {
    fill(0); 
    textAlign(CENTER);
    textFont(font);
    gameOverText = "Player 2... you kinda suck...\n Press Spacebar to Restart";
  }
  
}
void keyPressed()
{
  int nd1=key=='s'? 0:(key=='w'?1:(key=='d'?2:(key=='a'?3:-1)));
  if (nd1!=-1&&(x.size()<=1||!(x.get(1)==x.get(0)+dx[nd1]&&y.get(1)==y.get(0)+dy[nd1]))) dir=nd1;
  int nd2=key=='k'? 0:(key=='i'?1:(key=='l'?2:(key=='j'?3:-1)));
  if (nd2!=-1&&(x2.size()<=1||!(x2.get(1)==x2.get(0)+dx2[nd2]&&y2.get(1)==y2.get(0)+dy2[nd2]))) dir2=nd2;
}
