
////////////////// ControlP5 INTERFACE

void ControlInit() {
  INTERFACES = new ControlP5(this);  
  CW = INTERFACES.addControlWindow("controlP5window", 10, 10, 200, 300, 30);

  // SLIDER 1
  Slider gridStep = INTERFACES.addSlider("GRIDREZ").setPosition(10, 20).setRange(1, 30).setValue(5); 
  gridStep.getCaptionLabel().setColorBackground(color(255, 20, 30)); // changer la couler de fond pour le texte
  gridStep.getCaptionLabel().getStyle().setPadding(4, 2, 2, 2); // changer sa taille (pour le texte)
  // shift the caption label up by 4px
  gridStep.getCaptionLabel().getStyle().setMargin(-5, 0, 0, 0); 

  Slider PixelBrightnessFact = INTERFACES.addSlider("PIXFACT").setPosition(10, 40).setRange(1, 200).setValue(50); 

  // OTHER SLIDERS 
  Slider PixelFilterFact = INTERFACES.addSlider("FILTERFACT").setPosition(10, 100).setRange(0.01, 15).setValue(0.5); 
  //Slider diaFact = INTERFACES.addSlider("diaFact").setPosition(10, 120).setRange(0.1, 5.0).setValue(2); 
  //Slider lineLen = INTERFACES.addSlider("lineLen").setPosition(10, 140).setRange(0.1, 10.0).setValue(2); 

  Toggle t = INTERFACES.addToggle("BG").setPosition(10, 160).setSize(15, 15).setValue(true).setLabel("BG ON/OFF");
  Toggle t2 = INTERFACES.addToggle("REDFILTER").setPosition(10, 60).setSize(10, 10).setValue(false);
  Toggle t3 = INTERFACES.addToggle("GREENFILTER").setPosition(60, 60).setSize(10, 10).setValue(false);
  Toggle t4 = INTERFACES.addToggle("BLUEFILTER").setPosition(110, 60).setSize(10, 10).setValue(false);
  Toggle t5 = INTERFACES.addToggle("STROKEB").setPosition(10, 200).setSize(10, 10).setValue(false);
  Toggle t6 = INTERFACES.addToggle("TRISHAPE").setPosition(10, 240).setSize(10, 10).setValue(false);
  Toggle t7 = INTERFACES.addToggle("QUADSHAPE").setPosition(60, 240).setSize(10, 10).setValue(false);
  Toggle t8 = INTERFACES.addToggle("STRIP").setPosition(110, 240).setSize(10, 10).setValue(false);


/*
  // ADD GRAPHICS TO NEW WINDOW
  gridStep.setWindow(CW);
  PixelBrightnessFact.setWindow(CW);
  PixelFilterFact.setWindow(CW);
  //diaFact.setWindow(CW);
  //lineLen.setWindow(CW);

  t.setWindow(CW);
  t2.setWindow(CW);
  t3.setWindow(CW);
  t4.setWindow(CW);
  t5.setWindow(CW);
  t6.setWindow(CW);
  t7.setWindow(CW);
  t8.setWindow(CW);
  */
}

// METHODS

