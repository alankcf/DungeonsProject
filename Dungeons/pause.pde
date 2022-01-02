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
  speed = new Button("+", 250, 410, 95, 50, blue, white, 20, 40); 
  lives = new Button("+", 250, 310, 95, 50, blue, white, 20, 40); 
  exit = new Button("x", 650, 130, 40, 30, white, red, 0, 40); 
  addammo = new Button ("+", 250, 510, 95, 50, blue, white, 20, 40); 
  addgun = new Button(" ", width/2+100, 610, 200, 70, darkblue, white, 20, 40);
  speed.show();
  lives.show();
  exit.show();
  addammo.show();
  if (gunmax != 5 && points > 1) addgun.show();
  
  //descriptions
  
  //lives
  if (mouseY < height/2-100 && mouseY > height/2-200) {
    rectMode(CORNER);
    fill(white, 200);
    noStroke();
    rect(2.7*width/8, 240, 100, 50, 5, 5, 5, 0);
    triangle(2.7*width/8, 290, 2.75*width/8, 290, 2.7*width/8, 300);
    textSize(15);
    fill(red);
    text("+1 Lives", 3.2*width/8, 260);
    text("Cost: -1 XP", 3.2*width/8, 280);
    rectMode(CENTER);
  }
  
  if (mouseY < height/2+50 && mouseY > height/2-50) {
    rectMode(CORNER);
    fill(white, 200);
    noStroke();
    rect(2.7*width/8, 340, 105, 50, 5, 5, 5, 0);
    triangle(2.7*width/8, 390, 2.75*width/8, 390, 2.7*width/8, 400);
    textSize(15);
    fill(darkyellow);
    text("+1 Shield Time", 3.22*width/8, 360);
    text("Cost: -1 XP", 3.22*width/8, 380);
    rectMode(CENTER);
  }
  
  if (mouseY < height/2+200 && mouseY > height/2+100) {
    rectMode(CORNER);
    fill(white, 200);
    noStroke();
    rect(2.7*width/8, 440, 100, 50, 5, 5, 5, 0);
    triangle(2.7*width/8, 490, 2.75*width/8, 490, 2.7*width/8, 500);
    textSize(15);
    fill(brown);
    text("+5 Ammo", 3.2*width/8, 460);
    text("Cost: -1 XP", 3.2*width/8, 480);
    fill(white, 200);
    rectMode(CENTER);
  }
  
  if (mouseY < height/2+300 && mouseY > height/2+200 && points > 1) {
    rectMode(CORNER);
    fill(white, 200);
    noStroke();
    rect(5*width/8, 540, 100, 50, 5, 5, 5, 0);
    triangle(5*width/8, 590, 5.05*width/8, 590, 5*width/8, 600);
    textSize(15);
    fill(darkblue);
    text("Cost: -2 XP", 5.5*width/8, 570);
    fill(white, 200);
    rectMode(CENTER);
  }
  
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
    ammo = ammo + 5;
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
    
    cursor();
    fill(orange);
    stroke(black);
    strokeWeight(2);
    rect(width/2, height/2, 250, 150);
    fill(grey);
    rect(width/2, height/2-75, 250, 20);
    exit3 = new Button("x", 507, 325, 35, 15, white, red, 0, 25); 
    exit3.show();
   
   if (ammo <= 0) {
     fill(red);
     textSize(20);
     text("Buy Ammo to Continue", width/2, height/2);
   }
   
   if (level == 2 && leveltimes == 0) {
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
   
   if (level == 3 && leveltimes == 1) {
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
   
   if (level == 4 && leveltimes == 2) {
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
   
   if (gunmax == 3 && guntimes == 0) { //unlock machine
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
   
   if (gunmax == 4 && guntimes == 1) {
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
   
   if (gunmax == 5 && guntimes == 2) {
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
  if (exit3.clicked && level == 2) {
    clickedonce2 = true;
    leveltimes = 1;
  }
  if (exit3.clicked && level == 3) {
    clickedonce3 = true;
    leveltimes = 2;
  }
  if (exit3.clicked && level == 4) {
    clickedonce4 = true; 
    leveltimes = 3;
  }
  if (exit3.clicked && gunmax == 3) guntimes = 1;
  if (exit3.clicked && gunmax == 4) guntimes = 2;
  if (exit3.clicked && gunmax == 5) guntimes = 3;
}
