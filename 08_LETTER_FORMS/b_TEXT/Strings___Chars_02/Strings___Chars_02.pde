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
void setup() {
  size(900, 560);
  background(243);
  noStroke();
  smooth();
  frameRate(12);
  font = createFont("AnonymousPro-Bold", 12);
  fill(0, 0, 150, 150);
  maxSize = 300; // taille max.

  // Charger le texte qui se trouve dans 'data'
  // c'est un fichier texte normal avec l'extension .txt
  String[] lines = loadStrings("type.txt");

  // Ensuite on doit récupérer le texte comme une longue chaîne de caractères,
  // c'est la fonction join qui permet ceci. On stocke le résultat dans notre var joinedText
  joinedText = join(lines, " ");
  index = 0;
  x = 60;
  y = 120;
}


void draw() {
  //background(243);

  drawTextByLetter();
}


////////////////////////// FUNCTIONS //////////////////////////////

// Voici notre fonction
void drawTextByLetter() {

  float fontSize = map(mouseX, 0, width, 12, maxSize);

  // La fonction textFont déclare la fonte dont on a besoin plus sa taille
  textFont(font, fontSize);

  /////////////////////////////////////////// Affichage
  // Pour afficher chaque lettre, on incrémente l'index
  // en utilisant la fonction charAt(index) et on augemente
  // l'index. Sa position est x (qui incrémente aussi)
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

void mousePressed() {
 setup();
}
