void gameover() {
  background(orange);
  
  textSize(100);
  text("GAMEOVER", width/2, height/2);
  
   if (mousePressed) {
     mode = INTRO;
     myHero = new Hero();
     myObjects.add(myHero);
     myHero.roomX = 1;
     myHero.roomY = 1;
   }
}
