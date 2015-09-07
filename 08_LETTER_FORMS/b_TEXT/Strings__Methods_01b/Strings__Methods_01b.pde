/*
INIT
 
 */

/////////////////////////// GLOBALS ////////////////////////////
String texte1 = "data is magic";
String[] adj = {
  "great", "BIG", "everywhere", "you", "me", "private", "open", "Oogled", "mmm", "whatever", "NOT..."
};
String RNDWordLast;
PFont f;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(660, 300);
  background(255);
  smooth();
  noStroke();
  fill(0, 0, 255);
  f = createFont("AnonymousPro-Bold", 53);
  textFont(f);
  RNDWordLast = "magic";
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  text(texte1, 50, 100);
  
   text("Press s key", 50,200);
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {

  if (key == 's') { // shuffle adjectives
    String RNDWord = getRNDWord();
    // Note that here we are only replacing the String RNDWordLast
    // which is defined in setup as being the word 'magic'
    // Our text1 is therefore updated at this part of the sentence
    texte1 = texte1.replaceAll(RNDWordLast, RNDWord );
    RNDWordLast = RNDWord; // Don't forget to updtae our last word !
  }
}

// Small function for choosing random words from an array
String getRNDWord() {
  String RND;
  RND = adj[(int)random(adj.length)];
  return RND;
}

