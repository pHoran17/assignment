abstract class dispObject
{
  float x, y;
  float rad;
  float theta;
  float speed;
  float freq;
  color col;
  PVector position = new PVector(x,y);
  
  abstract void render();
  abstract void update();
}