/*
This sketch shows how the get() method works. 
Notice the bound checking in the function that will 
return a black colour if out of the pixel bounds
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage img;
color c;
/////////////////////////// SETUP ////////////////////////////

void setup() {
 background(255);
  smooth();
  noStroke();
  img = loadImage("japaneselady.jpg");

  size(img.width, img.height); 
 
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
   background(255);
   
   for(int y=0; y<img.height; y+=1) {
        for(int x=0; x<img.width; x+=1) {
        color c = getPixel(img, x, y);
        fill(c);
        rect(x,y,1,1);
         
          
        }    
   }
// println(frameRate);  
   
}

/////////////////////////// FUNCTIONS ////////////////////////////
// Custom get() Method ( Ref: Andrew Glasner )
color getPixel(PImage getImg, int x, int y) {
  if((x<0) || (y<0) || (x>getImg.width) || (y>getImg.height)) {
   return color(0,0,0); 
  }
  int pos = (y*getImg.width) + x; // mess around with these values to get interesting results
  return(getImg.pixels[pos]);  
}
