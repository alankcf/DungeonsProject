class Button {

  //variables
  int x, y, w, h; 
  String text;
  color normal, highlight;
  boolean clicked;
  int curve;
  int textsize;

  //constuctor
  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
    curve = 30;
    textsize = w/5;
  }

  Button(String t, int _x, int _y, int _w, int _h, color norm, color high, int c, int tsize) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
    curve = c;
    textsize = tsize;
  }

  //behavior functions
  void show() {
    strokeWeight(1);

    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
      fill(highlight);
    } else fill (normal);

    rect(x, y, w, h, curve);

    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
      fill(normal);
    } else fill (highlight);
    textSize(textsize);
    textAlign(CENTER);
    text(text, x, y+10);


    clicked = mouseReleased && mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2;
  }
}

void click () {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) { //we clicked the mouse but not pressing it now
    mouseReleased = true;
    wasPressed = false;
  }
}
