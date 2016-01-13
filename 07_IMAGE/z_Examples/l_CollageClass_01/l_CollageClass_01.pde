/*
 * COLLAGE CLASS
 * Grabs a number of images, throws them onto the canvas & draws
 *
 * MW_14122015
 * links / refs ...
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////
Collage[] myCollage;
int numImages = 10;
boolean ANIMATE, MOUSE;
int mode = 1; // animation mode (voir keys)

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(720, 440, P2D);
  background(0);
  smooth();
  noStroke();
  imageMode(CENTER);
  myCollage = new Collage[numImages];

  for (int i = 0; i < myCollage.length; ++i) {
    float x = random(width);
    float y = random(height);
    myCollage[i] = new Collage(x, y, true);
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

  // display images
  for (int i = 0; i < myCollage.length; ++i) {
    myCollage[i].display();

    // if animate, move images
    if (ANIMATE) {

      // if mouse is activated use mouse interaction
      if (MOUSE) {
        float m = map(mouseX, 0, width, 0.01, 10.0);
        myCollage[i].move(m);
      }// otherwise use method move2
      else {
        if (mode == 1) {
          myCollage[i].move2();
        }
        if (mode == 2) {
          myCollage[i].move3();
        }
      }
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 'a') {
    ANIMATE = !ANIMATE;
  }

  if (key == 'm') {
    MOUSE = !MOUSE;
  }

  if (key == 'r') {
    setup();
  }

  if (key == 's') {
    saveFrame("screenCap_###.png");
  }
  
  if(key == '1') {
   mode = 1; 
  }
  
   if(key == '2') {
   mode = 2; 
  }
}

/////////////////////////////// END

