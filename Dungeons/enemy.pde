class Enemy extends GameObject {

  Enemy() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    lives = 100;
    roomX = 1;
    roomY = 1;
    size = 30;
  }

  Enemy(int x, int y) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    lives = 100;
    roomX = x;
    roomY = y;
    size = 30;
  }

  Enemy(int hp, int s, int x, int y) {
    location = new PVector(int (random(100, 700)), int (random(100, 700)));
    velocity = new PVector(0, 0);
    lives = hp;
    size = s;
    roomX = x;
    roomY = y;
  }

  void show() {
    if (roomX == myHero.roomX && roomY == myHero.roomY) {
      stroke(black);
      strokeWeight(2);
      fill(yellow);
      ellipse(location.x, location.y, size, size);
      fill(black);
      textSize(10);
      text(lives, location.x, location.y);

      //healthbar
      rectMode(CORNER);
      stroke(black);
      fill(black);
      rect(location.x-25, location.y-30, 50, 5, 10);
      stroke(green2);
      strokeWeight(1);
      fill(green2);
      rect(location.x-25, location.y-30, lives/2, 5, 10);
      rectMode(CENTER);
    }
  }

  void act() {
    super.act();

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && ((Bullet) obj).good == true) { //downsizing   
        //float d = dist(obj.location.x, obj.location.y, location.x, location.y);
        if (isCollidingWith(obj)) {
          //if (d <= size/2 + obj.size/2) {
          lives = lives - int(obj.velocity.mag());
          obj.lives = 0;
          myObjects.add(new Particle(location.x, location.y));
          if (lives <= 0) {
            myObjects.add(new DroppedItem(location.x, location.y, roomX, roomY));
            myObjects.add(new Indicator(location.x, location.y, roomX, roomY, 1));
            points++;
          }
        }
      }

      i++;
    }
    int j = 0;
    while (j < myObjects.size()) {
      GameObject obj = myObjects.get(j);
      if (obj instanceof Fire) { 
        //float d = dist(obj.location.x, obj.location.y, location.x, location.y);
        if (isCollidingWith(obj)) {
          //if (d <= size/2 + obj.size/2) {
          lives = lives - 1;
          obj.lives = 0;
          myObjects.add(new Particle(location.x, location.y));
          if (lives <= 0) {
            myObjects.add(new DroppedItem(location.x, location.y, roomX, roomY));
            myObjects.add(new Indicator(location.x, location.y, roomX, roomY, 1));
            points++;
          }
        }
      }

      j++;
    }
  }
}
