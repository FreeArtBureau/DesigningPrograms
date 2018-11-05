

/////////////////////////// GLOBALS ////////////////////////////

PImage img;
color col;
int pix = 0;


/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(400,300);
  background(0);
  smooth();
 
  img = loadImage ("circles.jpg");
  
}

/////////////////////////// DRAW ////////////////////////////
void draw() {


    image(img,0,0);
    col = img.get(pix, y);
    float red = red(col);
    println(red);
    pix = pix+1;
    if(pix>400){
     pix = 0;
     y+=1;
    }
  
  

}