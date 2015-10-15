void controlInit() {
 interfaces = new ControlP5(this); 
 
  // Change interface default disply font
  PFont p = createFont("ariel", 12);
  interfaces.setControlFont(p); 

  Slider s = interfaces.addSlider("lineLn").setPosition(10, 20).setRange(0, 100).setValue(20.0);
  ;
  Slider r = interfaces.addSlider("strokeW").setPosition(10, 40).setRange(0, 100);
  Slider a = interfaces.addSlider("angle").setPosition(10, 60).setRange(0, TWO_PI);

 Toggle t1 = interfaces.addToggle("show").setPosition(130, 20)
    .setSize(10, 10).setValue(false).setCaptionLabel("show")
    .setColorCaptionLabel(color(0, 0, 255)); // change text colour

  // Two bang buttons for invoking two sepearate functions : 
  // bangSave & bangLoad - see FUNCTIONS TAB
  Bang b1 = interfaces.addBang("bangSave").setPosition(170, 20)
    .setSize(10, 10).setTriggerEvent(Bang.RELEASE).setCaptionLabel("save")
    .setColorCaptionLabel(color(0, 0, 255)); // change text colour
    
   Bang b2 = interfaces.addBang("bangLoad").setPosition(210, 20)
    .setSize(10, 10).setTriggerEvent(Bang.RELEASE).setCaptionLabel("load")
    .setColorCaptionLabel(color(0, 0, 255)); 
  
}
