/*
CONTROLP5 Interface (GUI)

*/
void initInterface() {
  INTERFACE = new ControlP5(this);
  
  Slider s1 = INTERFACE.addSlider("WAVE_AMP")
    .setPosition(10, 10)
      .setRange(0, 73)
        .setValue(15);
  Slider s2 = INTERFACE.addSlider("WAVE_FREQ")
    .setPosition(10, 20)
      .setRange(0.05, 0.9)
        .setValue(0.5); 
  Slider s3 = INTERFACE.addSlider("LINE_LEN")
    .setPosition(10, 40)
      .setRange(1, 200)
        .setValue(15);
  Slider s4 = INTERFACE.addSlider("LINE_THICK")
    .setPosition(10, 50)
      .setRange(0.1, 30.0)
        .setValue(1.0);

  Slider s5 = INTERFACE.addSlider("YOFF_SET")
    .setPosition(10, 60)
      .setRange(1, 60)
        .setValue(15);

  Slider s6 = INTERFACE.addSlider("XOFF_SET")
    .setPosition(10, 70)
      .setRange(1, 60)
        .setValue(15);
        
  Slider s7 = INTERFACE.addSlider("ROTATE_MAN") 
    .setPosition(10,80)
      .setRange(0, 360)
        .setValue(0);
        
  Toggle t1 = INTERFACE.addToggle("ALPHA")
    .setPosition(180,10)
      .setSize(10,10)
        .setValue(false);
  
  Toggle t2 = INTERFACE.addToggle("PERLIN_ROTATE")
    .setPosition(320,10)
      .setSize(10,10)
        .setValue(false); 
       
  Slider s8 = INTERFACE.addSlider("NOISE_SCALE")
    .setPosition(320,40)
     .setRange(0.1, 0.001)
        .setValue(0.004); 
 
 Slider s9 = INTERFACE.addSlider("NOISE_AMM")
    .setPosition(320,50)
     .setRange(1,600)
        .setValue(300);    
    
    // Two bang buttons for invoking two sepearate functions : 
  // bangSave & bangLoad - see FUNCTIONS TAB
  Bang b1 = INTERFACE.addBang("bangSave").setPosition(500, 15)
    .setSize(10, 10).setTriggerEvent(Bang.RELEASE).setCaptionLabel("save")
    .setColorCaptionLabel(color(0, 0, 255)); // change text colour
    
   Bang b2 = INTERFACE.addBang("bangLoad").setPosition(500, 40)
    .setSize(10, 10).setTriggerEvent(Bang.RELEASE).setCaptionLabel("load")
    .setColorCaptionLabel(color(0, 0, 255)); 
      
}

