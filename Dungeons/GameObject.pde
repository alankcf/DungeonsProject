class GameObject {
  
  //common stuff
  int lives;
  PVector location;
  PVector velocity;
  int size;
  
  GameObject() {
    
  }
  
  void show() {
   
  }
  
  void act() {
    location.add(velocity);
    
 
  }
}
