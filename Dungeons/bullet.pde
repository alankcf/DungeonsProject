class Bullet extends GameObject {
  
  int c;
  
  Bullet() {
    location = new PVector(myHero.location.x, myHero.location.y);
    velocity = new PVector(myHero.location.x, myHero.location.y);
    size = 10;
    c = white;
  }
  
  Bullet(int dir,int co, int si) {
    //direction = dir;
   size = si;
   c = co;
  }
  
  void show() {
    fill(c);
    ellipse(location.x, location.y, size, size);
  }
  
  void act() {
    super.act();
  }
}
