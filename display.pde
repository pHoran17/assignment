class display extends dispObject
{
  
  float x,y;
  float w,h;
  int i;
  display(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w; 
  }
  
  void render()
  {
    
    pushMatrix();
    fill(0);
    stroke(255, 255, 255);
    rect(x,y,w,h);
    popMatrix();
  }
  void update()
  {
   
  }
  
}