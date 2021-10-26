//2 arraylist of ceels
// 3 loop to animate color

class DarknessCell {
  float opacity;
  float x, y, size;
  
  DarknessCell(float _x, float _y, float s) { //no extends GameObject
    size = s;
    x = _x;
    y = _y;
    opacity = 255; //get rid later
  }
  
  void show() {
    //draw square
    //noStroke();
    fill(black, opacity); //0 = transparent
    rect(x, y, size, size);
  }
  
  void act() {
    
  }
}
