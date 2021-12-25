class GameObject {

  int lives;
  PVector location;
  PVector velocity;
  int size;
  int roomX, roomY;
  int livesMax;

  GameObject() {
  }

  void show() {
  }

  void act() {  
    location.add(velocity);

    if (location.x <= 100) location.x = 100 + 3;
    if (location.x >= 700) location.x = 700 - 3;
    if (location.y <= 100) location.y = 100 + 3;
    if (location.y >= 700) location.y = 700 - 3;

    if (mode == GAMEOVER) {
      roomX = 1;
      roomY = 1;
    }
  }

  boolean inRoomWith(GameObject myObj) {
    return roomX == myObj.roomX && roomY == myObj.roomY;
  }
  

  boolean isCollidingWith(GameObject myObj) {
    float d = dist(myObj.location.x, myObj.location.y, location.x, location.y);
    return inRoomWith(myObj) && d < size/2 + myObj.size/2 && lives > 0;
  }
}
