
/////////////////////////// FUNCTIONS ////////////////////////////

void mousePressed() {
  // Get raw depth data
  int[] depth = kinect.depthMap(); 
  //Pick a pixel position
  int clickedPos = (mouseY*width)+mouseX; // 1D Image Array conversion
  int millimeters = depth[clickedPos];

  float inches = millimeters/25.4;
  println("Pixel distance = "+inches+" inches");
  println("Pixel distance = "+millimeters+" millimeters");
}

void keyPressed() {  

  // SAVE FRAME 
  if (key == 's') {
    saveFrame("KinectImage.png");
  }

  if (key == 'd') {
    SHOW_DEPTH_IMG =! SHOW_DEPTH_IMG;
  }
}

