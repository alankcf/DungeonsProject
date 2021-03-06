class DarknessCell {
  float opacity;
  float x, y, size;
  PVector location;
  float d;

  DarknessCell(float _x, float _y, float s) { //no extends GameObject
    size = s;
    x = _x;
    y = _y;
    location = new PVector(_x, _y);
    opacity = 10; //get rid later
  }

  void show() {
    //draw square
    noStroke();
    d = dist(location.x, location.y, myHero.location.x, myHero.location.y);
    opacity = map(d, 0, 500, 0, 255); 
    fill(black, opacity); //0 = transparent
    rect(x, y, size, size);
  }
}
