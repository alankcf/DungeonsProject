void game() {
  background(green);
  line(0, 0, width, height);
  line(0, height, width, 0);
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
}
