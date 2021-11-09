class Follower extends Enemy {
  
  Follower(int x, int y) {
    super(100, 50, x, y);
  }
  
  void show() {
    stroke(black);
      strokeWeight(2);
      fill(blue);
      ellipse(location.x, location.y, size, size);
      fill(black);
      textSize(10);
      text(lives, location.x, location.y);
  }
  
  void act() {
    super.act(); //calls only enemy, in which the enemy functions calls the gameobject
    
    if (myHero.location.x - location.x < 100 && myHero.location.y - location.y < 100) {
      velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      velocity.setMag(2);
    } else {
      velocity = new PVector(random(0, 3), random(0, 3));
      velocity.setMag(1);
    }
  }
}
