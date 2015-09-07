///////////////////////////////////////
/*
 WORKSHOP PROCESSING SÉRIGRAPHIE
 CASABLANCA, MAROC.
 AU FESTIVAL FAN 21/10/2011
 +++++++++++++++++++++++++++ 
 IMAGES
 SKETCH : GET_SET
 TYPE : AUTONOMOUS
 
 Original Code by Andrew Glasner
 
 */
///////////////////////////////////////

PImage MyPicture;
//DECLARE A BOOLEAN LOGIC FOR A SWITCH TO TURN ANIMATION ON/OFF
boolean FreezeFrame = false;

void setup() {
  size(400,300);
  smooth();
  background(255);
  PImage MyPicture = loadImage ("lakes.jpg");
  image(MyPicture,0,0,400,300); //LAST TWO VARIABLES FIX THE SIZE OF THE IMAGE
}

void draw() {
  for (int y=1; y<height; y++) {
    for (int x = 1; x<width; x++) {
      if (random(1000) > 950) {
        
        float rVal = red(x);
        float rValy = red(y);
        
        
      set(x,y,get(x+(int)rValy,y-5+(int)rVal)); //SET(X,Y,COLOR)
      // set(x,y,get(x-2,y)); //SET(X,Y,COLOR)
        //THE SET() FUNCITON CAN WRITE A COLOUR OR IMAGE AT ANY LOCATION IN THE DISPLAY
        //THE GET() FUNCTION CAN READ THE COLOUR OF ANY PIXEL IN THE DISPLAY
        
        //WE ARE GOING THROUGH EACH PIXEL IN THE DISPLAY AND SETTING EACH WITH
        //A NEW COLOUR FROM THE PIXEL ABOVE (DEPENDING ON THE RESULT OF THE RANDOM NUMBER).
      }
    }
  }
}

void keyPressed() {
  if(key == 'f' || key == 'F') {
  // switch loop on/off
    FreezeFrame = !FreezeFrame;
    if (FreezeFrame == true) noLoop();
    else loop();
  }
}

