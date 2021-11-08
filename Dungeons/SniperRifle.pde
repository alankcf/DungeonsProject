class SniperRifle extends Weapon {
  
  SniperRifle() {
    super(100, 20);//threshold, speed
  }
}

class Machine extends Weapon {
  
  Machine() {
    super(7, 10);
  }
}

class ShotGun extends Weapon {
  
  ShotGun() {
    super(100, 5);
  }
  
  void shoot() {
    if (shotTimer >= threshold) {
      int i = 0;
      if (i < 30) {
        PVector aimVector = new PVector(mouseX - myHero.location.x, mouseY - myHero.location.y);
        aimVector.rotate(random(-PI, PI));
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(aimVector, purple, 10));
      }
      
    }
  }
}
