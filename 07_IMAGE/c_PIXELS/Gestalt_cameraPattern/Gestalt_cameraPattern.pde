
import processing.video.Capture;
Capture cam;

int dbox = 50;
int wcam = 640;
int hcam = 480;
float zoom = 1.0;

void setup() {
  size(601, 601);
  cam = new Capture(this, wcam, hcam);
  cam.start();
}


void draw() {
 
  background(0);
  randomSeed(0);
  
  int ymax = width / dbox;
  int xmax = height / dbox;

  for(int y = 0; y < ymax; y++) {
    for(int x = 0; x < xmax; x++) {
      pushMatrix();
      translate(x * dbox, y * dbox);
      element(dbox, random(1) > 0.5);
      popMatrix();
    } 
  }   
}


void element(int d, boolean flip) {
   if(!flip) {
      camSnippet(d); 
   } else {
     pushMatrix(); 
     translate(0, d); scale(1,-1);
     camSnippet(d);
     popMatrix();
   }
}


void camSnippet(int dbox) {  
  int w = wcam;
  int h = hcam;
  int d = int(dbox / zoom);
  copy(cam.get(),  w/2 - d/2, h/2 - d/2, d, d, 0, 0, dbox, dbox);  
}


// read a new frame when it's available
void captureEvent(Capture c) {
  c.read();
}

// interaction
void keyPressed() {
  switch(key) {
    case '+':
      zoom *= 1.2;
      break;
    case '-':
      zoom /= 1.2;
      break;
  } 
}