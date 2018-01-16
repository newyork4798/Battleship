float x = 0;
float y = 0;
PImage img;

void setup() {
  fullScreen();
  img = loadImage("BattleshipBackground.jpg");
}

void draw() {
  image(img,0,0);
  
  stroke(255);
  strokeWeight(2);
  
  x = 50;
  while( x < width) {
  line(x,0,x,height);
  x = x +50;
  }
  
  y = 50;
  while( y < height) {
    line(0,y,width,y);
    y = y + 50;
}


}