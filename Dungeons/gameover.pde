void gameover() {
  background(orange, 200);
  
  if (myHero.lives == 0) {
    fill(purple);
    textSize(100);
    text("GAMEOVER", width/2, height/3);
    textSize(20);
    fill(black);
    text("(you died)", width/2, height/2);
  } else if (points >= pointswin) {
    textSize(100);
    text("YOU WON", width/2, height/3);
  } else if (ammo <= 0) {
    textSize(100);
    text("GAMEOVER", width/2, height/3);
    textSize(20);
    fill(black);
    text("(you ran out of ammo)", width/2, height/2);
  }
  
   if (mousePressed) {
     mode = INTRO;
     setup();
  //   myObjects = new ArrayList<GameObject>();
  //   myHero = new Hero();
  //   myObjects.add(myHero);
  myHero.roomX = 1;
  myHero.roomY = 1;
  points = 0;
  ammo = 50;
  gunmax = 2;
  damage = 0;
  level = 1;
  livesbooster = 0;
  //   int a = 0;
  //int b = 0;
  //while (b < map.height) {
  //  color roomColor = map.get(a, b);
  //  if (roomColor == red) {
  //    myObjects.add(new Turret(a, b, width/2, height/2));
  //  } 
  //  if (roomColor == blue) {
  //    myObjects.add(new Follower(a, b, random(100, 700), random(100, 700)));
  //  }
  //  if (roomColor == black && myHero.roomX != 1 && myHero.roomY != 1) {
  //    myObjects.add(new Enemy(a, b));
  //  }
  //  if (roomColor == green) {
  //    myObjects.add(new shootFollower(a, b));
  //  }
  //  a++;
  //  if (a == map.width) {
  //    a = 0;
  //    b++;
  //  }
  //}
   }
}
