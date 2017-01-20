///////////////////////////////////// INTERFACE
int INDEX = 2;
int ALPHA_NUM = 4;
int CHOIX;
float SHP_SIZE;
int PNTS,PNTS_OFF;
float ANGLE_1;

boolean CIRCLES = false;
boolean FILL_IN = false;
float DIA;

void controlInit() {

  // Initialiser notre objet (On a toujours besoin de le faire).
  INTERFACES = new ControlP5(this);  


  //////////////////////////////////// Add group for FORME1 ( LINES )
  Group g1 = INTERFACES.addGroup("g1")
    .setPosition(10, 20)
      .setWidth(180)
        .activateEvent(true)
          .setBackgroundColor(color(#C9BFBF))
            .setBackgroundHeight(180)
              .setLabel("LINES")
                .setBarHeight(15)
                ;
  ///////////////////////////////////////// g1 Form Settings
  Slider s = INTERFACES.addSlider("noiseRes").setPosition(10, 20).setRange(1, 10).setValue(6).setGroup(g1); 
  Slider s2 = INTERFACES.addSlider("noiseScale").setPosition(10, 35).setRange(0.001, 0.015).setValue(0.005).setGroup(g1);  
  Slider inter = INTERFACES.addSlider("lineFX").setPosition(10, 50).setRange(1, 50).setValue(7).setGroup(g1);  

  Slider r = INTERFACES.addSlider("xSpeed").setPosition(10, 70).setRange(0.0, 5.0).setValue(0.0).setGroup(g1);  
  Slider a = INTERFACES.addSlider("ySpeed").setPosition(10, 85).setRange(0.0, 5.0).setValue(0.0).setGroup(g1);
  Slider yOff = INTERFACES.addSlider("YOFF").setPosition(10, 100).setRange(-5.0, 5.0).setValue(0.0).setGroup(g1);  
  Slider xOff = INTERFACES.addSlider("XOFF").setPosition(10, 115).setRange(-5.0, 5.0).setValue(0.0).setGroup(g1);  




  //////////////////////////////////// Add group for FORME2 ( CIRCLES )
  Group g2 = INTERFACES.addGroup("g2")
    .setPosition(200, 20)
      .setWidth(180)
        .activateEvent(true)
          .setBackgroundColor(color(#C9BFBF))
            .setBackgroundHeight(100)
              .setLabel("CIRCLES")
                .setBarHeight(15)
                ;
  ///////////////////////////////////////// g1 Form Settings
  Slider d = INTERFACES.addSlider("DIA").setPosition(10, 20).setRange(0, 100).setValue(10.0).setGroup(g2);  

  Toggle addCircle = INTERFACES.addToggle("CIRCLES").setPosition(10, 35).setSize(10, 10).setValue(false).setLabel("Circles On/Off").setGroup(g2); 
  Toggle addFill = INTERFACES.addToggle("FILL_IN").setPosition(100, 50).setSize(10, 10).setValue(false).setLabel("FILL On/Off").setGroup(g2);
  Toggle addNoiseLen = INTERFACES.addToggle("NOISE_LENGTH").setPosition(10, 65).setSize(10, 10).setValue(false).setLabel("NLENGTH On/Off").setGroup(g2);

  Toggle anime = INTERFACES.addToggle("ANIMATE").setPosition(100, 65).setSize(10, 10).setValue(false).setLabel("ANIME On/Off").setGroup(g2);

  ///////////////////////////////////////// DROPDOWN LIST [FONTS]
/*
  ScrollableList d1 = INTERFACES.addScrollableList("glyphs").setPosition(450, 20).setSize(100, 200);


  // RAJOUTER NOS ÉLÉMENTS (FONTES) À NOS LISTES
  for (int i=0; i<ALPHA_NUM; i++) { // variable numFontes détérmine le nombre d'éléments dans la liste
    ScrollableList lbi = d1.addItem("glyphs "+i, i); // Ajouter première liste
    d1.setColorBackground(0xffff0000);
  }
}
*/
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
  // & CHARGER LA FONTE EN FONCTION
  
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
    } else if (CHOIX == 2) {
      for (int i=0; i<glyphs.length; i++) {
        glyphs[i] = loadImage("Caviar/Caviar_"+nf(i, 3)+".png");
        glyphs[i].resize(600, 600);
      }
    } else if (CHOIX == 3) {
      for (int i=0; i<glyphs.length; i++) {
        glyphs[i] = loadImage("Harabara/Harabara_"+nf(i, 3)+".png");
        glyphs[i].resize(600, 600);
      }
    }
  }
  
}