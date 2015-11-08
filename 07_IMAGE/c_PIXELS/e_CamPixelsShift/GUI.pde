////////////////// ControlP5 INTERFACE

void ControlInit() {

  INTERFACES = new ControlP5(this);    
  //CW = INTERFACES.addControlWindow("controlP5window", 10, 10, 200, 300, 30);
  /*
  Slider s = INTERFACES.addSlider("lineLnH").setPosition(10, 20).setRange(0, 50).setValue(5); 
   s.getCaptionLabel().setColorBackground(color(255, 20, 30)); // changer la couler de fond pour le texte
   s.getCaptionLabel().getStyle().setPadding(4, 2, 2, 2); // changer sa taille (pour le texte)
   // shift the caption label up by 4px
   s.getCaptionLabel().getStyle().setMargin(-5, 0, 0, 0); 
   */
  Slider r = INTERFACES.addSlider("INDEXRED").setPosition(10, 40).setRange(1, 255).setValue(30);  // ici on a rajouté aussi la valeur de départ avec la méthode setValue(30);
  Slider g = INTERFACES.addSlider("INDEXGREEN").setPosition(10, 60).setRange(1, 255).setValue(73); 
  Slider b = INTERFACES.addSlider("INDEXBLUE").setPosition(10, 80).setRange(1, 255).setValue(117); 

  Slider x = INTERFACES.addSlider("TRAMEX").setPosition(10, 120).setRange(1, 20).setValue(5);
  Slider y = INTERFACES.addSlider("TRAMEY").setPosition(10, 140).setRange(1, 20).setValue(5);

  //
  //Toggle t = INTERFACES.addToggle("showCercles").setPosition(10,160).setSize(10,10).setValue(true);
  //Toggle t2 = INTERFACES.addToggle("showLines").setPosition(100,160).setSize(10,10).setValue(true);

}

