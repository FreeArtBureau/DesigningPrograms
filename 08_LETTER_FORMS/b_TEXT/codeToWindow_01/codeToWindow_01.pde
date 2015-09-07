String code;
PFont f;

void setup() {
  size(500,700);
  smooth();
  code = loadPde("codeToWindow_01.pde");
  f = createFont("anonymouspro", 12);
  textFont(f);
}

void draw() {
  background(255);  
  fill(0,0,255);
  text(code,15,20);
}


// Function to load String for the sketch and return this String value
String loadPde(String sketchName) {
  String pde = "";
  /*--------------------------------------------------------*/
  // sketchPath gets the path to the Processing sketch folder
  // [dataPath() gets the path to the data folder]
  /*--------------------------------------------------------*/
  String[] lines = loadStrings(sketchPath(sketchName));
  for (int i=0;i<lines.length;i++){
    // here we add each new String from lines to our pde String
    pde+=lines[i]+"\n";
  }
  return pde;
}
