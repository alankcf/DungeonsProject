void game() {

  //background(darkblue);
  background(red);
  line(0, 0, width, height);
  line(0, height, width, 0);

  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX + 1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX - 1, myHero.roomY);
  
  //exits
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
  fill(orange);
  strokeWeight(10);
  stroke(black);
  rect(400, 400, 650, 650);
  
  //xp indicator
  fill(blue);
  textSize(20);
  text(points, 680, 100);
  
  if (myHero.lives == 0) mode = GAMEOVER;
  if (points >= pointswin) mode = GAMEOVER;
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
    myCell.act();
    i++;
  }

  //minimap
  int x = 0;
  int y = 0;
  float size = 10;
  while (y < map.height) {
    color c = map.get(x, y);
    //x += size;
    fill(c, 220);
    square(x*10 + 50, y*10 + 50, size);
    x = x + 1;

    if  (x >= map.width) {
      x = 0;
      y = y + 1;
    }
  }

  fill(purple);
  square(50 + myHero.roomX*10, 50 + myHero.roomY*10, size);

  //shop
  secondButton = new Button("SHOP", 95, 170, 100, 30, red, orange);
  secondButton.show();
  if (secondButton.clicked) mode = PAUSE;
  
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
  if (ammo > 0) text("Ammo", 100+ammo*4/2, 690);
  fill(darkblue);
  if (ammo <= 0) text("No Ammo Left", 200, 690);
  rectMode(CENTER);
}
