class DroppedItem extends GameObject {
  
  int type;
  Weapon w;
  color c;
  int dropped;
  
  DroppedItem(float x, float y, int rx, int ry) {
    dropped = int (random(1, 4));
    if (dropped == 1) health = true;
    if (dropped == 2) gun = true;
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
    if (health == true) {
      stroke(black);
      strokeWeight(2);
      fill(c);
      circle(location.x, location.y, size);
      fill(black);
      textSize(5);
      text("Health", location.x, location.y);
    } else if (gun == true) {
      stroke(black);
      strokeWeight(2);
      fill(c);
      circle(location.x, location.y, size);
      fill(black);
      text("GUN", location.x, location.y);
    } else if (dropped == 4) {
      //nothing
    }
  }
  
  void act() {
    //nothing
  }
}
