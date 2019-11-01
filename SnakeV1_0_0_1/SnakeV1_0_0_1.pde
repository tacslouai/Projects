// Declare variables
ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w=40;
int h=40;
int bs=20;
int dir=2;
int ax=12;
int ay=10;
int[]dx={0,0,1,-1},dy={1,-1,0,0};
boolean gameover=false;
// Set window size and snake starting position
void setup() 
{ 
size(800, 800); x.add(5); y.add(5);
}
// Draw grid
void draw() 
{  
  background(255);
  for (int i=0;i<w;i++) line(i*bs,0,i*bs,height);
  for(int i=0;i<h;i++)line(0,i*bs,width,i*bs);
  // Set snake color and shape
  fill(0, 255, 0); 
  for (int i = 0 ; i < x.size(); i++) rect(x.get(i)*bs, y.get(i)*bs, bs, bs);
  if (!gameover) 
  {
    fill(255, 0, 0); 
    rect(ax*bs, ay*bs, bs, bs);
    if (frameCount%5==0) 
    {
      x.add(0, x.get(0) + dx[dir]); y.add(0, y.get(0) + dy[dir]);
      if(x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) 
      {
        gameover = true;
      }
      for(int i=1;i<x.size();i++) if(x.get(0)==x.get(i)&&y.get(0)==y.get(i)) gameover=true;
      if (x.get(0)==ax && y.get(0)==ay) 
      { 
      ax = (int)random(0, w); ay = (int)random(0, h); // Random position of snake food
      }
      else 
      {
      x.remove(x.size()-1); y.remove(y.size()-1); 
      }
    }
  }
  else 
  {
    fill(0); 
    textSize(30); 
    textAlign(CENTER); 
    text("GAME OVER. Press space",width/2,height/2);
    if(keyPressed&&key==' ') 
    { 
      x.clear(); 
      y.clear(); 
      x.add(5);  
      y.add(5); 
      gameover = false;
    }
  }
}
void keyPressed()
{
  int nd1=key=='s'? 0:(key=='w'?1:(key=='d'?2:(key=='a'?3:-1)));
  if (nd1!=-1&&(x.size()<=1||!(x.get(1)==x.get(0)+dx[nd1]&&y.get(1)==y.get(0)+dy[nd1]))) dir=nd1;
  int nd2=key=='k'? 0:(key=='i'?1:(key=='l'?2:(key=='j'?3:-1)));
  if (nd2!=-1&&(x.size()<=1||!(x.get(1)==x.get(0)+dx[nd2]&&y.get(1)==y.get(0)+dy[nd2]))) dir=nd2;
}
