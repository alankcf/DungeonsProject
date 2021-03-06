class SniperRifle extends Weapon {

  SniperRifle() {
    super(SNIPER_THRESHOLD, SNIPER_SPEED+damage); //threshold, speed
  }
}

class Machine extends Weapon {

  Machine() {
    super(MACHINEGUN_THRESHOLD, MACHINEGUN_SPEED+damage);
  }
}

class ShotGun extends Weapon {

  ShotGun() {
    super(SHOTGUN_THRESHOLD, SHOTGUN_SPEED+damage);
  }

  void shoot() {
    if (shotTimer >= threshold) {
      int i = 0;
      if (i < 30) {
        PVector aimVector = new PVector(mouseX - myHero.location.x, mouseY - myHero.location.y);
        aimVector.rotate(random(-PI, PI));
        aimVector.setMag(bulletSpeed+damage);
        myObjects.add(new Bullet(aimVector, purple, 10));
        ammo--;
      }
    }
  }
}
class Flamethrower extends Weapon {

  Flamethrower() {
    super(FLAMETHROWER_THRESHOLD, FLAMETHROWER_SPEED+damage);
  }

  void shoot() {
    if (shotTimer >= threshold) {
      //using the mouse to aim
      int i = 0;
      while (i < 50) {
        myObjects.add(new Fire());
        i++;
      } 
      shotTimer = 0;
      ammo--;
    }
  }
}
class Fire extends GameObject {

  int t; //transparancy
  PVector nudge;  

  Fire() {
    lives = 1;
    size = int (random(5, 10)); //try random
    t = int(random(200, 255)); //255 = solid
    location = myHero.location.copy();
    velocity = new PVector(mouseX - myHero.location.x, mouseY - myHero.location.y);
    velocity.rotate(random(-0.1, 0.15)); 
    velocity.setMag(random(4, 10)); 
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show () {
    stroke(black);
    strokeWeight(3);
    fill(orange, t);
    circle(location.x, location.y, size);
  }

  void act () {
    super.act();
    t = t - 10;

    if (t <= 0) lives = 0;
  }
}
