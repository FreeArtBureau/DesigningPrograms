import processing.pdf.*;

/*
 SKETCH : STRINGS & CHARS
 PLEASE READ INFO TAB
 
 */

////////////////////////// GLOBALS //////////////////////////////
// Importer la bibliothèque pour exporter en PDF
import processing.pdf.*;
boolean SAVEPDF = false;
// Importer la bibliothèque ControlP5
import controlP5.*;
//Declarer un objet de la classe controlP5
ControlP5 interfaces;
//ControlWindow cw;
Toggle nT, sT;

PFont font;
// Ici, nous avons une variable de type String qui va stocker notre texte
String joinedText;

float x, y;

// Variables pour notre fonction noise()
float noiseAmm = 0.004; // interagit directement sur l'échelle de la fonction noise()
float fonteSizeNoise = 100; // interagit directement sur la taille de notre fonte
float noiseSpeed = 0.007;
boolean noiseOn;

// Variables pour notre fonction sinus()
float  sinusAmm =  0.01;
float fonteSizeSinus = 1.0;
float sinusSpeed = 0.04;

////////////////////////// SETUP //////////////////////////////
void setup() {
  size(900, 560, P3D);
  background(243);
  noStroke();
  smooth();
  font = createFont("AnonymousPro-Bold", 100);

  // Charger le texte qui se trouve dans 'data'
  // c'est un fichier texte normal avec l'extension .txt
  String[] lines = loadStrings("type.txt");

  // Ensuite on doit récupérer le texte comme une longue chaîne de caractères,
  // c'est la fonction join qui permet ceci. On stocke le résultat dans notre var joinedText
  joinedText = join(lines, " ");

  controlInit();
}


void draw() { 
  background(243); 
  if(SAVEPDF) beginRecord(PDF, "PDF_Export_###.pdf");
  drawText();
  
  if(SAVEPDF) {
    SAVEPDF = !SAVEPDF;
    endRecord();
    println("FINITO !");
    
  }
}

////////////////////////// FUNCTIONS //////////////////////////////

// Voici notre fonction
void drawText() {
  fill(0, 0, 150, 150);
  textAlign(CENTER, CENTER);

  /////////////////////////////////////////// Affichage
  x = 60;
  y = 120;

  // On parcourt notre chaîne de caractères grâce à une boucle
  for (int i = 0; i < joinedText.length(); i++) {

    /////////////////////////////////////////// Fonction sinus & noise
    // Sinus (renvoie une valeur entre -1 > +1)
    float offs = frameCount * sinusSpeed + (x + y) * sinusAmm;
    float sinus = sin(offs) * 13 + 23 * fonteSizeSinus;
    
    // Noise (renvoie une valeur entre 0 > 1)
    float z = frameCount* noiseSpeed;
    float n = noise(x*noiseAmm, y*noiseAmm, z) * fonteSizeNoise;

    // Si nous avons appuyé sur 'noiseOn', on active la fonction noise
    if (noiseOn) {
      textFont(font, n);
    }
    // sinon, on active la fonction sin()
    else {
      textFont(font, sinus);
    }

    // On stocke chaque lettre récupérée dans une variable 'letters'
    char letters = joinedText.charAt(i);
    text(letters, x, y);

    // Nos conditions pour positionner nos signes
    if (x>=width-80) {
      x = 30;

      y+=45; // ici on augemente tout simlement par une constante
    }
    // What happens when we activate this line of code ?
    //x+= textWidth(joinedText.charAt(i));
    x+=17;
  }
}

void keyPressed() {
 if(key =='s')
 SAVEPDF = true; 
  
}











