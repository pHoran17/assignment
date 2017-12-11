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
    position.x = cenX/10;
    position.y = cenY/10;
    mousePressed();
    mouseReleased();
    checkCollisions();
  }
  void checkCollisions()
  {
    for (int i= dispObjects.size() - 1; i >= 0; i--)//Cant remove objects if iterating forwards, iterate backwards to remove objects
    {
      dispObject tar = dispObjects.get(i);
      //dispObject dis = dispObjects.get(i);
      if(tar instanceof target)
      {
        if(dist(this.position.y, this.position.y, tar.position.x, tar.position.y) < 5)
        {
          dispObjects.remove(tar);
        }
      }
      /*if(tar instanceof target && dis instanceof display)
      {
        if(dist(tar.position.x,tar.position.y, dis.x + 100,dis.y + 60) <= 200)
        {
          println(dist(tar.position.x,tar.position.y, dis.x + 100,dis.y + 60));
          dispObjects.remove(tar);
        }
      }
      */
        
      }
    }
  
  
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
      col = color(255,0,0);
  }
  void mouseReleased()
  {
      col = color(255,255,255);
  }
}