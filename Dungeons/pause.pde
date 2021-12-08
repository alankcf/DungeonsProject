void pause() {
  fill(darkblue);
  
  //window
  stroke(black);
  strokeWeight(2);
  rect(width/2, height/2, 550, 550);

  //XP Indicator
  fill(white);
  textSize(50);
  text("You have "+points+ " XP", width/2, 240);
  
  //Advancement
  textSize(35);
  text("Lives: " + myHero.lives, width/2, 360);
  text("Shield Time: " + (immunelength), 3*width/5-15, 460);
  text("Ammo: " + ammo, width/2, 560);
  
  stroke(black);
  fill(grey);
  rect(width/2, 130, 550, 40, 5);
  
  //buttons
  stroke(purple);
  speed = new Button("+", 250, 450, 100, 60, blue, white, 20, 40); 
  lives = new Button("+", 250, 350, 100, 60, blue, white, 20, 40); 
  exit = new Button("x", 650, 130, 40, 30, white, red, 0, 40); 
  addammo = new Button ("+", 250, 550, 100, 60, blue, white, 20, 40); 
  speed.show();
  lives.show();
  exit.show();
  addammo.show();
  
  //clicked
  if (exit.clicked) mode = GAME;
  if (lives.clicked && points > 0 && myHero.lives < 10) {
    myHero.lives++;
    points--;
  }

  if (speed.clicked && points > 0) {
    immunelength++;  
    points--;
  }
  
  if (addammo.clicked && points > 0 && ammo >= 50) {
    ammo++;
    points--;
  }
}
