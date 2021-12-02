void pause() {
  fill(purple);
  
  stroke(black);
  strokeWeight(2);
  rect(width/2, height/2, 550, 550);
  //if (mousePressed) mode = GAME;
  fill(white);
  textSize(50);
  text("You have "+points+ " XP", width/2, 220);

  textSize(35);
  text("Lives: " + myHero.lives, width/2+70, 350);
  text("Shield Time: " + (immunelength), width/2+120, 450);
  
  stroke(black);
  fill(grey);
  rect(width/2, 130, 550, 40, 5);
  stroke(white);
  speed = new Button("+", 250, 450, 200, 60, blue, white); 
  lives = new Button("+", 250, 350, 200, 60, blue, white); 
  exit = new Button("x", 650, 130, 40, 30, white, red, 0, 40); 
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
    immunelength++;  
    points--;
  }
}
