/*
 SKETCH : STRINGS & CHARS
 PLEASE READ INFO TAB
 
 */

////////////////////////// GLOBALS //////////////////////////////
PFont font;
// Ici, nous avons une variable de type String qui va stocker notre texte
String joinedText;

float x, y;
float maxSize; // Taille max. de notre fonte
////////////////////////// SETUP //////////////////////////////
void setup() {
  size(900, 560);
  background(243);
  noStroke();
  smooth();
  font = createFont("AnonymousPro-Bold", 12);
  fill(0, 0, 150, 150);
  maxSize = 300; // taille max.
  
  // Charger le texte qui se trouve dans 'data'
  // c'est un fichier texte normal avec l'extension .txt
  String[] lines = loadStrings("type.txt");

  // Ensuite on doit récupérer le texte comme une longue chaîne de caractères,
  // c'est la fonction join qui permet ceci. On stocke le résultat dans notre var joinedText
  joinedText = join(lines, " ");
}


void draw() { 
  background(243); 
  // drawText() est une fonction que nous avons crée nous mêmes 
  // et qui permet d'encapsuler une partie spécifique de notre programme -
  // à savoir l'affichage et l'interaction de notre texte.
  drawText();
}

////////////////////////// FUNCTIONS //////////////////////////////

// Voici notre fonction
void drawText() {
  
  /////////////////////////////////////////// Attributs de la fonte
  
  // fontSize est une variable pour changer la taille de notre fonte en fonction
  // du déplacement de notre souris sur l'axe x
  float fontSize = map(mouseX, 0, width, 12, maxSize);
  
  // La fonction textFont déclare la fonte dont on a besoin plus sa taille
  textFont(font,fontSize);
  x = 60;
  y = 120;
  
    /////////////////////////////////////////// Affichage

  // On parcourt notre chaîne de caractères grâce à une boucle
  for (int i = 0; i < joinedText.length(); i++) {
    // On stocke chaque lettre récupérée dans une variable 'letters'
    char letters = joinedText.charAt(i);
    // Ensuite, on l'affiche avec la fonction text()
    text(letters, x, y);

    // Nos conditions pour positionner nos signes
    if (x>=width-80) {
      x = 30;
      // float a = textAscent(); // méthode pour récupérer la distance de la lettre en hauteur de sa baseLine
      // y+=a;
      y+=45; // ici on augemente tout simlement par une constante
      
    }
    //x+= textWidth(joinedText.charAt(i));
    x+=17;
  }
}


















