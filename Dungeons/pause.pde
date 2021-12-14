void pause() {
  fill(darkblue);
  
  //window
  stroke(black);
  strokeWeight(2);
  rect(width/2, height/2, 550, 550);

  //XP Indicator
  fill(white);
  textSize(50);
  text("You have "+points+ " XP", width/2, 220);
  
  //Advancement
  textSize(35);
  text("Lives: " + myHero.lives, width/2, 320);
  text("Shield Time: " + (immunelength), 3*width/5-15, 420);
  text("Ammo: " + ammo, width/2, 520);
  
  stroke(black);
  fill(grey);
  rect(width/2, 130, 550, 40, 5);
  
  //buttons
  stroke(purple);
  speed = new Button("+", 250, 410, 100, 60, blue, white, 20, 40); 
  lives = new Button("+", 250, 310, 100, 60, blue, white, 20, 40); 
  exit = new Button("x", 650, 130, 40, 30, white, red, 0, 40); 
  addammo = new Button ("+", 250, 510, 100, 60, blue, white, 20, 40); 
  addgun = new Button(" ", width/2+100, 610, 200, 70, darkblue, white, 20, 40);
  speed.show();
  lives.show();
  exit.show();
  addammo.show();
  if (gunmax != 5) addgun.show();
  
  //uplock weapons
  if (gunmax == 2) { //unlock machine print("j");
    image(machine, width/2+100, 610, 200, 70);
    textSize(20);
    fill(white);
    text("MACHINE GUN", width/2-100, 610);
  }
  
  if (gunmax == 3) {
    image(shotgun, width/2+100, 610, 200, 40);
    textSize(20);
    fill(white);
    text("SHOTGUN", width/2-100, 610);
  }
  
  if (gunmax == 4) {
    image(flamethrower, width/2+100, 610, 200, 40);
    textSize(20);
    fill(white);
    text("FLAMETHROWER",  width/2-100, 610);
  }
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
  
  if (addammo.clicked && points > 0 && ammo < 50) {
    ammo = ammo + 2;
    points--;
  }
  if (addgun.clicked) {
    gunmax++;
    points = points - 2;
    mode = UNLOCKED;
  }
}

void unlocked() {
  
    fill(orange);
    stroke(black);
    strokeWeight(2);
    rect(width/2, height/2, 250, 150);
    fill(grey);
    rect(width/2, height/2-75, 250, 20);
    exit3 = new Button("x", 507, 325, 35, 15, white, red, 0, 25); 
    exit3.show();
    fill(white);
    stroke(white);
    textSize(20);
    text("New Weapon Unlocked!", width/2, height/2-30);
  
   if (gunmax == 3) { //unlock machine
      fill(white);
      stroke(white);
      textSize(25);
      image(machine, width/2, height/2+10, 100, 40);
      textSize(20);
      fill(white);
      text("MACHINE GUN", width/2, height/2+50);
   }
   
   if (gunmax == 4) {
      fill(white);
      stroke(white);
      textSize(25);
      image(shotgun, width/2, height/2+10, 100, 40);
      textSize(20);
      fill(white);
      text("SHOTGUN", width/2, height/2+50);
   }
   
   if (gunmax == 5) {
      fill(white);
      stroke(white);
      textSize(25);
      image(flamethrower, width/2, height/2+10, 100, 40);
      textSize(20);
      fill(white);
      text("FLAMETHROWER", width/2, height/2+50);
   }
  
  if (exit3.clicked) mode = PAUSE;
}
