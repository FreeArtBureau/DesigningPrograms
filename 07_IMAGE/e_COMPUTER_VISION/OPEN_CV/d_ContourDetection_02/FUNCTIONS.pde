///////////////////////////////// FUNCTIONS

void LivevideoSetup() {
 video = new Capture(this, 640, 480);
  video.start();
   
}

void movieSetup(String name) {
   movie = new Movie(this, name);
   movie.loop();
   movie.play(); 

}

void openCVSetup() {
  
  opencv = new OpenCV(this, 640, 480);
  
  // Setup background subtraction.
  // (int history, int nMixtures, double backgroundRatio)
   opencv.startBackgroundSubtraction(5, 2, 0.5);
  contours = opencv.findContours();
  println("found " + contours.size() + " contours"); 
}

///////////////////////////// IN DRAW
 void filterImage() {
  //process the frame in opencv a bit
  opencv.dilate();
  opencv.erode();

  //int thresh = (int)map(mouseX, 0, width, 1, 255);
  //opencv.threshold(thresh);
  //opencv.findCannyEdges(thresh/20, thresh);
 
 }
 
 void findContours() {
  
  noFill();
  stroke(255, 0, 0);
  strokeWeight(0.5);
  contours = opencv.findContours(true, true);
  
  // general purpose var
  float thresh = map(mouseX, 0, width, 0.1, 10.0);
  
  if (CONTOURS) {
    for (Contour contour : contours) {
      if(DRAW) {
      stroke(0, 0, 255);
      contour.draw(); //draw them to the screen
      }
      // The number of points in the Contour.
      int n = contour.numPoints();
      println(n);


      if(DRAW_POLY) {
      stroke(255, 0, 0);
      //strokeWeight(8);
      beginShape();

      // Get a new contour that results from calculating the polygon approximation 
      // of the current contour. This will then draw the closest straight line
      // that fits the contour
      contour.setPolygonApproximationFactor(thresh);
      for (PVector point : contour.getPolygonApproximation ().getPoints()) {
        vertex(point.x, point.y);
      }
      endShape();
    }
    }
  } 
 }
