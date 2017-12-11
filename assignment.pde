import ddf.minim.*;
//Fix reticle so it renders once
void setup()
{
  size(800,600);
  background(0,0,0);
  frameRate(60);
  noCursor();
  minim = new Minim(this);
  mouse= new PVector(mouseX, mouseY);
  //tar = new PVector(10,20);
  dispObjects.add(new display(375,415,100,60));
  dispObjects.add(new radar(450,260,40,0.5,color(0,0,200)));
  dispObjects.add(new reticle(width/2,height/2,15,mouse,color(255,255,255)));
  //dispObjects.add(new target(10,20,color(200,200,200),width/2, 100));
  PImage image0 = loadImage("black.png");
  images.add(image0);
  PImage image1 = loadImage("fox.png");
  images.add(image1);
  PImage image2 = loadImage("falco.png");
  images.add(image2);
  PImage image3 = loadImage("peppy.png");
  images.add(image3);
  PImage image4 = loadImage("slippy.png");
  images.add(image4);
  blankPlay = minim.loadFile("startup.mp3");
  sounds.add(blankPlay);
  blankPlay.play();  
  fPlay = minim.loadFile("foxChatter.wav");
  sounds.add(fPlay);
  faPlay = minim.loadFile("falcoChatter.wav");
   sounds.add(faPlay);
  pPlay = minim.loadFile("peppyChatter.wav");
   sounds.add(pPlay);
  sPlay = minim.loadFile("slippyChatter.wav");
   sounds.add(sPlay);
  
  //noStroke();
}
Minim minim;
AudioPlayer fPlay, pPlay, faPlay, sPlay,blankPlay;
reticle ret;
PVector mouse, tar;
ArrayList <PImage> images = new ArrayList<PImage>();
ArrayList<AudioPlayer> sounds = new ArrayList<AudioPlayer>();
//dispImage = image(images.get(i), 380, 420,90,50);
ArrayList<dispObject> dispObjects = new ArrayList<dispObject>();
int i=0;
int j;


void draw()
{
  stroke(220,220,220);
  fill(200,200,200);
  //triangle(200,400,425,300,650,400);
  line(200,403,100,600);
  line(250,403,150,600);
  line(650,403,750,600);
  line(600,403,700,600);
  rect(200,401,450,100);
  if(frameCount % 120 == 0)
  {
    if(random(0,1) > 0.5)
    {
      dispObject p = new target(10,20,color(200,200,200),random(0, width), random(0, 400));
      dispObjects.add(p);
    }
  }
  for(j=dispObjects.size()-1; j >=0 ;j--)
  {
    dispObject d = dispObjects.get(j);
    d.render();
    d.update();
  }
  image(images.get(i), 380, 420,91,50);
  

}

void keyPressed()
{
  //Get image to match up with right sound
  if(keyCode == 32)//Space bar changes picture + plays sound
  {
    int rand = (int)random(1,4);
    switch(rand)
    {
      case 1:
      {
        sounds.get(1).rewind();
        sounds.get(1).play();
        i=1;
        break;
      }
      case 2:
      {
        sounds.get(2).rewind();
        sounds.get(2).play();
        i=2;
        break;
      }
      case 3:
      {
        sounds.get(3).rewind();
        sounds.get(3).play();
        i=3;
        break;
      }
      case 4:
      {
        sounds.get(4).rewind();
        sounds.get(4).play();
        //i=4;
        break;
      }
      default:
      {
        sounds.get(0).rewind();
        sounds.get(0).play();
        i=0;
      }
    }
    
  }
  /*
    if(key == 'w')//W moves reticle up
    {
      ret.cenY -= 10;
    }
    if(key == 's')//S moves reticle up
    {
      ret.cenY += 10;
    }
    if(key == 'a')//A moves reticle left
    {
      ret.cenX -= 10;
    }
    if(key == 'd')//D moves reticle right
    {
      ret.cenX += 10;
    }
    */
    
    
  }
  

//Keypressed and Key released will be included here
//Implement reticle when completed