/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
*/


///////////////////////////////// GLOBALS
import gab.opencv.*;
import processing.video.*;

Capture video;
Movie movie;
Boolean MOVIE = false; // 

OpenCV opencv;
ArrayList<Contour> contours;
ArrayList<Contour> polygons;
boolean CONTOURS = true;
boolean DRAW_POLY = true;
boolean DRAW = true;

///////////////////////////////// SETUP
void setup() {
  size(640, 480);
  background(0);
  
  LivevideoSetup(); //Live feed setup
  movieSetup("street.mov"); // QT movie setup
  openCVSetup(); // openCV setup
}


///////////////////////////////// DRAW
void draw() {
  //background(0);
  //image(video, 0, 0); 
  if (MOVIE) {
    opencv.loadImage(movie);
  } else {
    opencv.loadImage(video);
  }
  opencv.updateBackground();

  filterImage();
  findContours();
}

///////////////////////////////// FUNCTIONS
void keyPressed() {
  if (key == 'q') {
    background(0);
  }
  
  if(key == 'c') {
   DRAW = !DRAW; 
  }
  
  if(key == 'p') {
   DRAW_POLY = !DRAW_POLY; 
  }
} 

//VIDEO FUNCTIONS
void captureEvent(Capture c) {
  c.read();
}
void movieEvent(Movie m) {
  m.read();
}

