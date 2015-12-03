/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */
/////////////////////////////////////////


/////////////////////////// GLOBALS ////////////////////////////

Agent[] myAgents = new Agent[123];
PImage a;

//------ An Array of Good Colour ------
color[] goodcolour = {  #381C36, #7A4D24, #B89333, #A6C73C, #335E4D, #4CB8A4, #F2322A
};

float dia;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 400);
  background(0);
  smooth();
  a = loadImage("text.jpg");

  for (int i=0; i<myAgents.length; i++) {
    float x = random(width);
    float y = random(height);
    myAgents[i] = new Agent(x, y, 5);
  }
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  for (int i=0; i<myAgents.length; i++) {
    myAgents[i].display();
    myAgents[i].motion();
  }
}

