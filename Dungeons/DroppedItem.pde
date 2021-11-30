class DroppedItem extends GameObject {
  
  int type;
  Weapon w;
  color c;
  int dropped;
  
  DroppedItem(float x, float y, int rx, int ry) {
    dropped = int (random(1, 3));
    if (dropped == 1) health = true;
    if (dropped == 2) gun = true;
    w = new ShotGun();
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 30;
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
      //fill(black);
      //textSize(5);
      //text("Health", location.x, location.y);
      image(healthpotion, location.x, location.y, size, size);
    } else if (gun == true) {
      stroke(black);
      strokeWeight(2);
      fill(c);
      circle(location.x, location.y, size);
      //fill(black);
      //text("GUN", location.x, location.y);
      image(shotgun, location.x, location.y, size, size/2);
    } else if (dropped == 4) {
      //nothing
    }
  }
  
  void act() {
    //nothing
    dropped = int (random(1, 3));
  }
}

class Indicator extends GameObject {
  
  int t;
  
  Indicator(float x, float y) {
    lives = 0;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 10;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    t = 100;
  }
  
  void show() {
    fill(grey, t);
    textSize(30);
    text("+1", location.x, location.y);
  }
  
  void act() {
    //super.act();
    location.x--;
      t = t - 1;

      if (t <= 0) lives = 0;
    }
  
}
