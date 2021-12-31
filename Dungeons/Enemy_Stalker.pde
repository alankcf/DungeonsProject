class Follower extends Enemy {

  int timer;
  int shotTimer, threshold;
  AnimatedGif Action;

  Follower(int x, int y, float orginx, float orginy) {
    super(ENEMYHP, FOLLOWER_SIZE, x, y);
    location = new PVector(orginx, orginy);
    timer = 0;
    shotTimer = 0;
    threshold = 100;
    Action = eDown;
  }

  Follower(int x, int y) {
    super(ENEMYHP, FOLLOWER_SIZE, x, y);
    location = new PVector(width/2, height/2);
    timer = 0;
    shotTimer = 0;
    threshold = 100;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(black);
    Action.show(location.x, location.y, size/1.5, size);

    //healthbar
    rectMode(CORNER);
    stroke(black);
    fill(black);
    rect(location.x-25, location.y-40, 50, 5, 10);
    stroke(green2);
    strokeWeight(1);
    fill(green2);
    rect(location.x-25, location.y-40, lives/2, 5, 10);
    rectMode(CENTER);
  }

  void act() {
    super.act(); //calls only enemy, in which the enemy functions calls the gameobject
    leave();
    shotTimer++;
    timer++;

    if (myHero.location.x - location.x < 100 && myHero.location.y - location.y < 100) {
      velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      velocity.setMag(2);
    } else {
      velocity = new PVector(random(0, 3), random(0, 3));
      velocity.setMag(1);
    }
    
    if (lives <= 0) leave = true;
    
    //println(immune);
    if (immune > immunelength) {
      if (myHero.location.x - location.x < 5 && myHero.location.y - location.y < 5) {
        myHero.lives = myHero.lives - 1;
        myObjects.add(new Indicator(location.x, location.y, roomX, roomY, 2));
        immune = 0;
      }
    }
    if (velocity.x != 0 || velocity.y != 0) {
      if (abs(velocity.y) >= abs(velocity.x)) { //abs = absolute value (no negative signs)
        if (velocity.y > 0) Action = eDown;
        else Action = eUp;
      } else {
        if (velocity.x > 0) Action = eRight;
        else Action = eLeft;
      }
    }
  }
}

class shootFollower extends Enemy {

  int release;
  AnimatedGif Action;

  shootFollower(int x, int y) {
    super(SHOOTFOLLOWER_HP, SHOOTFOLLOWER_SIZE, x, y);
    Action = eDown;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
   // fill(yellow);
    //ellipse(location.x, location.y, size, size);
    Action.show(location.x, location.y, size/1.5, size);
    fill(black);

    //healthbar
    rectMode(CORNER);
    stroke(black);
    fill(black);
    rect(location.x-25, location.y-60, 50, 5, 10);
    stroke(green2);
    strokeWeight(1);
    fill(green2);
    rect(location.x-25, location.y-60, lives/2, 5, 10);
    rectMode(CENTER);
  }

  void act() {
    super.act();
    leave();
    if (lives <= 0) leave = true;
    
    release++;
    
    if (release > 200) {
      myObjects.add(new Follower (roomX, roomY, location.x, location.y));     
      release = 0;
      velocity = new PVector(random(-1, 1), random(-1, 1));
      //myObjects.add(new Bullet(location.x, location.y, myHero.location.x - location.x, myHero.location.y - location.y, white));
    }
  }
}

class Turret extends Enemy {

  int shotTimer, threshold;
  PVector direction;

  Turret(int x, int y, float orginx, float orginy) {
    super(TURRET_HP, TURRET_SIZE, x, y);
    location = new PVector(orginx, orginy);
    size = 90;
    shotTimer = 0;
    threshold = 70;
    direction = new PVector(0.1, 0);
  }

  void show () {
    stroke(black);
    strokeWeight(2);
    fill(yellow);
    ellipse(location.x, location.y, size, size);
    //mouseX - myHero.location.x, mouseY - myHero.location.y
    //rotate(direction.heading());
    //image(turret, location.x, location.y, size, size);
   
    //healthbar
    rectMode(CORNER);
    stroke(black);
    fill(black);
    rect(location.x-35, location.y-60, 70, 5, 10);
    stroke(green2);
    strokeWeight(1);
    fill(green2);
    rect(location.x-35, location.y-60, lives*0.7, 5, 10);
    rectMode(CENTER);
  }

  void act() {
    shotTimer++;
    super.act();
    leave();
    if (lives <= 0) leave = true;
    if (shotTimer >= threshold) {
      //using the mouse to aim
      PVector aimVector = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      aimVector.setMag(5); 
      myObjects.add(new Bullet(location.x, location.y, aimVector, purple, TURRET_BULLETSIZE)); //orgin, where to go, color, size
      shotTimer = 0;     
    }
  }
}
void leave() {
   int i = 0;
   while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Hero) {
        if (obj.inRoomWith (myHero)) {
          leave = false;
        }        
      }
      i++;
    }
}
