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
  
  //reset
   if (mousePressed) {
     mode = INTRO;
     setup();
     myHero.roomX = 1;
     myHero.roomY = 1;
     points = 0;
     ammo = 50;
     gunmax = 2;
     damage = 0;
     level = 1;
     livesbooster = 0;
   }
}
