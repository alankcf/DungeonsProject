void gameover() {
  background(red);
  if (mousePressed) mode = INTRO;
  //myHero.lives = 4;
  myObjects.add(myHero);
  //myObjects.add(new Enemy());
  //myObjects.add(new Follower(1, 2, random(100, 700), random(100, 700)));
  //myObjects.add(new Follower(2, 1, random(100, 700), random(100, 700)));
  //myObjects.add(new shootFollower(3, 1));
}
