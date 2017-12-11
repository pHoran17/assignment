class reticle extends dispObject
{
  //Move reticle with mouse or arrow keys
  float cenX,cenY,x1,x2,x3,x4,y1,y2,y3,y4;
  float rad;
  PVector position = new PVector(x,y);
  color col;
  
  reticle(float cenX, float cenY, float rad,PVector position,color col)// float x1,float x2,float x3,float x4,float y1,float y2,float y3,float y4,
  {
    this.cenX = cenX;
    this.cenY= cenY;
    this.position = position;
    this.rad = rad;
    this.col = col;
  }
  
  void render()
  {
    pushMatrix();
    translate(position.x,position.y);
    stroke(col);
    noFill();
    ellipse(cenX,cenY,rad*2,rad*2);
    /*line(x1,y1,x2,y2);
    line(x3,y3,x4,y4);
    */
    popMatrix();
  }
  
  void update()
  {
    cenX = mouseX;
    cenY = mouseY;
    //checkCollisions();
    if(mousePressed)
    {
      stroke(255,0,0);
    }
  }
  /*void checkCollisions()
  {
    for (int i= dispObjects.size() - 1; i >= 0; i--)//Cant remove objects if iterating forwards, iterate backwards to remove objects
    {
      dispObject go = dispObjects.get(i);
      if(go instanceof target)
      {
        if(dist(this.position.x, this.position.y, go.position.x, go.position.y) < 15)
        {
          dispObjects.remove(go);
        }
      }
    }
  }*/
  
  /*void keyPressed() redundant, will be using mouse control instead
  {
    if(key == 'w')//W moves reticle up
    {
      cenY += cenY;
    }
    if(key == 's')//S moves reticle up
    {
      cenY -= cenY;
    }
    if(key == 'a')//A moves reticle left
    {
      cenX -= cenX;
    }
    if(key == 'd')//D moves reticle right
    {
      cenX += cenX;
    }
  }
  */
  void mousePressed()
  {
      stroke(255,0,0);
  }
  void mouseReleased()
  {
      stroke(255,255,255);
  }
}