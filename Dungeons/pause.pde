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
  if (gunmax == 2 && points > 1) { //unlock machine print("j");
    image(machine, width/2+100, 610, 200, 70);
    textSize(20);
    fill(white);
    text("MACHINE GUN", width/2-100, 610);
  }
  
  if (gunmax == 3 && points > 1) {
    image(shotgun, width/2+100, 610, 200, 40);
    textSize(20);
    fill(white);
    text("SHOTGUN", width/2-100, 610);
  }
  
  if (gunmax == 4 && points > 1) {
    image(flamethrower, width/2+100, 610, 100, 40);
    textSize(20);
    fill(white);
    text("FLAMETHROWER",  width/2-100, 610);
  }
  //clicked
  if (exit.clicked) mode = GAME;
  if (lives.clicked && points > 0 && myHero.lives < 10) {
    myHero.lives++;
    points--;
    clickedtimelives++; 
  }

  if (speed.clicked && points > 0) {
    immunelength++;  
    points--;
    clickedtimeshield++;
  }
  if (ammo > 50) ammo = 50;
  if (addammo.clicked && points > 0 && ammo < 50) {
    ammo = ammo + 2;
    points--;
    clickedtimeammo++;
  }
  if (addgun.clicked) {
    gunmax++;
    points = points - 2;
    mode = UNLOCKED;
  }
  
  if (clickedtimeammo >= 1 && clickedtimeshield >= 1 && clickedtimeammo >= 1  && clickedonce2 == false) {
    level = 2;
    damage = 2;
    livesbooster = 1;
    myHero.velocityspeed = 4;
    mode = UNLOCKED;
    //println(myHero.lives, myHero.velocityspeed);
  }
  
  if (clickedtimeammo >= 2 && clickedtimeshield >= 2 && clickedtimeammo >= 2  && clickedonce3 == false) {
    level = 3;
    damage = 4;
    livesbooster = 1;
    myHero.velocityspeed = 5;
    mode = UNLOCKED;
    //println(myHero.lives, myHero.velocityspeed);
  }
  
  if (clickedtimeammo >= 3 && clickedtimeshield >= 3 && clickedtimeammo >= 3  && clickedonce4 == false) {
    level = 4;
    damage = 5;
    livesbooster = 1;
    myHero.velocityspeed = 6;
    mode = UNLOCKED;
    //println(myHero.lives, myHero.velocityspeed);
  }
  //println(level, clickedtimelives, clickedtimeshield, clickedtimeammo);
}

void unlocked() {
    int times = 0;
  
    fill(orange);
    stroke(black);
    strokeWeight(2);
    rect(width/2, height/2, 250, 150);
    fill(grey);
    rect(width/2, height/2-75, 250, 20);
    exit3 = new Button("x", 507, 325, 35, 15, white, red, 0, 25); 
    exit3.show();
   
   if (ammo <= 0 && times == 0) {
     fill(red);
     textSize(20);
     text("Buy Ammo to Continue", width/2, height/2);
   }
   
   if (level == 2 && times == 0) {
     fill(white);
     stroke(white);
     textSize(20);
     text("New Level", width/2+30, height/2-30);
     text("Unlocked!", width/2+30, height/2-10);
     circle(width/2 - 80, height/2-30, 40);
     fill(blue);
     textSize(20);
     text(level, width/2 - 80, height/2-20);
     textSize(17);
     text("Damage +2", width/2, height/2+20);
     text("Lives +1", width/2, height/2+40);
     text("Speed +1", width/2, height/2+60);
   }
   
   if (level == 3 && times == 0) {
     fill(white);
     stroke(white);
     textSize(20);
     text("New Level", width/2+30, height/2-30);
     text("Unlocked!", width/2+30, height/2-10);
     circle(width/2 - 80, height/2-30, 40);
     fill(blue);
     textSize(20);
     text(level, width/2 - 80, height/2-20);
     textSize(17);
     text("Damage +2", width/2, height/2+20);
     text("Lives +1", width/2, height/2+40);
     text("Speed +1", width/2, height/2+60);
   }
   
   if (level == 4 && times == 0) {
     fill(white);
     stroke(white);
     textSize(20);
     text("New Level", width/2+30, height/2-30);
     text("Unlocked!", width/2+30, height/2-10);
     circle(width/2 - 80, height/2-30, 40);
     fill(blue);
     textSize(15);
     text("MAX", width/2 - 80, height/2-20);
     textSize(17);
     text("Damage +2", width/2, height/2+20);
     text("Lives +1", width/2, height/2+40);
     text("Speed +1", width/2, height/2+60);
   }
   
   if (gunmax == 3) { //unlock machine
      fill(white);
      stroke(white);
      textSize(20);
      text("New Weapon Unlocked!", width/2, height/2-30);
      fill(white);
      stroke(white);
      textSize(25);
      image(machine, width/2, height/2+10, 150, 40);
      textSize(20);
      fill(white);
      text("MACHINE GUN", width/2, height/2+50);
   }
   
   if (gunmax == 4) {
     fill(white);
     stroke(white);
     textSize(20);
     text("New Weapon Unlocked!", width/2, height/2-30);
     fill(white);
      stroke(white);
      textSize(25);
      image(shotgun, width/2, height/2+10, 200, 40);
      textSize(20);
      fill(white);
      text("SHOTGUN", width/2, height/2+50);
   }
   
   if (gunmax == 5) {
      fill(white);
      stroke(white);
      textSize(20);
      text("New Weapon Unlocked!", width/2, height/2-30);
      fill(white);
      stroke(white);
      textSize(25);
      image(flamethrower, width/2, height/2+10, 100, 40);
      textSize(20);
      fill(white);
      text("FLAMETHROWER", width/2, height/2+50);
   }
  
  if (exit3.clicked) mode = PAUSE;
    
  if (exit3.clicked && level == 2) clickedonce2 = true;
  if (exit3.clicked && level == 3) clickedonce3 = true;
  if (exit3.clicked && level == 4) clickedonce4 = true;
}
