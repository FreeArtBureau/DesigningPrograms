/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////

float angle;
float radius = 100;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0); 
  smooth();
  noStroke();
  fill(0,0,255);  
  
  translate(width/2, height/2);
  beginShape();
  
  // We create a loop for the variable deg (degrees)
  for(int deg=0; deg<360; deg++) {    
    angle = radians(deg); //Convert angle so we can use degrees.
    
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    // Using vertex gives us fill() possibility
    // as opposed to point(x,y)
    vertex(x,y);
  }
  endShape(CLOSE);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

}

/////////////////////////// FUNCTIONS ////////////////////////////

