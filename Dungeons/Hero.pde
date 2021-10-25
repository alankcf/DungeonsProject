class Hero extends GameObject {

  PVector direction;
  float speed;
  int roomX, roomY;

  Hero() {
    lives = 1;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    speed = 5;
    roomX = 1;
    roomY = 1;
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
    
    if (upkey == false) velocity.setMag(velocity.mag() *0);
    
    //if (location.y >= 100) {
      if (upkey) velocity.y = -3;
    //} else location.y = 100;
   // if (location.y <= 700) {
      if (downkey) velocity.y = 3;
   // } else location.y = 700;
   // if (location.x >=100) {
      if (leftkey) velocity.x = -3;
    //} else location.x = 100;
    //if (location.x <= 700) {
      if (rightkey) velocity.x = 3;
    //} else location.x = 700;
      
      if (velocity.mag() > 3) {
      velocity.setMag(3);
    }
  }
}
