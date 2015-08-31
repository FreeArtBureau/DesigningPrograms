/*
Example of how to use the click & drag class

*/

Draggable[] objects = new Draggable[3];
PImage[] myImages = new PImage[3];

///////////////////////////////////////////

void setup() {
  size(300, 300);
  smooth();
  // load images from data folder
  for (int i=0; i<myImages.length;i++) {
    myImages[i] = loadImage( "img_" + nf(i, 3) +".jpg" );
  }
  // initialise objects
  for (int i=0; i<objects.length;i++) {
    objects[i] = new Draggable(random(width-myImages[0].width/2), 
    random(height-myImages[0].height/2), 50, 50);
  }
}

///////////////////////////////////////////

void draw() {
  background(0);
  for (int i=0; i<objects.length;i++) {
    objects[i].rollover(mouseX, mouseY);
    objects[i].drag(mouseX, mouseY);
    objects[i].display();
  }
}


///////////////////////////////////////////
void mousePressed() {
  for (int i=0; i<objects.length;i++) {
    objects[i].clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (int i=0; i<objects.length;i++) {
    objects[i].stopDragging();
  }
}

