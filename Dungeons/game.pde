void game() {
 
  background(green);
  line(0, 0, width, height);
  line(0, height, width, 0);
   drawRoom();
  fill(yellow);
  strokeWeight(10);
  stroke(black);
  rect(400, 400, 650, 650);
  
  secondButton = new Button("GAME", width/2, 35, 200, 50, blue, purple);
  secondButton.show();
  myHero.show();
  myHero.act();
  if (secondButton.clicked) mode = GAMEOVER;
  
   int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);

    myObj.show();
    myObj.act();

    if (myObj.lives == 0) {
      myObjects.remove(i);
    //} else if (shiplives == 0) {
    //  myObjects.remove(i);
    //} else if (count == 21) {
    //  myObjects.remove(i);
    } else {
      i++;
    }
  }
  image(map, 100, 100, 100, 100);
  
}

void drawRoom() {
 
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX + 1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX - 1, myHero.roomY);
  
  noStroke();
  fill(black);
  if (northRoom == #000000) {
    ellipse(width/2, height * 0.1, 100, 100);
  }
  if (eastRoom == #000000) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom == #000000) {
    ellipse(width/2, height * 0.9, 100, 100);
  }
  if (eastRoom == #000000) {
    ellipse(width*0.1, height/2, 100, 100);
  }
}
