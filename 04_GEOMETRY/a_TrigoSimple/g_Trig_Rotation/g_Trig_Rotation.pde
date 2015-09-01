/*
SIMPLE ROTATION USING TRIG

*/

/////////////////////////// GLOBALS ////////////////////////////

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 300);
  background(255);
  smooth();
  noStroke();
  
 
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
    background(0);
     //TRY ADDING THESE TWO LINES. 
    //float n = noise(frameCount*0.05) * 33;
    //float x = cos(frameCount*0.05) * (100 + n) + width/2;
    
    
    float x = cos(frameCount*0.05) * 100  + width/2;
    float y = sin(frameCount*0.05) * 50 + height/2;
    
    translate(x, y);
    fill(0,0,255);
    ellipse(0,0,30,30);
    
}

/////////////////////////// FUNCTIONS ////////////////////////////

