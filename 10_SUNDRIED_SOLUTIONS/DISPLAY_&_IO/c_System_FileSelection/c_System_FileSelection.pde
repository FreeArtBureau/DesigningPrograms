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
import controlP5.*;
import java.awt.*;
ControlP5 cp5;
PImage IMG;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(0);
  size(500, 300);
  cp5 = new ControlP5(this);
  smooth();
  noStroke();
  
  //frame.setResizable(true); // manual resize of window with mouse
  // Set minimum window size
  //Dimension d = new Dimension(200, 200);
  //frame.setMinimumSize(d);
  
  PImage img = loadImage("button.png");
  img.resize(40,40);

   cp5.addBang("bang")
     .setPosition(40, 30)
     .setSize(40, 40)
     //.setImage(img)
     .setTriggerEvent(Bang.RELEASE)
     .setLabel("load image")
     //.updateSize()
     ;
     
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
    //frame.setTitle("New image from "+s);
  }

  frame.setSize(IMG.width, IMG.height);
  //size(IMG.width, IMG.height);
}

public void bang() {
  println("a button event from button: "+theValue);
  selectInput("Choose an image", "fileSelected");
}