class target extends dispObject
{
  float x1,y1,x2,y2,x3,y3,x4,y4;
  PVector position;
  color col;
  
  target(float posX, float posY, color col,float x1, float y1)
  {
    position = new PVector(posX,posY);
    this.col = col;
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x1 - 10;
    this.y2 = y1+10;
    this.x3 = x1 + 20;
    this.y3 = y1 + 20;
    this.x4 = x1 + 10 ;
    this.y4 = y1 + 10;
  }
  //draw shape, render/spawn in and float forward in random direction. Set up hit detection with reticle
  void render()
  {
    fill(0,0,200);
    quad(x1,y1,x2,y2,x3,y3,x4,y4);
    line(x1+3,y1+5,x1+15,y1-3);
    line(x1+15,y1-3,x1+8,y1+9);
    line(x2+4,y2+1,x2,y2+9);
    line(x2,y2+9,x2+10,y2+4);
    
  }
  void update()
  {
    position.x += 10;
    position.y += 5;
  }
}