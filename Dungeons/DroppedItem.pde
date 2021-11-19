class DroppedItem extends GameObject {
  
  int type;
  Weapon w;
  color c;
  int GUN;
  
  DroppedItem(float x, float y, int rx, int ry) {
    //type = GUN;
    w = new ShotGun();
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c = brown;
  }
  
  void show() {
    //use if statements to draw different items differently
    stroke(black);
    strokeWeight(2);
    fill(c);
    circle(location.x, location.y, size);
  }
  
  void act() {
    //nothing
  }
}
