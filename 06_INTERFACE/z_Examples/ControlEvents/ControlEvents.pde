/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

import controlP5.*;
ControlP5 interfaces;

Knob myKnobA;
color colorRect;
color c = color(0, 0, 255);
float angle;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  noStroke();
  rectMode(CENTER);
  interfaces = new ControlP5(this);

  interfaces.addSlider("colorRect")
    .setPosition(20, 20)
    .setRange(0, 255)
    .setValue(255)
    .setSize(100, 20);

  interfaces.addTextfield("txt1")
    .setPosition(20, 60)
    .setSize(100, 20)
    .setLabel("Angle")
    .setId(2);

  interfaces.addKnob("angle")
    .setPosition(20, 110)
    .setRange(0, 360)
    .setValue(0)
    .setRadius(25)
    .setId(1)
    .setDragDirection(Knob.VERTICAL);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  fill(colorRect);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angle));

  rect(0, 0, 170, 170);
  popMatrix();
}


/////////////////////////// FUNCTIONS ////////////////////////////

// set values to knob controller from text field
void txt1(String _val) {
  Knob k = ((Knob)interfaces.getController("angle"));
  k.setValue(float(_val));
}

// Listens for Controller events
void controlEvent(ControlEvent theEvent) {
  //println("got a control event from controller with id "+theEvent.getController().getId());
  if (theEvent.isFrom(interfaces.getController("txt1"))) {
    println("this event was triggered by Controller txt1");
  }
}


/*
a list of all methods available for the ControlEvent Controller
 use ControlP5.printPublicMethodsFor(ControlEvent.class);
 to print the following list into the console.
 
 You can find further details about class ControlEvent in the javadoc.
 
 Format:
 ClassName : returnType methodName(parameter type)
 
 
 controlP5.ControlEvent : ControlGroup getGroup() 
 controlP5.ControlEvent : Controller getController() 
 controlP5.ControlEvent : String getLabel() 
 controlP5.ControlEvent : String getName() 
 controlP5.ControlEvent : String getStringValue() 
 controlP5.ControlEvent : String toString() 
 controlP5.ControlEvent : Tab getTab() 
 controlP5.ControlEvent : boolean isAssignableFrom(Class) 
 controlP5.ControlEvent : boolean isController() 
 controlP5.ControlEvent : boolean isFrom(ControllerInterface) 
 controlP5.ControlEvent : boolean isFrom(String) 
 controlP5.ControlEvent : boolean isGroup() 
 controlP5.ControlEvent : boolean isTab() 
 controlP5.ControlEvent : float getArrayValue(int) 
 controlP5.ControlEvent : float getValue() 
 controlP5.ControlEvent : float[] getArrayValue() 
 controlP5.ControlEvent : int getId() 
 controlP5.ControlEvent : int getType() 
 java.lang.Object : String toString() 
 java.lang.Object : boolean equals(Object) 
 
 created: 2015/03/24 12:22:35
 
 */