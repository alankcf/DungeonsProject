class Hero extends GameObject {

  PVector direction;
  float speed;
  int threshold, shotTimer;
  Weapon myWeapon;
  Weapon [] myGuns;
  int currentGun;
  boolean clicked;

  Hero() {
    lives = 500;
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
    size = 50;
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    strokeWeight(10);
    if (immune >= 100) stroke(white);
    if (immune < 100) stroke(yellow);
    fill(purple);
    circle(0, 0, size);
    textSize(10);
    popMatrix();
    fill(black);
    text(lives, location.x, location.y);
    fill(pink);
    
    //hero lives indicator
    stroke(black);
    fill(black);
    rect(location.x, location.y-40, 50, 5, 10);
    stroke(green2);
    strokeWeight(1);
    fill(green2);
    rect(location.x, location.y-40, myHero.lives/10, 5, 10);
  }

  void act() {
    super.act();
    //print(myHero.lives);
    immune++;
    
    if (myHero.lives > 500) lives = 500;
    fill(grey);
    textSize(20);
    text(currentGun, 700, 100);
    
    shotTimer ++;

    if (upkey == false) velocity.setMag(velocity.mag() *0);

    if (upkey) velocity.y = -3;
    if (downkey) velocity.y = 3;
    if (leftkey) {
      //direction.rotate(-radians(5));
      velocity.x = -3;
    }
    if (rightkey) {
      velocity.x = 3;
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
    if (mode == GAMEOVER) {
      roomX = 1;
      roomY = 1; 
      location = new PVector(width/2, height/2);
      
    }
    //println(immune);
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && ((Bullet) obj).good == false) { 
        //float d = dist(obj.location.x, obj.location.y, location.x, location.y);
        if (isCollidingWith(obj)) {
        //if (d <= size/2 + obj.size/2 && immune > 100) {
          lives = lives - 1;
          obj.lives = 0;
          immune = 0;
        }
      }
      if (obj instanceof DroppedItem && isCollidingWith(obj)) {
        DroppedItem item = (DroppedItem) obj;
          if (gun == true) {
            //myWeapon = item.w;
            currentGun = int (random(0, 5));
            item.lives = 0;
            
         }
         if (health == true) {
           myHero.lives = myHero.lives + 10;
           item.lives = 0;
         }
      }
      i++;
    }
  }
}
