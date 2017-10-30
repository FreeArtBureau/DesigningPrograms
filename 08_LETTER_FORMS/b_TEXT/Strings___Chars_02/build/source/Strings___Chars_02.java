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

public class Strings___Chars_02 extends PApplet {

/*
 SKETCH : STRINGS & CHARS
 PLEASE READ INFO TAB

 */

////////////////////////// GLOBALS //////////////////////////////
PFont font;
// Ici, nous avons une variable de type String qui va stocker notre texte
String joinedText;
int index;
float x, y;
float maxSize; // Taille max. de notre fonte
////////////////////////// SETUP //////////////////////////////
public void setup() {
  
  background(243);
  noStroke();
  
  frameRate(12);
  font = createFont("AnonymousPro-Bold", 12);
  fill(0, 0, 150, 150);
  maxSize = 300; // taille max.

  // Charger le texte qui se trouve dans 'data'
  // c'est un fichier texte normal avec l'extension .txt
  String[] lines = loadStrings("type.txt");

  // Ensuite on doit r\u00e9cup\u00e9rer le texte comme une longue cha\u00eene de caract\u00e8res,
  // c'est la fonction join qui permet ceci. On stocke le r\u00e9sultat dans notre var joinedText
  joinedText = join(lines, " ");
  index = 0;
  x = 60;
  y = 120;
}


public void draw() {
  //background(243);

  drawTextByLetter();
}


////////////////////////// FUNCTIONS //////////////////////////////

// Voici notre fonction
public void drawTextByLetter() {

  float fontSize = map(mouseX, 0, width, 12, maxSize);

  // La fonction textFont d\u00e9clare la fonte dont on a besoin plus sa taille
  textFont(font, fontSize);

  /////////////////////////////////////////// Affichage
  // Pour afficher chaque lettre, on incr\u00e9mente l'index
  // en utilisant la fonction charAt(index) et on augemente
  // l'index. Sa position est x (qui incr\u00e9mente aussi)
  if (index < joinedText.length()) {
    text(joinedText.charAt(index), x, y);

    index++;
       x+=17;
      //x+= textWidth(joinedText.charAt(index-1));
  }
  if (index == joinedText.length()) {
    index = joinedText.length()-1;
  }

  // Nos conditions pour positionner nos signes
  if (x>=width-80) {
    x = 30;
    y+=45; // ici on augemente tout simlement par une constante
  }
}

public void mousePressed() {
 setup();
}
/*
///////////////////////////////////////////////
- - - - - - - - STRINGS & CHARS - - - - - - - - 
///////////////////////////////////////////////
//////////////////
Workshop METZ 2014
//////////////////

 Title   :   STRINGS & CHARS
 Date    :   21/01/2014 
 Version :   v0.1.0
 

 COMMENTS :

 REF String Methods : 
 http://www.processing.org/reference/String.html
 http://docs.oracle.com/javase/6/docs/api/java/lang/String.html
 
 SUGGESTIONS :
 How can we interact with this text other than with the mouse ?
 Perhaps using the camera to test distance from media or how
 about using sound? 


//////////////////////////////////////////////

*/
  public void settings() {  size(900, 560);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Strings___Chars_02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
