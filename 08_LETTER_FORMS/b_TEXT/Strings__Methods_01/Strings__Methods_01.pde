/*
Check REF :
http://docs.oracle.com/javase/6/docs/api/java/lang/Object.html
*/

/////////////////////////// GLOBALS ////////////////////////////
String texte1 = "data is magic";
boolean keyPress = false;
PFont f;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 300);
  background(255);
  smooth();
  noStroke();
  fill(0,0,255);
  f = createFont("AnonymousPro-Bold", 53);
  textFont(f);
  
 
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
    background(255);
    text(texte1, 50,100);
    
    text("Press r key", 50,200);
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
if(key == 'r') 
keyPress = !keyPress;

// La fonction replaceAll remplace le premier mot par le seconde
if(keyPress) {
texte1 = texte1.replaceAll("magic", "mystereous");
}else {
 texte1 = texte1.replaceAll("mystereous", "magic");
}
}
