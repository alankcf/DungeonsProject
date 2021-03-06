class AnimatedGif {

  //instance variables (of a GIF)
  PImage [] pics;
  int numFrames;
  int currentFrame;
  float x, y, w, h;
  int rate;

  //constructor
  AnimatedGif(int r, int nf, String prefix, String post) {
    x = width/2;
    y = height/2;
    w = width;
    h = height;
    numFrames = nf;
    pics = new PImage[numFrames]; 
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(prefix + i + post);
      i++;
    }
    currentFrame = 0;
    rate = r;
  }
  
  AnimatedGif(int nf, String prefix, String post, float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    numFrames = nf;
    pics = new PImage[numFrames]; 
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(prefix + i + post);
      i++;
    }
    currentFrame = 0;
    //rate = 7;
  }

  //behavior functions
  void show() {
    imageMode(CENTER);
    //println(currentFrame, numFrames);
    
    rate++;
    if (currentFrame == numFrames) currentFrame = 0;
    image(pics[currentFrame], x, y, w, h);
    //if (frameCount % rate == 0) 
    currentFrame++;
    //if (currentFrame >= pics.length)  currentFrame = 0;
    //image(pics[currentFrame], x, y, w, h);
    //if (frameCount % rate == 0 && myHero.velocity.x != 0) currentFrame++;
  }

  void show(float x, float y, float w, float h) {
    if (currentFrame >= pics.length)  currentFrame = 0;
    image(pics[currentFrame], x, y, w, h);
    if (frameCount % rate == 0 && myHero.velocity.x != 0) currentFrame++;
  }
}
