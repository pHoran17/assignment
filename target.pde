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
  //Set up hit detection with reticle. Unable to due to being unable to read data from position vector specifically y axis
  void render()
  {
    pushMatrix();
    fill(0,0,200);
    translate(position.x,position.y);
    quad(x1,y1,x2,y2,x3,y3,x4,y4);
    line(x1+3,y1+5,x1+15,y1-3);
    line(x1+15,y1-3,x1+8,y1+9);
    line(x2+4,y2+1,x2,y2+9);
    line(x2,y2+9,x2+10,y2+4);
    popMatrix();
    
  }
  void update()
  {
    position.x += random(1,3);
    position.y += random(1,3);
    checkEdges();
  }
  void checkEdges()
  //Method used to check if any target objects touch the edge of the screen, if they do they should be destroyed. Will not work due to being unable to read position.y values properly
  {
    for (int i= dispObjects.size() - 1; i >= 0; i--)//Cant remove objects if iterating forwards, iterate backwards to remove objects
    {
      dispObject tar = dispObjects.get(i);
      if(tar instanceof target)
      {
        if(tar.position.x < 0 || tar.position.x > width)
        {
          dispObjects.remove(tar);
        }
        if(tar.position.y < 0 || tar.position.y >= 400)
        {
          dispObjects.remove(tar);
        }
      }
    }
   }
}