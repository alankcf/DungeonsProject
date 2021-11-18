class Follower extends Enemy {
  
  int timer;
  int shotTimer, threshold;
  
  Follower(int x, int y, float orginx, float orginy) {
    super(ENEMYHP, FOLLOWER_SIZE, x, y);
    location = new PVector(orginx, orginy);
    timer = 0;
    shotTimer = 0;
    threshold = 100;
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
    fill(blue);
    ellipse(location.x, location.y, size, size);
    fill(black);
    textSize(10);
    text(lives, location.x, location.y);
  }
  
  void act() {
    super.act(); //calls only enemy, in which the enemy functions calls the gameobject
    
    shotTimer++;
    timer++;
    
    if (myHero.location.x - location.x < 100 && myHero.location.y - location.y < 100) {
      velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      velocity.setMag(2);
    } else {
      velocity = new PVector(random(0, 3), random(0, 3));
      velocity.setMag(1);
    }
    
    //println(immune);
    if (immune > 100) {
      if (myHero.location.x - location.x < 10 && myHero.location.y - location.y < 10) {
        myHero.lives = myHero.lives - 1;
        immune = 0;
      }
    }
    
    //text(shotTimer, 200, 200);
   // if (shotTimer >= threshold) {
   //  //using the mouse to aim
   //  PVector aimVector = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
   //  aimVector.setMag(5); //instead of using bullet speed use a set number
   //  myObjects.add(new Bullet(location.x, location.y, aimVector, purple, 10)); //orgin, where to go, color, size
   //  shotTimer = 0;
   //}
  }
}

class shootFollower extends Enemy {
  
  int release;
  
  shootFollower(int x, int y) {
    super(SHOOTFOLLOWER_HP, SHOOTFOLLOWER_SIZE, x, y);
  }
  
  void show() {
    stroke(black);
    strokeWeight(2);
    fill(yellow);
    ellipse(location.x, location.y, size, size);
    fill(black);
    textSize(10);
    text(lives, location.x, location.y);
  }
  
  void act() {
    super.act();
    
    release++;
    //println(velocity);
    if (release > 200) {
      myObjects.add(new Follower (roomX, roomY, location.x, location.y));     
      release = 0;
      velocity = new PVector(random(-1, 1), random(-1, 1));
      //myObjects.add(new Bullet(location.x, location.y, myHero.location.x - location.x, myHero.location.y - location.y, white));
    }
    //if (enterkey) myObjects.add(new Bullet(location.x, location.y, myHero.location.x - location.x, myHero.location.y - location.y, white));
    //velocity = new PVector(random(-1, 1), random(-1, 1));
    //velocity.setMag(0);
  }
}

class Turret extends Enemy {
  
  int shotTimer, threshold;
  
  Turret(int x, int y, float orginx, float orginy) {
    super(TURRET_HP, TURRET_SIZE, x, y);
    location = new PVector(orginx, orginy);
    size = 90;
    shotTimer = 0;
    threshold = 70;
  }
  
  void show () {
    stroke(black);
    strokeWeight(2);
    fill(yellow);
    ellipse(location.x, location.y, size, size);
    fill(black);
    textSize(10);
    text(lives, location.x, location.y);
  }
   
  void act() {
    shotTimer++;
    
    if (shotTimer >= threshold) {
     //using the mouse to aim
     PVector aimVector = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
     aimVector.setMag(5); //instead of using bullet speed use a set number
     myObjects.add(new Bullet(location.x, location.y, aimVector, purple, TURRET_BULLETSIZE)); //orgin, where to go, color, size
     shotTimer = 0;
     }
  }
}
