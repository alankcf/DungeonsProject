void game() {
  background(green);
  
  noFill();
  strokeWeight(15);
  stroke(black);
  rect(400, 400, 700, 700);
  
  secondButton = new Button("GAME", width/2, 100, 200, 50, blue, purple);
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
