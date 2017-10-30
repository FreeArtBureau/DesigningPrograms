/*

Parsing words from an external text file
*/


String[] theText;
PFont times;


void setup() {

  size(800, 600);
  times = createFont("Fira-sans", 11);
  textFont(times);
  //textMode(SCREEN);   //to apply transformations to text, use the default mode
  theText = new String[0];
  loadTextfile();
  // Make sure our x & y floats have the same number elements as our text
  x = new float[theText.length];
  y = new float[theText.length];
  loadRandomNumbers();

  println(x.length);
  noLoop();
}

void draw() {
  background(0);

  for (int i=0; i<theText.length; i++) {   //will repeat in a horizontal line
    String temp = theText[i]; //shift the data to a string, so we can find out how many characters there are

    if (i<=x.length) {

      text(theText[i], x[i], y[i]);  //pull the random positions out of the array.
    }
  }
}

void loadTextfile() {
  String[] lines;
  lines = loadStrings("tweets.txt");
  println("there are " + lines.length + " lines");
  for (int i=0; i < lines.length; i++) {
    String[] words=splitTokens(lines[i]);
    println("line #" + i + " has " + words.length + " words.");
    for (int j=0; j < words.length; j++) {
      theText = (String[])append(theText, (words[j]));
    }
  }
  println("there are " + theText.length + " words");
}

void loadRandomNumbers() {
  for (int i=0; i<theText.length; i++) {
    x[i]=random(width);
    y[i]=random(height);
  }
}
