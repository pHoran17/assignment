abstract class dispObject
{
  float x, y;
  float rad;
  float theta;
  float speed;
  float freq;
  color col;
  
  abstract void render();
  abstract void update();
}