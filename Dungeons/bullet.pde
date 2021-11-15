class Bullet extends GameObject {
  
  int c;
  int timer;
  PVector direction;
  boolean good;
  
  Bullet() {
    lives = 1;
    location = new PVector(myHero.location.x, myHero.location.y);
    velocity = new PVector(myHero.direction.x, myHero.direction.y);
    velocity.setMag(10);
    size = 10;
    c = white;
    timer = 60;
    good = true;
  }
  
  Bullet(float x, float y, PVector vel, color co, int si) {
   location = new PVector(x, y);
   lives = 1;
   velocity = vel;
   size = si;
   c = co;
   timer = 60;
   roomX = myHero.roomX;
   roomY = myHero.roomY;
   good = false;
  }
  
  Bullet(PVector vel, color co, int si) {
   location = new PVector(myHero.location.x, myHero.location.y);
   lives = 1;
   velocity = vel;
   size = si;
   c = co;
   timer = 60;
   roomX = myHero.roomX;
   roomY = myHero.roomY;
   good = true;
  }

  void show() {
    strokeWeight(5);
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
      int i = 0;
      while (i < 20) {
        myObjects.add(new Particle(location.x, location.y));
        i++;
      } 
      
      //myObjects.add(new Particle(location.x, location.y));
      //myObjects.add(new Particle(location.x, location.y));
      //myObjects.add(new Particle(location.x, location.y));
      lives = 0;
    }
    
    //damage
    if (immune > 100) {
      if (myHero.location.x - location.x < 10 && myHero.location.y - location.y < 10) {
        myHero.lives = myHero.lives - 5;
        immune = 0;
      }
    }
    
    if (location.x >= 700) {
      int i = 0;
      while (i < 20) {
        myObjects.add(new Particle(location.x, location.y));
        i++;
      } 
      lives = 0;
    }
    if (location.y <= 100) {
     int i = 0;
      while (i < 20) {
        myObjects.add(new Particle(location.x, location.y));
        i++;
      } 
      lives = 0;
    }
    if (location.y >= 700) {
      int i = 0;
      while (i < 20) {
        myObjects.add(new Particle(location.x, location.y));
        i++;
      } 
      lives = 0;
    }
  }
}
