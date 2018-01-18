ArrayList<Sea> seas = new ArrayList();
String msg = "";
 
void setup() {
  size(1060, 600);
  textSize(18);
  for (int i=0; i<10; i++) {
    for (int j=0; j<10; j++) {
      seas.add(new Sea(20+50*i, 20+50*j, false) );
      seas.add(new Sea(540+50*i, 20+50*j, true) );
    }
  }
  msg = "Click your own ocean to place ship parts. Press space when done.";
}
 
void draw() {
  background(0);
  for ( int i = 0; i < seas.size (); i++) {
    seas.get(i).draw();
  }
  fill(0);
  stroke(0, 255, 0);
  rect(20, 540, 1020, 40);
  textAlign(CENTER, CENTER);
  fill(0, 255, 0);
  text(msg, width/2, 560);
}
 
void mousePressed() {
  for ( int i = 0; i < seas.size (); i++) {
    seas.get(i).click();
  }
}
 
class Sea {
  boolean has_ship;
  boolean secret;
  boolean clicked;
  int x, y;
  Sea(int ix, int iy, boolean isecret) {
    secret = isecret;
    has_ship = secret && random(1)<.2;//false;
    clicked = false;
    x = ix;
    y = iy;
  }
  void draw() {
    pushMatrix();
    translate(x, y);
    fill(128, 128, 255);
    stroke(0, 0, 255);
    rect(0, 0, 50, 50);
    // An draw other symbols.
    if ( !has_ship && clicked ) {
      fill(255);
      stroke(0);
      ellipse(25, 25, 30, 30);
    }
    if ( !secret && has_ship ) {
      fill(128);
      stroke(0);
      rect(5, 5, 40, 40);
    }
    if ( has_ship && clicked ) {
      fill(255, 0, 0);
      stroke(0);
      ellipse(25, 25, 30, 30);
    }
    popMatrix();
  }
  void click() {
    if ( mouseX > x && mouseX < x+50 && mouseY > y && mouseY < y+50 ) {
      if( ship_place_state && !secret ){
        has_ship = !has_ship;
      }
      if( secret && !ship_place_state ){
        clicked = true;
        computers_turn();
      }
    }
  }
}
 
void computers_turn(){
  for(int i = 0; i < seas.size(); i++){
    if( !seas.get(i).secret && !seas.get(i).clicked ){
      seas.get(i).clicked = true;
      return;
    }
  }
}
 
boolean  ship_place_state = true;
 
void keyPressed(){
  if( ship_place_state && key == ' ' ){
    ship_place_state = false;
    msg = "Click on the Computer's grid to try to locate one of the enemy ships!";
  }
}
