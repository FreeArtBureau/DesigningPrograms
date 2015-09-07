/*
PLEASE READ INFO TAB
*/

/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;

ControlP5 INTERFACES;
//ControlWindow CW;

// VARS CONTROLP5
float PIXFACT, FILTERFACT, LINELEN, DIA;
boolean BG, REDFILTER, GREENFILTER, BLUEFILTER, BW;

PImage IMG;
int GRIDREZ;
float COLFILTER;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(0);
  //smooth();
  strokeWeight(0.3);
  noFill();
  imageMode(CENTER);
  // Load image from disk : bug here > press ENTER to add file
  // otherwise interface prompts you twice
  /*String IMGName = selectInput("Choose an image for S.A.M.");
  if (IMGName!=null) {
    IMG = loadImage(IMGName);
  }
  else {
    */
    IMG = loadImage("first_drawing.jpg");
  //}
  size(IMG.width, IMG.height, JAVA2D);
  ControlInit();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if (BG) {
    background(255);
  }

  for (int x = 0; x <= IMG.width; x += GRIDREZ) {
    for (int y = 0; y <= IMG.height; y += GRIDREZ) {
       color col = IMG.get(x,y);
       
      // Colour // Not implemented the B&W filter
       if (BW) {
         IMG.filter(GRAY); // grab blue Pixels
      } else if(!BW) {
        col = IMG.get(x,y);
      }
      
      //color col = IMG.get(x, y); // grab pixel colour
      float pixelBright = (brightness(col)/255) * PIXFACT; // grab brightness

      if (REDFILTER) {
        COLFILTER = (red(col)/255) * FILTERFACT; // grab red Pixels
      }

      if (GREENFILTER) {
        COLFILTER = (green(col)/255) * FILTERFACT; // grab green Pixels
      }

      if (BLUEFILTER) {
        COLFILTER = (blue(col)/255) * FILTERFACT; // grab blue Pixels
      }
            
      // Draw graphics
      float dotDia = COLFILTER/GRIDREZ + (COLFILTER * DIA);
      dots(x, y, dotDia, col);

      float xCrossLen = pixelBright/GRIDREZ + (pixelBright * LINELEN);
      xCross(x, y, xCrossLen, col);
      
      // HEX
        /*
      pushMatrix();
      translate(x, y);
      hexA(0,0, xCrossLen, col);
      popMatrix();
      */
    }
  }
}

