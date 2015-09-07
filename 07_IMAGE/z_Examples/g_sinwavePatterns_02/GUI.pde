////////////////// ControlP5 INTERFACE

void ControlInit() {

  INTERFACES = new ControlP5(this);    
  /*
  Slider s = INTERFACES.addSlider("lineLnH").setPosition(10, 20).setRange(0, 50).setValue(5); 
   s.getCaptionLabel().setColorBackground(color(255, 20, 30)); // changer la couler de fond pour le texte
   s.getCaptionLabel().getStyle().setPadding(4, 2, 2, 2); // changer sa taille (pour le texte)
   // shift the caption label up by 4px
   s.getCaptionLabel().getStyle().setMargin(-5, 0, 0, 0); 
   */
  Slider p = INTERFACES.addSlider("PAS").setPosition(10, 40).setRange(1, 14).setValue(12);  // ici on a rajouté aussi la valeur de départ avec la méthode setValue(30);
  Slider fv = INTERFACES.addSlider("FREQFACT").setPosition(10, 50).setRange(0.02, 1.0).setValue(0.5); 
  Slider a = INTERFACES.addSlider("AMP").setPosition(10, 60).setRange(1, 10).setValue(8); 
  //Slider ns = INTERFACES.addSlider("NOISESCALE").setPosition(10, 120).setRange(0.001, 0.1).setValue(0.01); 

  Slider nv = INTERFACES.addSlider("NOISEVALUE").setPosition(10, 80).setRange(0.1, 10.0).setValue(10.0);
  Slider d = INTERFACES.addSlider("DOTSIZE").setPosition(10, 90).setRange(1, 20).setValue(10);

  //
  //Toggle t = INTERFACES.addToggle("showCercles").setPosition(10,160).setSize(10,10).setValue(true);
  //Toggle t2 = INTERFACES.addToggle("showLines").setPosition(100,160).setSize(10,10).setValue(true);


}

