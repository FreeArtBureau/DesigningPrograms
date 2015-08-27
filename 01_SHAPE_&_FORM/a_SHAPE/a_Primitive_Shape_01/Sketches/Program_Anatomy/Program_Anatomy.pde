
// Ceci est un commentaire. Il n'est pas pris en compte à l'exécution du programme.
// Les commentaires sont délimités par des marques 
// tel que // pour une seule ligne, /*...*/ pour plusieurs lignes.

/*
 PROGRAM ANATOMY / ANATOMIE D'UN PROGRAMME 
 
 LIRE CET ARTICLE
 Notions courantes : 
 http://fr.wikipedia.org/wiki/Langage_de_programmation
 
 LIRE PLUS SUR LE JARGON
 Terminologie informatique en général : 
 http://fr.wikipedia.org/wiki/Terminologie_informatique
 
*/

///////////////////////////////////////////////// Fin de commentaires

float dia; // Déclaration d'une variable globale.


// Bloque de code setup() { ... }
void setup() { 

  size(400, 400); // Ceci est une ligne de commande ou une instruction.
  smooth();
  fill(0,0,255);
  noStroke();
  dia = 0; // L'affectation d'une valeur de départ à notre variable.

}


// Bloque de code draw() { ... }
void draw() {

  background(0);
  // Notez que notre fonction ellipse contient des valeurs constantes & la variable 'dia'.
  // Les valeurs ajoutées dans une fonction sont leurs 'arguments' ou 'paramètres'.
  // Il existe des fonctions qui ne prennent pas d'arguments, Ex. noStroke(); noFill();
  // Chaque valeur correspond donc à un argument/paramètre spécifique.
  
  // Voir le référence : https://processing.org/reference/ellipse_.html
  // ellipse(a,b,c,d);
  
  // l'argument a est égale à la position de notre ellipse sur l'axe x en pixels
  // l'argument b est égale à la position de notre ellipse sur l'axe y en pixels
  // l'argument c est égale à la largeur de notre ellipse en pixels
  // l'argument a est égale à la hauteur de notre ellipse en pixels
  ellipse(200, 200, dia, dia);
  
  
  // les commentaires sont souvent utilisés pour désavctiver une instruction.
  // Activez cette ligne et voir ce qu'il se passe.
  //ellipse(dia, dia, 50, 50);  
  
  dia = dia + 0.1; // Mise-à-jour de la variable.
  
}


// Bloque de code fonction { ... }
void keyReleased() {
  
  if (key == 's' || key == 'S') { // Une structure conditionnelle.
    saveFrame("img_###.png");
  
  }
}

