void intro() {
  cursor();
  myGif.show(); 
  myButton.show();

  if (myButton.clicked) mode = GAME;

  //font
  textFont(font);
  fill(darkyellow);
  textSize(100);
  textAlign(CENTER);
  text("Dungeons", width/2, height/5);
}
