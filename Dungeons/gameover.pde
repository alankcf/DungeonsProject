void gameover() {
  background(orange);
  
  if (myHero.lives == 0) {
    textSize(100);
    text("GAMEOVER", width/2, height/3);
    textSize(20);
    fill(black);
    text("(you died)", width/2, height/2);
  } else if (points >= pointswin) {
    textSize(100);
    text("YOU WON", width/2, height/3);
  }
  
   if (mousePressed) {
     mode = INTRO;
     myHero = new Hero();
     myObjects.add(myHero);
     myHero.roomX = 1;
     myHero.roomY = 1;
     points = 0;
   }
}
