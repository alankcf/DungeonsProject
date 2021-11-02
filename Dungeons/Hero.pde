class Hero extends GameObject {

  PVector direction;
  float speed;
  int roomX, roomY;
  int threshold, shotTimer;
  Weapon myWeapon;

  Hero() {
    lives = 1;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    speed = 5;
    roomX = 1;
    roomY = 1;
    myWeapon = new Weapon();
    threshold = 20;
    shotTimer = 0;
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    fill(purple);
    //rect(0, 0, 50, 50);
    circle(0, 0, 50);
    //triangle(-25, -12.5, -25, 12.5, 25, 0);
    popMatrix();
    fill(pink);
  }

  void act() {
    super.act();
    
    shotTimer ++;
    
    if (upkey == false) velocity.setMag(velocity.mag() *0);
    
    if (upkey) velocity.y = -3;
    if (downkey) velocity.y = 3;
    if (leftkey) {
      direction.rotate(-radians(5));
      velocity.x = -3;
    }
    if (rightkey) {
      velocity.x = 3;
      direction.rotate(radians(5));
    }
    
    myWeapon.update();
    
    if (spacekey) {
      myWeapon.shoot();
    }
    if (velocity.mag() > 3) {
      velocity.setMag(3);  
    }
    
    //north exit
    if (northRoom == black && location.y == 100 + 3 && location.x > width/2-50 && location.x <= width/2 + 50) {
      roomY--;
      location = new PVector (width/2, 700 - 3-10);
    }
    //east exit
    if (eastRoom == black && location.x == 700 - 3 && location.y > height/2-50 && location.y <= height/2 + 50) {
      roomX++;
     location = new PVector (width*0.1+30, height/2);
    }
    //west exit
    if (westRoom == black && location.x == 100 + 3 && location.y > height/2-50 && location.y <= height/2 + 50) {
      roomX--;
      location = new PVector (700 - 3, height/2);
    }
    //south exit
    if (southRoom == black && location.y == 700 - 3 && location.x > height/2-50 && location.x <= height/2 + 50) {
      roomY++;
      location = new PVector (width/2, height*0.1+50);
    }
    
    //reset Hero
    if (mode == GAMEOVER) {
      roomX = 1;
      roomY = 1; 
      location = new PVector(width/2, height/2);
    }
  }
}
