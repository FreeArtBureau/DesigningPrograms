
PImage a;

void setup() {
  size(400, 400);
  background(0);
  noLoop();
  smooth();
  a=loadImage("draw.png");
  // a.resize(width,height);
}

void draw() {

  stroke(255);
  for (int i=10; i<width-10; i=i+10) {
    for (int j=10; j<height-10; j=j+10) {

      color col = a.get(i, j);      
      float lum = (brightness(col)/255)*7; 
      stroke(col);
      strokeWeight(lum/3);
      
      // create some variation with display of graphics
      int pasX = (int)random(1, 4);
      if ((i%pasX==0) && (j%pasX==0)) { 
        //DESSINER NOTRE CROIX
        line(i, j+10, i+10, j);
        line(i, j, i+10, j+10);
      }
    }
  }
}

