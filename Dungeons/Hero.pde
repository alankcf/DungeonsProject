class Hero extends GameObject {

  PVector direction;
  float speed;
  int threshold, shotTimer;
  Weapon myWeapon;
  Weapon [] myGuns;
  int currentGun;
  boolean clicked;
  AnimatedGif currentAction;
  int start;
  int velocityspeed, velocityspeedstart;

  Hero() {
    lives = 10;
    start = lives - 10;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    speed = 5;
    roomX = 1;
    roomY = 1;
    immune = 0;
    myWeapon = new Weapon();
    myGuns = new Weapon[10];
    myGuns[0] = new Weapon();
    myGuns[1] = new SniperRifle();
    myGuns[2] = new Machine();
    myGuns[3] = new ShotGun();
    myGuns[4] = new Flamethrower();
    threshold = 20;
    shotTimer = 0;
    //currentGun = 0;
    clicked = false;
    size = 60;
    currentAction = manDown; 
    velocityspeed = 3;
    velocityspeedstart = 7;
  }

  void show() {
    pushMatrix();
    //translate(location.x, location.y);
    //rotate(direction.heading());
    strokeWeight(10);
    if (immune >= immunelength) stroke(white);
    if (immune < immunelength) stroke(yellow);
    fill(green);
    circle(location.x, location.y, size);
    currentAction.show(location.x, location.y, size/1.5, size);
    textSize(10);
    popMatrix();
    //fill(black);
    //text(lives, location.x, location.y);
    fill(pink);

    //healthbars
    rectMode(CORNER);
    //strokeWeight(1);
    stroke(black);
    fill(black);
    rect(location.x-25, location.y-40, 50, 5, 10);
    stroke(green2);
    strokeWeight(1);
    fill(green2);
    rect(location.x-25, location.y-40, myHero.lives*5, 5, 10);
    rectMode(CENTER);
  }

  void act() {
    super.act();
    //print(myHero.lives);
    immune++;

    if (myHero.lives > 100) lives = 10;
    fill(black);
    textSize(20);
    text(currentGun, 700, 100);

    shotTimer ++;
    //println(myHero.velocityspeed);
    if (upkey == false) velocity.setMag(velocity.mag() *0);

    if (upkey) velocity.y = -velocityspeed;
    if (downkey) velocity.y = velocityspeed;
    if (leftkey) {
      //direction.rotate(-radians(5));
      velocity.x = -velocityspeed;
    }
    if (rightkey) {
      velocity.x = velocityspeed;
      //direction.rotate(radians(5));
    }
    //println(currentGun);
    //myWeapon.update();
    clicked = false;
    if (mouseReleased) {
      clicked = true; 
      //print("!", frameCount);
    }

    if (clicked == true) currentGun++;
    if (currentGun == 5 && clicked == true) currentGun = 0;

    myGuns[currentGun].update();
    if (spacekey) {
      //myWeapon.shoot();
      myGuns[currentGun].shoot();
      //int i = 0;
      //while (i < 10) {
      //  myWeapon[i].shoot();
      //  i++;
      //}
    }
    if (velocity.mag() > 3) {
      velocity.setMag(3);
    }

    //animations
    //println(velocity.x);
    //println("y", velocity.y);
    if (velocity.x != 0 || velocity.y != 0) {
      if (abs(velocity.y) >= abs(velocity.x)) { //abs = absolute value (no negative signs)
        if (velocity.y > 0) currentAction = manDown;
        else currentAction = manUp;
      } else {
        if (velocity.x > 0) currentAction = manRight;
        else currentAction = manLeft;
      }
    }
    //if (velocity.x == 0 && velocity.y == 0) currentAction = manDown;
    //north exit
    if (northRoom != white && location.y == 100 + 3 && location.x > width/2-50 && location.x <= width/2 + 50) {
      roomY--;
      location = new PVector (width/2, 700 - 3-10);
    }
    //east exit
    if (eastRoom != white && location.x == 700 - 3 && location.y > height/2-50 && location.y <= height/2 + 50) {
      roomX++;
      location = new PVector (width*0.1+30, height/2);
    }
    //west exit
    if (westRoom != white && location.x == 100 + 3 && location.y > height/2-50 && location.y <= height/2 + 50) {
      roomX--;
      location = new PVector (700 - 3, height/2);
    }
    //south exit
    if (southRoom != white && location.y == 700 - 3 && location.x > height/2-50 && location.x <= height/2 + 50) {
      roomY++;
      location = new PVector (width/2, height*0.1+50);
    }

    //reset Hero
    if (myHero.lives <= 0) mode = GAMEOVER;
    if (mode == INTRO) {
      roomX = 1;
      roomY = 1;
      addspeed = 0;
      location = new PVector(width/2, height/2);
    }
    
    //println(immune);
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && ((Bullet) obj).good == false) { 
        //float d = dist(obj.location.x, obj.location.y, location.x, location.y);
        if (isCollidingWith(obj) && immune > immunelength) {
          //if (d <= size/2 + obj.size/2 && immune > 100) {
          lives = lives - 1;
          obj.lives = 0;
          immune = 0;
          myObjects.add(new Indicator(location.x, location.y, roomX, roomY, 2));
        }
      }
      if (obj instanceof DroppedItem && isCollidingWith(obj)) {
        DroppedItem item = (DroppedItem) obj;
        if (item.gun == true) {
          //myWeapon = item.w;
          //currentGun = int (random(0, 5));
          addspeed = addspeed + 5;
          item.lives = 0;
        }
        if (item.health == true) {
          myHero.lives = myHero.lives + 1;
          item.lives = 0;
          if (lives >= 10) lives = 10;
        }
      }
      i++;
    }
  }
}
