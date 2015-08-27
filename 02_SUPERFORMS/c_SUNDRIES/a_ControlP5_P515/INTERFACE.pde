
////////////////// ControlP5 INTERFACE

void controlInit() {
  INTERFACES = new ControlP5(this);  
  INTERFACES.setAutoDraw(false); 
  
  // Create a new window (doesn't work in Processing 2.0+)
  // Please open a_ControlP5_P52 for a working version
  CW = INTERFACES.addControlWindow("controlP5window", 10, 10, 200, 300, 30);

  //Create a Slider with val from 0 to 50, starting at val 10

  Slider dia = INTERFACES.addSlider("circleDiameter").setPosition(10, 20).setRange(1, 50).setValue(10); 
  dia.getCaptionLabel().setColorBackground(color(255, 20, 30)); // changer la couler de fond pour le texte
  dia.getCaptionLabel().getStyle().setPadding(4, 2, 2, 2); // changer sa taille (pour le texte)
  // shift the caption label up by 4px
  dia.getCaptionLabel().getStyle().setMargin(-5, 0, 0, 0); 
  
  Slider xInter= INTERFACES.addSlider("xInterval").setPosition(10, 40).setRange(1, 100).setValue(20); 
  Slider yInter= INTERFACES.addSlider("yInterval").setPosition(10, 60).setRange(1, 100).setValue(20); 
  Slider thick= INTERFACES.addSlider("thickness").setPosition(10, 80).setRange(0.5, 20.0).setValue(1); 

  // Add sliders to new window - CW
  dia.moveTo(CW);
  xInter.moveTo(CW);
  yInter.moveTo(CW);
  thick.moveTo(CW);



}

