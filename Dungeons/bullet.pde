class Bullet extends GameObject {
  
  int c;
  int timer;
  
  Bullet() {
    lives = 1;
    location = new PVector(myHero.location.x, myHero.location.y);
    velocity = new PVector(myHero.direction.x, myHero.direction.y);
    velocity.setMag(10);
    size = 10;
    c = white;
    timer = 60;
  }
  
  Bullet(PVector vel, color co, int si) {
   location = new PVector(myHero.location.x, myHero.location.y);
   lives = 1;
   velocity = vel;
   size = si;
   c = co;
   timer = 60;
  }
  
  void show() {
    stroke(black);
    fill(c);
    ellipse(location.x, location.y, size, size);
  }
  
  void act() {
    //super.act();
    location.add(velocity);
    timer--;
    
    if (timer <= 0) lives = 0;
    
    if (location.x <= 100) {
      myObjects.add(new Particle(location.x, location.y));
      myObjects.add(new Particle(location.x, location.y));
      myObjects.add(new Particle(location.x, location.y));
      lives = 0;
    }
    if (location.x >= 700) {
      myObjects.add(new Particle(location.x, location.y));
      myObjects.add(new Particle(location.x, location.y));
      myObjects.add(new Particle(location.x, location.y));
      lives = 0;
    }
    if (location.y <= 100) {
      myObjects.add(new Particle(location.x, location.y));
      myObjects.add(new Particle(location.x, location.y));
      myObjects.add(new Particle(location.x, location.y));
      lives = 0;
    }
    if (location.y >= 700) {
      myObjects.add(new Particle(location.x, location.y));
      myObjects.add(new Particle(location.x, location.y));
      myObjects.add(new Particle(location.x, location.y));
      lives = 0;
    }
  }
}
