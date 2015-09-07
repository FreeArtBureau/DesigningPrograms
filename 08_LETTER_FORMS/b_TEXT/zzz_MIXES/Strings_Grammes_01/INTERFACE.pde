
////////////////// ControlP5 INTERFACE

void controlInit() {
  interfaces = new ControlP5(this);  

  //cw = interfaces.addControlWindow("controlP5window", 10, 10, 200, 300, 30);

  //Sliders
  
  // NOISE
  Slider nS = interfaces.addSlider("noiseAmm").setPosition(10, 20).setRange(0.001, 0.05); 
  nS.getCaptionLabel().setColorBackground(color(255, 20, 30)); // changer la couler de fond pour le texte
 

  Slider nA = interfaces.addSlider("fonteSizeNoise").setPosition(10, 40).setRange(0.5, 200);
  nA.getCaptionLabel().setColorBackground(color(255, 20, 30));
  
  Slider nSpeed = interfaces.addSlider("noiseSpeed").setPosition(10, 60).setRange(0.001, 0.05);
  nSpeed.getCaptionLabel().setColorBackground(color(255, 20, 30));
  
  // SINUS
  Slider sA = interfaces.addSlider("sinusAmm").setPosition(10, 100).setRange(0.001, 0.1);
  sA.getCaptionLabel().setColorBackground(color(255, 20, 30));
  
  Slider fonteS = interfaces.addSlider("fonteSizeSinus").setPosition(10, 120).setRange(0.01, 10.0);
  fonteS.getCaptionLabel().setColorBackground(color(255, 20, 30));
  
  Slider speedS = interfaces.addSlider("sinusSpeed").setPosition(10, 140).setRange(0.01, 0.1);
  speedS.getCaptionLabel().setColorBackground(color(255, 20, 30));

  //Toggle 
  nT = interfaces.addToggle("noiseOn").setPosition(10, 160).setSize(10, 10).setValue(false);
  nT.getCaptionLabel().setColorBackground(color(255, 20, 30));


  // Add to new window
  /*nS.setWindow(cw); 
  nA.setWindow(cw); 
  nSpeed.setWindow(cw);
  
  sA.setWindow(cw); 
  nT.setWindow(cw); 
  fonteS.setWindow(cw); 
  speedS.setWindow(cw);
  */
}

