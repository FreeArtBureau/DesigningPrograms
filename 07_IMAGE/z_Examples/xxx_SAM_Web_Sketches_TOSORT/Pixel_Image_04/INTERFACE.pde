
////////////////// ControlP5 INTERFACE

void ControlInit() {
  INTERFACES = new ControlP5(this);  
  //INTERFACES.setAutoDraw(false); 
 // CW = INTERFACES.addControlWindow("controlP5window", 10, 10, 200, 300, 30);

  // ANIMATE 1 SLIDERS
  Slider PixelSize = INTERFACES.addSlider("GRIDREZ").setPosition(10, 20).setRange(1, 30).setValue(4); 
  PixelSize.getCaptionLabel().setColorBackground(color(255, 20, 30)); // changer la couler de fond pour le texte
  PixelSize.getCaptionLabel().getStyle().setPadding(4, 2, 2, 2); // changer sa taille (pour le texte)
  // shift the caption label up by 4px
  PixelSize.getCaptionLabel().getStyle().setMargin(-5, 0, 0, 0); 

  Slider PixelBrightnessFact = INTERFACES.addSlider("PIXFACT").setPosition(10, 40).setRange(0.1, 15).setValue(0.5); 

  // ANIMATE 2 SLIDERS
  Slider PixelFILTERFACT = INTERFACES.addSlider("FILTERFACT").setPosition(10, 100).setRange(0.01, 15).setValue(0.5); 
  Slider DIA = INTERFACES.addSlider("DIA").setPosition(10, 120).setRange(0.1, 5.0).setValue(2); 
  Slider LINELEN = INTERFACES.addSlider("LINELEN").setPosition(10, 140).setRange(0.1, 10.0).setValue(2); 


  /*
 // Slider time = INTERFACES.addSlider("timeStep").setPosition(10, 40).setRange(0.001, 0.7).setValue(0.10);
   // Slider visc = INTERFACES.addSlider("viscosity").setPosition(10, 60).setRange(0.01, 0.09).setValue(0.05);
   
   */
  // Bang bang = INTERFACES.addBang("bang").setPosition(10, 200).setSize(10, 10).setTriggerEvent(Bang.RELEASE).setLabel("redraw");

  Toggle t = INTERFACES.addToggle("BG").setPosition(10, 160).setSize(15, 15).setValue(true).setLabel("BG ON/OFF");
  Toggle t2 = INTERFACES.addToggle("REDFILTER").setPosition(10, 60).setSize(10, 10).setValue(false);
  Toggle t3 = INTERFACES.addToggle("GREENFILTER").setPosition(60, 60).setSize(10, 10).setValue(false);
  Toggle t4 = INTERFACES.addToggle("BLUEFILTER").setPosition(110, 60).setSize(10, 10).setValue(false);
  //Toggle t5 = INTERFACES.addToggle("BW").setPosition(10, 200).setSize(10, 10).setValue(false).setLabel("B&W");;

/*
  PixelSize.setWindow(CW);
  PixelBrightnessFact.setWindow(CW);
  PixelFILTERFACT.setWindow(CW);
  DIA.setWindow(CW);
  LINELEN.setWindow(CW);

  t.setWindow(CW);
  t2.setWindow(CW);
  t3.setWindow(CW);
  t4.setWindow(CW);
 // t5.setWindow(CW);
 */
}

// METHODS

