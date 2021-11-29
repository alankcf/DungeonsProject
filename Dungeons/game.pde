void game() {
 
  background(darkblue);
  line(0, 0, width, height);
  line(0, height, width, 0);
  
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX + 1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX - 1, myHero.roomY);
  
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
  fill(green);
  strokeWeight(10);
  stroke(black);
  rect(400, 400, 650, 650);
  
  secondButton = new Button("PAUSE", width/2, 35, 200, 50, blue, purple);
  secondButton.show();
  if (secondButton.clicked) mode = PAUSE;
  
  if (myHero.lives == 0) mode = GAMEOVER;
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
      //} else if (myHero.lives <= 0) {
      //  myObjects.remove(j);
      //} else if (count == 21) {
      //  myObjects.remove(i);
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
}
