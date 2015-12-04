/*
 * File Selection
 * Opens system file and lets you choose a file. (in this case an image file)
 *
 * MW 8.10.15
 * https://processing.org/reference/selectInput_.html
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////
import java.awt.*;
PImage IMG;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(0);
  size(100, 100);
  smooth();
  noStroke();
  selectInput("Choose an image", "fileSelected");
  frame.setResizable(true); // manual resize of window with mouse
  // Set minimum window size
  Dimension d = new Dimension(200, 200);
  frame.setMinimumSize(d);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if (IMG != null) {
    image(IMG, 0, 0);
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    String s = selection.getAbsolutePath();
    IMG = loadImage(s);
    frame.setTitle("New image from "+s);
  }

  frame.resize(IMG.width, IMG.height);
  size(IMG.width, IMG.height);
}

