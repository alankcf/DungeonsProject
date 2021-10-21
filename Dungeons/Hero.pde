class Hero extends GameObject {

  PVector direction;

  Hero() {
    lives = 0;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
  }



  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    fill(purple);
    circle(0, 0, 50);
    popMatrix();
  }

  void act() {
    super.act();

    if (velocity.mag() > 5) {
      velocity.setMag(5);
    }
   
    if (location.y >= 100) {
      if (upkey) velocity.y = -5;
    } else location.y = 100;
    if (location.y <= 700) {
      if (downkey) velocity.y = 5;
    } else location.y = 700;
    if (location.x >=100) {
      if (leftkey) velocity.x = -5;
    } else location.x = 100;
    if (location.x <= 700) {
      if (rightkey) velocity.x = 5;
    } else location.x = 700;
  }
}
