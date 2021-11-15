class Particle extends GameObject {
  
  int t; //transparancy   
  
  Particle(float x, float y) {
    lives = 1;
    size = int (random(3, 7)); 
    t = int(random(200, 255)); //255 = solid
    location = new PVector (x, y);
    velocity = new PVector (0,0.1);
    velocity.rotate(PI+random(-3, 3)); //180 degrees
    velocity.setMag(1);
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }
  
  //override
  void show () {
    noStroke();
    fill(orange, t);
    rect(location.x, location.y, size, size);
  }
  
  void act () {
    super.act();
    //location.add(velocity);
    t = t - 7;   
    if (t <= 0) lives = 0;
  }
}
