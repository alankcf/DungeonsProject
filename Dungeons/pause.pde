void pause() {
  background(purple);
  //if (mousePressed) mode = GAME;
  fill(white);
  textSize(50);
  text("You have "+points+ " XP", width/2, 100);
  
  textSize(40);
  text("Lives: " + myHero.start, width/2, 250);
  text("Speed: " + myHero.velocityspeedstart, width/2, 350);
  
  speed = new Button("+", 200, 350, 200, 60, blue, white); 
  lives = new Button("+", 200, 250, 200, 60, blue, white); 
  exit = new Button("x", 700, 50, 50, 50, black, white); 
  speed.show();
  lives.show();
  exit.show();
  if (exit.clicked) mode = GAME;
}
