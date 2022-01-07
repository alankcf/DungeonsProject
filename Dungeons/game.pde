void game() {

  //background(darkblue);
  background(red);
  strokeWeight(4);
  line(0, 0, width, height);
  line(0, height, width, 0);
 //println(myHero.roomX, myHero.roomY);
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX + 1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX - 1, myHero.roomY);
  
  //exits
  if (leave == true) {
    strokeWeight(5);
    stroke(yellow);
    fill(black);
    if (northRoom != white) { 
      ellipse(width/2, height * 0.1, 100, 100);
    }
    if (eastRoom != white) {
      ellipse(width*0.9, height/2, 100, 100);
    }
    if (southRoom != white) {
      ellipse(width/2, height * 0.9, 100, 100);
    }
    if (westRoom != white) {
      ellipse(width*0.1, height/2, 100, 100);
    }
  }
  fill(orange);
  strokeWeight(10);
  stroke(black);
  rect(400, 400, 650, 650);
  
  //lose conditions
  if (myHero.lives == 0) mode = GAMEOVER;
  if (points >= pointswin) mode = GAMEOVER;
  if (ammo <= 0 && points <= 0) mode = GAMEOVER;
  if (myHero.roomX == 8 && myHero.roomY == 8) mode = GAMEOVER;

  int j = 0;
  while (j < myObjects.size()) {
    GameObject myObj = myObjects.get(j);

    if (myObj.inRoomWith(myHero)) {
      myObj.show();
      myObj.act();
      if (myObj.lives <= 0) {
        myObjects.remove(j);
        j--;       
        } else if (myHero.lives <= 0) {
          myObjects.remove(j);
        } else if (points == pointswin) {
          myObjects.remove(j);
        } else if (ammo <= 0 && points <= 0) {
          myObjects.remove(j);
        }
    } 
    j++;
  }
  
  //image(map, 100, 100, 100, 100);
  //darkness
  int i = 0;
  while (i < num) {
    myCell = new DarknessCell(x[i], y[i], brickd);
    myCell.show();
    //myCell.act();
    i++;
  }

  //minimap
  //int x = 0;
  //int y = 0;
  //float size = 10;
  //while (y < map.height) {
  //  color c = map.get(x, y);
  //  //x += size;
  //  fill(c, 220);
  //  square(x*10 + 50, y*10 + 50, size);
  //  x = x + 1;

  //  if  (x >= map.width) {
  //    x = 0;
  //    y = y + 1;
  //  }
  //}

  //fill(purple);
  //square(50 + myHero.roomX*10, 50 + myHero.roomY*10, size);
  
  //freeze
  strokeWeight(1);
  rectMode(CORNER);
  fill(freezeblue);
  stroke(freezeblue);
  rect(550, 670, 150, 20, 200);
  fill(freezeblue2);
  stroke(freezeblue2);
  textSize(10);
  rect(550, 670, freeze/2, 20, 200); 
  text("Click SHIFT to Freeze", 620, 655);
  image(snow, (550+freeze/2)-(freeze/4), 680, 20, 20); 
  if (freeze <= 300) freeze++; else freeze = 300;
  if (shiftkey && freeze >= 300) {
    ices = true;
    freeze = 0;
    freezetimer = 0;
  }
  if (ices == true) freezetimer++; 
  if (freezetimer >= freezelength) ices = false;
  //println(freeze, freezetimer);
  
  //ammo
  rectMode(CORNER);
  fill(darkyellow);
  stroke(darkyellow);
  rect(100, 670, 200, 20, 200);
  fill(darkblue);
  stroke(darkblue);
  rect(100, 670, ammo*4, 20, 200); 
  textSize(20);
  fill(darkyellow);
  if (ammo > 10) text("Ammo", 100+ammo*4/2, 690);
  fill(darkblue);
  if (ammo <= 0) text("No Ammo Left", 200, 690);
  rectMode(CENTER);
  
  if (enterkey) leave = true;
  
  //info
  info = new Button("+", 50, 50, 40, 40, white, blue, 5, 30);
  if (leave == true) info.show();
  if (info.clicked) {
    mode = INFO;
  }
  
  //ammo message
  if (ammo <= 0 && points > 0) mode = UNLOCKED;
}
