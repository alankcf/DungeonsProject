//Alan Fung
//Dungeons Project
//November 2021

//making enemies that are different in term of behavior (angry enemies)
//enemy boss
//make sure that gameover reset is good
//make enemies PImages
//stop weapons from changing when exit info

//Game Settings
int ENEMYHP = 100;

int FOLLOWER_SIZE = 50;

int SHOOTFOLLOWER_HP = 100;
int SHOOTFOLLOWER_SIZE = 50;

int TURRET_HP = 100;
int TURRET_SIZE = 50;
int TURRET_BULLETSIZE = 10;

int SNIPER_THRESHOLD = 80;
int SNIPER_SPEED = 20;

int MACHINEGUN_THRESHOLD = 7;
int MACHINEGUN_SPEED = 10;

int SHOTGUN_THRESHOLD = 100;
int SHOTGUN_SPEED = 5;

int FLAMETHROWER_THRESHOLD = 7;
int FLAMETHROWER_SPEED = 10;

boolean upkey, downkey, leftkey, rightkey, spacekey, enterkey, wkey, akey, skey, dkey;
AnimatedGif myGif, manUp, manDown, manRight, manLeft;
AnimatedGif eUp, eDown, eRight, eLeft;
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
color brown = #FC7F00;
color red = #F70000;
color orange = #FA8303;
color blue = #03ADFA;
color yellow = #E8BB3F;
color black = #000000;
color darkyellow = #FFAC12;
color darkblue = #272D4D;
color purple = #6E06B9;
color darkred = #F25D5D;
color grey = #D6D6D6;
color mango = #FF6A5A;
color green2 = #00ED2D;

//Buttons
Button myButton;
Button secondButton;
Button speed;
Button lives;
Button exit, exit2, exit3;
Button addammo;
Button info;
Button addgun;

//mode variables
int mode; 
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int INFO = 4;
final int UNLOCKED = 5;

//gif
PImage [] gif;
int numberOfFrames;
int f;

//darkness
DarknessCell myCell;
int[] x;
int[] y;
int brickd;
int num;
int tempx, tempy;

//immunity
int immune;
int immunestart = 100;
int immuneplus = 0;
int immunelength = immunestart + immuneplus;

//dropped images
PImage healthpotion;
PImage shotgun;

//variables
int points = 10; //xp
int damage = 0;
int addspeed = 0;
int pointswin = 25;
int ammo = 50;
int level = 1;
int clickedtimelives, clickedtimeshield, clickedtimeammo = 0;
int livesbooster, speedbooster = 0;
int gunmax = 2;

//booleans
boolean leave = false;
boolean clickedonce2 = false;
boolean clickedonce3 = false;
boolean clickedonce4 = false;

//weapons images
PImage pistol, sniper, machine, shotsgun, flamethrower;

void setup() {
  size(800, 800);
  mode = INTRO;
  //font = createFont("Raleway-Black.ttf", 2);
  font = createFont("BakbakOne-Regular.ttf", 2);
  //font = createFont("FredokaOne-Regular.ttf", 2);
  map = loadImage("Map.png");
  rectMode(CENTER);
  
  //weapons
  pistol = loadImage("pistol.png");
  sniper = loadImage("sniper.png");
  machine = loadImage("machine.png");
  shotsgun = loadImage("shotgun.png");
  flamethrower = loadImage("flame.png");
  
  //objects
  myButton = new Button("Start", width/2, 600, 200, 60, red, orange);

  //gifs
  myGif = new AnimatedGif(10, "Data/frame_0", "_delay-0.1s.gif", 400, 400, 800, 800);
  manUp = new AnimatedGif(7, 4, "man/up/sprite_", ".png"); 
  manDown = new AnimatedGif(7, 4, "man/down/sprite_", ".png"); 
  manLeft = new AnimatedGif(7, 4, "man/left/sprite_", ".png"); 
  manRight = new AnimatedGif(7, 4, "man/right/sprite_", ".png"); 
  eUp = new AnimatedGif(7, 4, "skeleton/_up/Skeleton_", ".png");
  eDown = new AnimatedGif(7, 4, "skeleton/_down/Skeleton_0", ".png");
  eLeft = new AnimatedGif(7, 4, "skeleton/_left/Skeleton_0", ".png");
  eRight = new AnimatedGif(7, 4, "skeleton/_right/Skeleton_", ".png");

  //dropped item images
  healthpotion = loadImage("_0.png");
  shotgun = loadImage("shotgun.png");
  
  //Hero
  myHero = new Hero();
  myObjects = new ArrayList<GameObject>(); 
  myObjects.add(myHero);

  //darkness cells  
  brickd = 10;
  num = 7000;
  x = new int[num]; //number of pages = n
  y = new int [num];

  //where it starts
  tempx = 0;
  tempy = 0;

  //darkness loop
  int i = 0;
  while (i < num) {
    x[i] = tempx;
    y[i] = tempy;
    tempx = tempx + brickd;
    i++; 

    if (tempx > width) {
      tempy = tempy + brickd;
      tempx = 0;
    }
  } 
  if (myHero.roomX != 1 || myHero.roomY != 1) leave = false;
  
  //loading enemies from minimap
  int a = 0;
  int b = 0;
  while (b < map.height) {
    color roomColor = map.get(a, b);
    if (roomColor == red) {
      myObjects.add(new Turret(a, b, width/2, height/2));
    } 
    if (roomColor == blue) {
      myObjects.add(new Follower(a, b, random(100, 700), random(100, 700)));
    }
    if (roomColor == black && myHero.roomX != 1 && myHero.roomY != 1) {
      myObjects.add(new Enemy(a, b));
    }
    if (roomColor == green) {
      myObjects.add(new shootFollower(a, b));
    }
    a++;
    if (a == map.width) {
      a = 0;
      b++;
    }
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
  } else if (mode == INFO) {
    info();
  } else if (mode == UNLOCKED) {
    unlocked();
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
  if (keyCode == 'W')   wkey = true;
  if (keyCode == 'S')   skey = true;
  if (keyCode == 'A')   akey = true;
  if (keyCode == 'D')   dkey = true;
  if (key == ' ')       spacekey = true;
}

void keyReleased() {
  if (keyCode == UP)    upkey    = false;
  if (keyCode == DOWN)  downkey  = false;
  if (keyCode == LEFT)  leftkey  = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == ENTER) enterkey = false;
  if (keyCode == 'W')   wkey = false;
  if (keyCode == 'S')   skey = false;
  if (keyCode == 'A')   akey = false;
  if (keyCode == 'D')   dkey = false;
  if (key == ' ')       spacekey = false;
} 
