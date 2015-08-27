
////////////////////////////////////// CLASS

// the ControlFrame class extends PApplet, so we 
// are creating a new processing applet inside a
// new frame with a controlP5 object loaded
public class ControlFrame extends PApplet {

  int w, h;

  public void setup() {
    size(w, h);
    frameRate(25);
      cp5 = new ControlP5(this); 
      
    // *** ADD SLIDERS / BUTTONS  ETC. HERE... ***
    
    Slider dia = cp5.addSlider("circleDiameter").plugTo(parent,"circleDiameter").setPosition(10, 20).setRange(1, 50).setValue(10); 
    dia.getCaptionLabel().setColorBackground(color(255, 20, 30)); // changer la couler de fond pour le texte
    dia.getCaptionLabel().getStyle().setPadding(4, 2, 2, 2); // changer sa taille (pour le texte)
    // shift the caption label up by 4px
    dia.getCaptionLabel().getStyle().setMargin(-5, 0, 0, 0); 
  
    Slider xInter= cp5.addSlider("xInterval").plugTo(parent,"xInterval").setPosition(10, 40).setRange(1, 100).setValue(20); 
    Slider yInter= cp5.addSlider("yInterval").plugTo(parent,"yInterval").setPosition(10, 60).setRange(1, 100).setValue(20); 
    Slider thick= cp5.addSlider("thickness").plugTo(parent,"thickness").setPosition(10, 80).setRange(0.5, 20.0).setValue(1); 

  }



  ///////////////////////////// NOTHING TO DO HERE
  public void draw() {
  }
  
  private ControlFrame() {
  }

  public ControlFrame(Object theParent, int theWidth, int theHeight) {
    parent = theParent;
    w = theWidth;
    h = theHeight;
  }

  public ControlP5 control() {
    return cp5;
  } 
  
  ControlP5 cp5;
  Object parent;
  
}


////////////////////////////////////// FUNCTIONS

// addControlFrame Function
ControlFrame addControlFrame(String theName, int theWidth, int theHeight) {
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, theWidth, theHeight);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation(50,175);
  f.setResizable(false);
  f.setVisible(true);
  return p;
}





