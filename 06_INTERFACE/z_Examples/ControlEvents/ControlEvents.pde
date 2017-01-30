/**
 * ControlP5 ControlEvent.
 * every control event is automatically forwarded 
 * to the function controlEvent(ControlEvent)
 * inside a sketch if such function is available.
 *
 * This sketch also demonstrates how we can set values from a text field box
 * as well as set ids
 *
 */

import controlP5.*;

ControlP5 cp5;

Knob myKnobA;
color colorRect;
color c = color(0,0,255);
float angle;


void setup() {
  size(400, 400);
  noStroke();
  rectMode(CENTER);
  cp5 = new ControlP5(this);

  cp5.addSlider("colorRect")
    .setPosition(20, 20)
    .setValue(73)
    .setSize(100, 20)
    .setMin(0)
    .setMax(255)
    .setId(2);

  cp5.addTextfield("n1")
    .setPosition(20, 60)
    .setSize(100, 20)
    .setLabel("Angle")
    .setId(3);
    
  myKnobA = cp5.addKnob("angle")
            .setPosition(20, 110)
            .setRange(0, 360)
            .setValue(0)
            .setRadius(25)
            .setId(1)
            .setDragDirection(Knob.HORIZONTAL);
}

void draw() {
  background(0);
  fill(colorRect);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angle));

  rect(0, 0, 170, 170);
  popMatrix();
  
  //throw new RuntimeException("This is an error message");
}

// set values to knob controller from text field
void n1(String _val) {
  Knob k = ((Knob)cp5.getController("angle"));
  k.setValue(float(_val));
}


void controlEvent(ControlEvent theEvent) {
  println("got a control event from controller with id "+theEvent.getController().getId());

  if (theEvent.isFrom(cp5.getController("n1"))) {
    println("this event was triggered by Controller n1");
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