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
  int velocityspeed;

  Hero() {
    lives = 10 + livesbooster;
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
    //velocityspeedstart = 7;
  }

  void show() {
    pushMatrix();
    strokeWeight(10);
    if (immune >= immunelength)  stroke(orange, 10);
    if (immune < immunelength) stroke(yellow);
    fill(orange, 10);
    circle(location.x, location.y, size);
    currentAction.show(location.x, location.y, size/1.5, size);
    textSize(10);
    popMatrix();
    fill(pink);

    //healthbars
    rectMode(CORNER);
    stroke(black);
    fill(black);
    rect(location.x-25, location.y-40, 50, 5, 10);
    stroke(green2);
    strokeWeight(1);
    fill(green2);
    rect(location.x-25, location.y-40, myHero.lives*5, 5, 10);
    rectMode(CENTER);
    
    //level
    fill(white);
    textSize(15);
    if (level < 4) text(level, location.x, location.y-50);
    if (level >= 4) text("MAX Level", location.x, location.y-50);
  }

  void act() {
    super.act();
 
    immune++;

    if (myHero.lives + livesbooster > 10) lives = 10;

    shotTimer ++;
    
    //gun type indicator
    if (currentGun == 0) {
      image(pistol, 200, 610, 80, 60);
      textSize(20);
      fill(white);
      text("PISTOL", 200, 660);
      cursor();
    }
    if (currentGun == 1) {
      image(sniper, 200, 610, 160, 40);
      textSize(20);
      fill(white);
      text("SNIPER RIFLE", 200, 660);
      if (mode == GAME && mouseX > 100 && mouseY > 100) {       
        noCursor();
        stroke(red);
        strokeWeight(5);
        line(mouseX-10, mouseY, mouseX+10, mouseY);
        line(mouseX, mouseY-10, mouseX, mouseY+10);
      } else if (mouseX <= 100 && mouseY <= 100) cursor();
    }
    if (currentGun == 2) {
      image(machine, 200, 610, 200, 80);
      textSize(20);
      fill(white);
      text("MACHINE GUN", 200, 660);
      cursor();
    }
    if (currentGun == 3) {
      image(shotgun, 200, 620, 200, 40);
      textSize(20);
      fill(white);
      text("SHOTGUN", 200, 660);
      cursor();
    }
    if (currentGun == 4) {
      image(flamethrower, 200, 610, 180, 60);
      textSize(20);
      fill(white);
      text("FLAMETHROWER", 200, 660);
      cursor();
    }
    
    //move around
    if (upkey || wkey) location.y = location.y - velocityspeed;
    if (upkey == false) velocity.setMag(velocity.mag() *0);
    if (downkey || skey) location.y = location.y + velocityspeed;
    if (leftkey || akey) location.x = location.x - velocityspeed;
    if (rightkey || dkey) location.x = location.x + velocityspeed;
    
    clicked = false;
    if (mouseReleased) {
      clicked = true; 
      //print("!", frameCount);
    }

    if (clicked == true && mode == GAME) currentGun++;
    if (currentGun == gunmax && clicked == true) currentGun = 0;

    myGuns[currentGun].update();
    if (spacekey) myGuns[currentGun].shoot();
    
    if (velocity.mag() > 3) {
      velocity.setMag(3);
    }
    
    //animations
    //if (velocity.x != 0 || velocity.y != 0) {
    //  if (abs(velocity.y) >= abs(velocity.x)) { //abs = absolute value (no negative signs)
        if (downkey || skey) currentAction = manDown;
        else if (upkey || wkey) currentAction = manUp;
   //   } else {
        if (rightkey || dkey) currentAction = manRight;
        else if (leftkey || akey) currentAction = manLeft;
     // }
  //  }
    //println(roomX, roomY);
    //if (leave == true) print(true);
    //if (leave == false) print (false);
    
    //can't leave room
    if (roomX == 1 && roomY == 1) leave = true;
    if (leave == true) {
      //north exit
      if (northRoom != white && location.y == 100 + 3 && location.x > width/2-50 && location.x <= width/2 + 50) {
        roomY--;
        location = new PVector (width/2, 700 - 3-10);
        cleanUp();
        leave = false;
      }
      //east exit
      if (eastRoom != white && location.x == 700 - 3 && location.y > height/2-50 && location.y <= height/2 + 50) {
        roomX++;
        location = new PVector (width*0.1+30, height/2);
        cleanUp();
        leave = false;
      }
      //west exit
      if (westRoom != white && location.x <= 100 + 3 && location.y > height/2-50 && location.y <= height/2 + 50) {
        roomX--;
        location = new PVector (700 - 3, height/2);
        cleanUp();
        leave = false;
      }
      //south exit
      if (southRoom != white && location.y == 700 - 3 && location.x > height/2-50 && location.x <= height/2 + 50) {
        roomY++;
        location = new PVector (width/2, height*0.1+50);
        cleanUp();
        leave = false;
      }
    }
    //reset Hero
    if (myHero.lives <= 0) mode = GAMEOVER;
    if (mode == INTRO) {
      roomX = 1;
      roomY = 1;
      addspeed = 0;
      location = new PVector(width/2, height/2);
    }

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && ((Bullet) obj).good == false) { 
        if (isCollidingWith(obj)) {
          if (immune > immunelength) {
            lives = lives - 1;
            obj.lives = 0;
            immune = 0;
            myObjects.add(new Indicator(location.x, location.y, roomX, roomY, 2));
          } else if (immune < immunelength) {
            myObjects.add(new Particle(obj.location.x, obj.location.y));
            obj.velocity = new PVector(0, 1);
            obj.velocity.rotate (random(PI, TWO_PI));
            obj.velocity.setMag(5);
          }
        }
      }
      if (obj instanceof DroppedItem && isCollidingWith(obj)) {
        DroppedItem item = (DroppedItem) obj;
        if (item.gun == true) {
          ammo = ammo + 3;
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
  
  void cleanUp() {
    int u = 0;
    while (u < myObjects.size()) { //.size = number of pages
      GameObject obj = myObjects.get(u); //different objects
      if (obj instanceof Bullet || obj instanceof Indicator) {
        if (inRoomWith (obj)) {
          myObjects.remove(u);
          u--;
        }
      }   
      u++;
     }
   }
}
