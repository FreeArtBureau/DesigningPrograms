
/////////////////////////// GLOBALS ////////////////////////////

String myText = "Type something";
PFont a;


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(460, 600);
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(255);
  a = createFont("helvetica", 42);
  textFont(a, 42);
}


/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
  text(myText, 0, 0, width, height);
}


/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (myText.length() > 0) {
      myText = myText.substring(0, myText.length()-1);
    }
  } else if (keyCode == DELETE) {
    myText = "";
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    myText = myText + key;
  }
}

