/*
 * COLLAGE CLASS
 * Grabs a number of images, throws them onto the canvas & draws
 * Added dithering shader (written by Raphaël de Courville)
 *
 * MW_14122015
 * links / refs ...
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////
import processing.pdf.*;
Collage[] myCollage;
int numImages = 30;
boolean ANIMATE, MOUSE;
int mode = 1; // animation mode (voir keys)

boolean PDF_SAVE = false;
PShader dithering;
PImage  sourceImage, noiseImage;


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(720, 440, P2D);
  background(255);
  smooth();
  noStroke();
  imageMode(CENTER);
  myCollage = new Collage[numImages];

  for (int i = 0; i < myCollage.length; ++i) {
    float x = random(width);
    float y = random(height);
     myCollage[i] = new Collage(x, y, true);
  }

  noiseImage  = loadImage( "noise.png" );
  dithering = loadShader( "dithering.glsl" );
  dithering.set("sketchSize", float(width), float(height));
  dithering.set("noiseTexture", noiseImage);
  dithering.set("pixelFrag", 1.0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if(PDF_SAVE) beginRecord(PDF, "Export_###.pdf");

  // display images
   for (int i = 0; i < myCollage.length; ++i) {
       myCollage[i].display();

  // if animate, move images
       if(ANIMATE){

        // if mouse is activated use mouse interaction
        if(MOUSE) {
          float m = map(mouseX, 0, width, 0.01,10.0);
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
    // Uniform variables
  //float m1 = map(mouseX, 0, width, 0.1, 7.3);

  float m2= map(mouseY, 0, height, 0.15, 0.33);
  dithering.set("ditherGrayscaleFact", m2*10);
  dithering.set("ditherGrayscaleMult", m2);

  dithering.set("fragCoordXY", 4.0);

  // Applies the shader to everything that has already been drawn
  //if(!mousePressed) {
  filter( dithering );
  //}

  if(PDF_SAVE) {
    endRecord();
    PDF_SAVE = false;

  }
  }

/////////////////////////// FUNCTIONS ////////////////////////////
 void keyPressed() {
    if (key == 'a') {
      ANIMATE = !ANIMATE;
    }

    if(key == 'm') {
      MOUSE = !MOUSE;
    }

    if(key == 'r') {
      setup();
    }

    if(key == 's') {
      saveFrame("screenCap_###.png");
    }
    
      if(key == '1') {
   mode = 1; 
  }
  
   if(key == '2') {
   mode = 2; 
  }
  }

  void mousePressed() {
   // PDF_SAVE = true; // NOT WORKING WITH RENDERER
  }

/////////////////////////////// END
