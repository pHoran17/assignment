class radar extends dispObject
{
  float cenX, cenY;
  float rad;
  float theta;
  float speed;
  float freq;
  color col;
  
  radar(float cenY, float cenX, float rad, float freq, color col)
  {
    
    this.cenY = cenY;
    this.cenX = cenX;
    this.rad = rad;
    this.freq = freq;
    this.speed = (PI / 60.0) * freq;
    this.theta = 0;
    this.col = col;
  }
  
  void update()
  {
    theta += speed;
  }
  
  void render()
  {
    pushMatrix();
    stroke(0, 255, 0);
    noFill();
    ellipse(cenX, cenY, rad * 2, rad * 2);
    int trailLength = 10;
    float greenIntensity = color(255) / (float)trailLength;
    for(int i = 0 ; i < trailLength ; i ++)
    {
      stroke(0, i * greenIntensity, 0);
      float x = cenX + sin(theta + i * speed) * rad;
      float y = cenY -cos(theta + i * speed) * rad;
      line(cenX, cenY, x, y);
    }
    popMatrix();
  }
}