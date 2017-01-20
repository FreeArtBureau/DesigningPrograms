///////////////////////////////////// INTERFACE
int INDEX = 2;
int NUM_ALPHA = 3;
int CHOIX;
boolean TRAMEV_ACTIVE;

void controlInit() {

  // Initialiser notre objet (On a toujours besoin de le faire).
  INTERFACES = new ControlP5(this);  


  //////////////////////////////////// Add group for FORME1 ( LINES )
  Group g1 = INTERFACES.addGroup("g1")
    .setPosition(10, 20)
      .setWidth(180)
        .activateEvent(true)
          .setBackgroundColor(color(0xffff0000))
            .setBackgroundHeight(180)
              .setLabel("LINES")
                ;
  ///////////////////////////////////////// g1 Form Settings
  //Créer un curseur avec des valeurs de 0 > 100
  Slider s = INTERFACES.addSlider("LINE_LN").setPosition(10, 20).setRange(0, 50).setValue(10.0).setGroup(g1); 
  Slider s2 = INTERFACES.addSlider("LINE_LN2").setPosition(10, 40).setRange(0, 50).setValue(10.0).setGroup(g1);  

  Slider r = INTERFACES.addSlider("STROKEW").setPosition(10, 80).setRange(0, 20).setValue(2.2).setGroup(g1);  
  Slider a = INTERFACES.addSlider("ANGLE_1").setPosition(10, 100).setRange(0, TWO_PI).setValue(2.72)
    .setNumberOfTickMarks(25).setSliderMode(Slider.FLEXIBLE).setGroup(g1); 
  Slider inter = INTERFACES.addSlider("INTERVALLE").setPosition(10, 125).setRange(2, 50).setValue(15).setGroup(g1);  
  Slider yOff = INTERFACES.addSlider("YOFF").setPosition(10, 145).setRange(-15.0, 15.0).setValue(0.0).setGroup(g1);  
  Slider xOff = INTERFACES.addSlider("XOFF").setPosition(10, 165).setRange(-15.0, 15.0).setValue(0.0).setGroup(g1);  




  //////////////////////////////////// Add group for FORME2 ( CIRCLES )
  Group g2 = INTERFACES.addGroup("g2")
    .setPosition(200, 20)
      .setWidth(180)
        .activateEvent(true)
          .setBackgroundColor(color(0xffff0000))
            .setBackgroundHeight(100)
              .setLabel("CIRCLES")
                ;
  ///////////////////////////////////////// g1 Form Settings
  Slider d = INTERFACES.addSlider("DIA").setPosition(10, 20).setRange(0, 100).setValue(10.0).setGroup(g2);  

  Toggle addCircle = INTERFACES.addToggle("CIRCLES").setPosition(10, 40).setSize(10, 10).setValue(false).setLabel("Circles On/Off").setGroup(g2); 
  Toggle addFill = INTERFACES.addToggle("FILL_IN").setPosition(100, 40).setSize(10, 10).setValue(false).setLabel("FILL On/Off").setGroup(g2);
  Toggle activeTrame = INTERFACES.addToggle("TRAMEV_ACTIVE").setPosition(10, 70).setSize(10, 10).setValue(true).setLabel("TRAMEV On/Off").setGroup(g2);


  ///////////////////////////////////////// DROPDOWN LIST [FONTS]

  ScrollableList d1 = INTERFACES.addScrollableList("glyphs").setPosition(450, 20).setSize(100, 200);

  // RAJOUTER NOS ÉLÉMENTS (FONTES) À NOS LISTES
  for (int i=0; i<NUM_ALPHA; i++) { // variable numFontes détérmine le nombre d'éléments dans la liste
    ScrollableList lbi = d1.addItem("glyphs "+i, i); // Ajouter première liste
    d1.setColorBackground(0xffff0000);
  }
}


////////////////////////////////// SAVING PATCHES
void keyPressed() {
  // default properties load/save key combinations are 
  // alt+shift+l to load properties
  // alt+shift+s to save properties
  if (key=='1') {
    INTERFACES.saveProperties(("hello.properties"));
  } else if (key=='2') {
    INTERFACES.loadProperties(("hello.properties"));
  }


  if (keyCode == ALT) {
    PDFEXPORTING = true;
  }

  if ((keyCode != ALT) && (keyCode != CONTROL) && (key != CODED)) {
    // convert key to int and attribute to INDEX
    INDEX = int(key)-97;
  }
}


/////////////////////////////////////////////////////////////////////// EVENTS

void controlEvent(ControlEvent theEvent) {

  if (theEvent.isGroup()) {
    println(theEvent.group().getValue()+" from "+theEvent.group());
  }

  //****************************************************
  // VÉRIFIER SI ON REÇOIT UN ÉVÉNEMENT TYPE MOUSEPRESSED SUR LA LISTE
  if (theEvent.isGroup() && theEvent.name().equals("glyphs")) {

    // Variable pour changer de fonte 'choix'
    CHOIX = (int)theEvent.group().getValue();
    println("test "+CHOIX);

    if (CHOIX == 0) {
      for (int i=0; i<glyphs.length; i++) {
        glyphs[i] = loadImage("Found/Found_"+nf(i, 3)+".png");
        glyphs[i].resize(600, 600);
      }
    } else if (CHOIX == 1) {
      for (int i=0; i<glyphs.length; i++) {
        glyphs[i] = loadImage("Caslon/Caslon_"+nf(i, 3)+".png");
        glyphs[i].resize(600, 600);
      }
    }else if (CHOIX == 2) {
      for (int i=0; i<glyphs.length; i++) {
        glyphs[i] = loadImage("Caviar/Caviar_"+nf(i, 3)+".png");
        glyphs[i].resize(600, 600);
      }
    }
  }
}