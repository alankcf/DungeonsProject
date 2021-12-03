class DroppedItem extends GameObject {

  int type;
  Weapon w;
  color c;
  int dropped;
  boolean health, gun;

  DroppedItem(float x, float y, int rx, int ry) {
    dropped = int (random(1, 4));
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
      //drops nothing
    }
  }

  void act() {
    //nothing
    dropped = int (random(1, 3));
    //print(dropped);
    if (lives <= 0) {
      health = false;
      gun = false;
    }
  }
}

class Indicator extends GameObject {

  int t;
  int a;

  Indicator(float x, float y, int rx, int ry, int type) {
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 30;
    roomX = rx;
    roomY = ry;
    t = 255;
    a = type;
  }

  void show() {
    if (a == 1) {
      fill(grey, t);
      textSize(size);
      text("+1", location.x, location.y);  //680, 100
    } else if (a == 2) {
      fill(red, t);
      textSize(size);
      text("-1", location.x, location.y);   
    }
  }

  void act() {
    //super.act();
    location.y--;
    t = t - 1;

    if (t <= 0) lives = 0;
  }
}
