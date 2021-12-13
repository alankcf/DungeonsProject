void info() {
  fill(purple, 50);
  stroke(purple);
  rectMode(CORNER);
  rect(30, 70, 300, 150);
  rectMode(CENTER);
  
  noStroke();
  //minimap
  int x = 0;
  int y = 0;
  float size = 10;
  while (y < map.height) {
    color c = map.get(x, y);
    //x += size;
    fill(c, 220);
    //stroke(c, 220);
    square(x*10 + 50, y*10 + 100, size);
    x = x + 1;

    if  (x >= map.width) {
      x = 0;
      y = y + 1;
    }
  }
  
  //xp indicator
  fill(white);
  textSize(25);
  text("XP: " + points, 230, 130);
  
  //shop
  secondButton = new Button("SHOP", 230, 160, 100, 30, red, orange);
  secondButton.show();
  if (secondButton.clicked) mode = PAUSE;
  
  fill(purple);
  square(50 + myHero.roomX*10, 100 + myHero.roomY*10, size);
  exit2 = new Button("x", 50, 50, 40, 40, white, red, 0, 40); 
  exit2.show();
  if (exit2.clicked) {
    mode = GAME;
  }
}
