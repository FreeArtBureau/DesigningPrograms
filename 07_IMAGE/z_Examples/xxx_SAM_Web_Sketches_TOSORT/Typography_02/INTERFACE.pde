
////////////////// ControlP5 INTERFACE

void ControlInit() {
  INTERFACES = new ControlP5(this);  
  //INTERFACES.setAutoDraw(false); 
  //CW = INTERFACES.addControlWindow("controlP5window", 10, 10, 200, 300, 30);

  // ANIMATE 1 SLIDERS
  Slider Animate1offY = INTERFACES.addSlider("OFFXFAC").setPosition(10, 20).setRange(0.00, 1).setValue(0.01); 
  Animate1offY.getCaptionLabel().setColorBackground(color(255, 20, 30)); // changer la couler de fond pour le texte
  Animate1offY.getCaptionLabel().getStyle().setPadding(4, 2, 2, 2); // changer sa taille (pour le texte)
  Animate1offY.getCaptionLabel().getStyle().setMargin(-5, 0, 0, 0); 

  Slider Animate1offX = INTERFACES.addSlider("OFFYFAC").setPosition(10, 40).setRange(0.00, 1).setValue(0.50); 

  // ANIMATE 2 SLIDERS
  Slider Animate2NXFac = INTERFACES.addSlider("NOISEXFAC").setPosition(10, 100).setRange(0.01, 1).setValue(0.05); 
  Slider Animate2NYFac = INTERFACES.addSlider("NOISEYFAC").setPosition(10, 120).setRange(0.01, 1).setValue(0.05); 
  Slider Animate2NXAmm = INTERFACES.addSlider("NOISEAMMX").setPosition(10, 140).setRange(0.1, 300).setValue(0.5); 

  // TOGGLES
  Toggle t = INTERFACES.addToggle("BG").setPosition(10, 160).setSize(15, 15).setValue(false).setLabel("BG ON/OFF");
  Toggle t2 = INTERFACES.addToggle("ANIME1").setPosition(10, 60).setSize(10, 10).setValue(false);
  Toggle t3 = INTERFACES.addToggle("ANIME2").setPosition(60, 60).setSize(10, 10).setValue(false);
  Toggle t4 = INTERFACES.addToggle("ANIME3").setPosition(110, 60).setSize(10, 10).setValue(false);

/*
  Animate1offY.setWindow(CW);
  Animate1offX.setWindow(CW);
  Animate2NXFac.setWindow(CW);
  Animate2NYFac.setWindow(CW);
  Animate2NXAmm.setWindow(CW);

  t.setWindow(CW);
  t2.setWindow(CW);
  t3.setWindow(CW);
  t4.setWindow(CW);
  */
}

