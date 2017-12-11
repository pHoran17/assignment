class reticle extends dispObject
{
  //Move reticle with mouse or arrow keys
  float cenX,cenY;
  float rad;
  PVector position = new PVector(x,y);
  color col;
  
  reticle(float cenX, float cenY, float rad,PVector position,color col)
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
    //translate(position.x,position.y);
    stroke(col);
    noFill();
    ellipse(cenX,cenY,rad*2,rad*2);
    popMatrix();
  }
  
  void update()
  {
    cenX = mouseX;
    cenY = mouseY;
    //position.x = cenX;
    //position.y = cenY;
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
        if(dist(this.cenX, this.cenY, tar.position.x, tar.position.y) < this.rad)
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