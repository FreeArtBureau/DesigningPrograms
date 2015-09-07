///////////////////////////////////////
/*
 WORKSHOP PROCESSING SÉRIGRAPHIE
 CASABLANCA, MAROC.
 AU FESTIVAL FAN 21/10/2011
 +++++++++++++++++++++++++++ 
 IMAGES
 SKETCH : GET_SET_FUZZ
 TYPE : AUTONOMOUS
 
  Original Code by Andrew Glasner

 **NB 
 
 */
 
/////////////////////////// GLOBALS ////////////////////////////
PImage MyPicture;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(400,300);
  background(255);
  PImage MyPicture = loadImage ("lakes.jpg");
  image(MyPicture,0,0,400,300); //LAST TWO VARIABLES FIX THE SIZE OF THE IMAGE
}


/////////////////////////// DRAW ////////////////////////////
void draw() {
  for (int y=1; y<height; y++) {
    for (int x = 1; x<width; x++) {
      if (random(1000) > 990) {
        int j = int(random(1000));
        if (j<250) swap(x,y,x,y-1);
        else if (j<500) swap(x,y,x,y+1);
        else if (j<750) swap(x,y,x-1,y);
        else            swap(x,y,x+1,y);
      }
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
// THIS LITTLE ROUTINE GETS PIXEL VALUES FOR X & Y THEN SWAPS THEM AROUND. NIFTY!
void swap(int x0, int y0, int x1, int y1) {
 color c0 = get(x0, y0);
color c1 = get(x1, y1);
set(x0,y0,c1);
set(x1,y1,c0);
}

