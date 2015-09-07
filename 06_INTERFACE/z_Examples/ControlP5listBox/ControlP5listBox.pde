/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
*/

/////////////////////////////// GLOBALS /////////////////////////////
import controlP5.*;
ControlP5 cp5;
ListBox l, l2;
// Choix de fontes :
int choix, choix2;

// LES FONTES
PFont font1, font2, font3;
int fonteCorps1 = 60; // Variable pour la taille de la fonte
int fonteCorps2 = 60; // Variable pour la taille de la fonte

int numFontes = 3; // Variable pour créer d'autres éléments dans la liste
String s = "TEXTE 1"; // TEXTE 1
String s2 = "TEXTE 2"; // TEXTE 2

/////////////////////////////// SETUP ///////////////////////////////
void setup() {
  size(700, 400);  

  // Besoin de charger dans la mémoire qu'une fois nos fontes
  // pas besoin de répéter ces lignes ;–)

  font1 = createFont("Arial-Black", fonteCorps1);
  font2 = createFont("Courier", fonteCorps1);
  font3 = createFont("GillSans", fonteCorps1);

  // On attribue notre premère fonte par défault à tous les textes
  textFont(font1, fonteCorps1);
  //textFont(font2, fonteCorps);
  // J'ai crée une fonction pour initialiser notre interface
  // Voir 2ième onglet >>> 
  INIT_INTERFACE();
}



void draw() {
  background(0);

  //****************************************************
  // TEXTE_01 :

  // ON RÉCUPÈRE LA VALEUR DE NOTRE LISTE 1 ( HEADLINE )
  float HeadLineFonte = cp5.get(ListBox.class, "HEADLINE").getValue();
  println("HEADLINE FONTE = " + HeadLineFonte);


  pushStyle(); // isoler les styles (pour ne pas intervenir sur l'autre texte  
  // EN FONCTION DE LA VALEUR ON CHANGE DE FONTE :
  if (HeadLineFonte == 0) {
    textFont(font1, fonteCorps1);
  }
  if (HeadLineFonte == 1) {
    textFont(font2, fonteCorps1);
  }
  if (HeadLineFonte == 2) {
    textFont(font3, fonteCorps1);
  }
  // On affiche le texte
  // Texte 1
  text(s, 100, 200, width, height);
  popStyle();


  //****************************************************
  // TEXTE_02 :
  
  // ON RÉCUPÈRE LA VALEUR DE NOTRE LISTE 2 ( BAND1 )
  float Band1Fonte = cp5.get(ListBox.class, "BAND1").getValue();
  println("BAND1 FONTE = " + Band1Fonte);
  pushStyle();

  // EN FONCTION DE LA VALEUR ON CHANGE DE FONTE :
  if (Band1Fonte == 0) {
    textFont(font1, fonteCorps2);
  }
  if (Band1Fonte == 1) {
    textFont(font2, fonteCorps2);
  }
  if (Band1Fonte == 2) {
    textFont(font3, fonteCorps2);
  }

  // Texte 2
  text(s2, 400, 200, width, height);
  popStyle();
///////////////////////////////////////////////////////////////// FIN

  // text(cp5.get(Textfield.class,"input").getText(), 20,20);
  //text(cp5.get(ListBox.class,"HEADLINE").getValue(), 20,20);
}





/////////////// FONCTION POUR ÉCRIRE DU TEXTE ;–)
void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (s.length() > 0) {
      s = s.substring(0, s.length()-1);
    }
  }
  else if (keyCode == DELETE) {
    s = "";
  } 
  else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    fill(255);
    s = s + key;
  }
}

