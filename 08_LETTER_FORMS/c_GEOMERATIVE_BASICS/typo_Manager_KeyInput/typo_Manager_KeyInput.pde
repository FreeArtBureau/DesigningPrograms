
/////////////////////////// GLOBALS ////////////////////////////
TypoManager type;
boolean animate = false;

void setup() {
  size(600, 300);
  smooth();
  // The Type Manager enables you to add a geomerative font
  // assigning a font in .ttf format and the segment length
  type = new TypoManager(this,"Lekton-Bold.ttf",8);
  //print(type.shapesNb());
}
/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(255);  
  noStroke();
  fill(200,0,0,200);
  //You can access the points method to draw points on the outline
  type.drawPoints();
  
  //Or you can draw shapes
  fill(50,30,255);
  stroke(10);
 
  type.drawShapes();
  
  if(animate) {
    type.animate2();
  }


}


//Method added to type letters using the keyboard.
void keyPressed() {
     type.updateLetters(); 
     if(keyCode == ALT) {
      animate =!animate; 
     }
}

