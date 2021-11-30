void pause() {
  background(purple);
  //if (mousePressed) mode = GAME;
  fill(white);
  textSize(50);
  text("You have "+points+ " XP", width/2, 100);
  
  textSize(40);
  text("Lives: " + myHero.lives, width/2, 250);
  text("Speed: " + (addspeed + 3), width/2, 350);
  
  speed = new Button("+", 200, 350, 200, 60, blue, white); 
  lives = new Button("+", 200, 250, 200, 60, blue, white); 
  exit = new Button("x", 750, 30, 40, 40, white, red, 0, 40); 
  speed.show();
  lives.show();
  exit.show();
  if (exit.clicked) mode = GAME;
  if (lives.clicked && points > 0 && myHero.lives <= 10) {
    myHero.lives++;
    points--;
  }
  //print(addspeed);
  if (speed.clicked && points > 0) {
    addspeed = addspeed + 10;   
    points--;
    
  }
}
