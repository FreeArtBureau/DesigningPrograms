import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Parsing_Text extends PApplet {

/*

Parsing words from an external text file
*/


String[] theText;
PFont times;


public void setup() {

  
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

public void draw() {
  background(0);

  for (int i=0; i<theText.length; i++) {   //will repeat in a horizontal line
    String temp = theText[i]; //shift the data to a string, so we can find out how many characters there are

    if (i<=x.length) {

      text(theText[i], x[i], y[i]);  //pull the random positions out of the array.
    }
  }
}

public void loadTextfile() {
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

public void loadRandomNumbers() {
  for (int i=0; i<theText.length; i++) {
    x[i]=random(width);
    y[i]=random(height);
  }
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Parsing_Text" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
