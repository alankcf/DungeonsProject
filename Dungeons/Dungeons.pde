boolean upkey, downkey, leftkey, rightkey, spacekey, enterkey;
AnimatedGif myGif;
Hero myHero;
ArrayList<GameObject> myObjects;

boolean mouseReleased;
boolean wasPressed;

//Images
PImage map;
color northRoom, eastRoom, southRoom, westRoom;

//font
PFont font;

//colors
color pink = #EAA7FF;
color green = #A7FFB7;
color white = #ffffff;
color brown = #896120;
color red = #F70000;
color orange = #FA8303;
color blue = #03ADFA;
color yellow = #E8BB3F;
color black = #000000;
color darkyellow = #FFAC12;
color darkblue = #272D4D;
color purple = #6E06B9;
color darkred = #F25D5D;
color grey = #48423F;
color mango = #FF6A5A;

Button myButton;
Button secondButton;

//mode variables
int mode; 
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//gif
PImage [] gif;
int numberOfFrames;
int f;

//darkness
DarknessCell myCell;
int cellx, celly, n;
int [] x; //arrays
int [] y; 
ArrayList <DarknessCell> darkness;
//float size = 100;

void setup() {
  size(800, 800);
  mode = INTRO;
  font = createFont("Raleway-Black.ttf", 2);
  map = loadImage("Map.png");
  rectMode(CENTER);
  myButton = new Button("Start", width/2, 600, 200, 60, red, orange);
  myGif = new AnimatedGif(10, "frame_0", "_delay-0.1s.gif", 400, 400, 800, 800);
  myHero = new Hero();
  myObjects = new ArrayList<GameObject>(); 
  myObjects.add(myHero);
  
  //cells
  darkness = new ArrayList <DarknessCell>(10000);
  n = 20;
  x = new int [n];
  y = new int [n];  
  
  cellx = 0;
  celly = 0;
  
  int i = 0;
  while (i < n) {
    
    x[i] = cellx;
    y[i] = celly;
    cellx = cellx + 50;
    myCell = new DarknessCell(x[i], y[i], 20);
    
    i++;
  }
  
}

void draw() {
  click();
  
  
  //modes
   if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: mode = " + mode);
  }
}
void keyPressed() {
  if (keyCode == UP)    upkey    = true;
  if (keyCode == DOWN)  downkey  = true;
  if (keyCode == LEFT)  leftkey  = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == ENTER) enterkey = true;
  if (key == ' ')       spacekey = true;
}

void keyReleased() {
  if (keyCode == UP)    upkey    = false;
  if (keyCode == DOWN)  downkey  = false;
  if (keyCode == LEFT)  leftkey  = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == ENTER) enterkey = false;
  if (key == ' ')       spacekey = false;
} 
