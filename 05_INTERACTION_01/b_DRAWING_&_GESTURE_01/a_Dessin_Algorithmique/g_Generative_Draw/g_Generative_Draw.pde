///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 1.0
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 INTERACTION_01 : 
 SKETCH : GENERATIVE_DRAW
 PARENT SKETCH : NONE
 TYPE : DYNAMIQUE
 
 Draws connected lines
 */

/////////////////////////// GLOBALS //////////////////////////// 
// Ceux sont des listes vides (des listes peuvent stocker plusieurs 
// valeurs comme variables. Ici, il s'agit des valeurs pour stocker
// les coordonnées x & y
FloatList x, y;

float thresh = 15;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(255);
  stroke(0, 50);
  smooth();
  // initialiser les listes
  x = new FloatList();
  y = new FloatList();
}

/////////////////////////// SETUP ////////////////////////////

void draw() {
  if (mousePressed) {
    // le mot clé 'append' permet d'ajouter la valeur entre parenthèses
    // à notre liste vide. Donc à chaque fois qu'on appuie avec la souris
    // on ajoute la coordonné correspondante...ensuite...
    x.append(mouseX); 
    y.append(mouseY);


    // ici, on se sert de nos valeurs qui se trouvent en mémoire 
    // dans notre liste pour dessiner nos lignes
    for (int i=0; i<x.size (); i++) {

      float xTemp = x.get(i);
      float yTemp = y.get(i);
      float d = dist(xTemp, yTemp, mouseX, mouseY);
      
      float dice = random(0, 1);
      if ((d < thresh) && dice<0.01) {  
        line(xTemp, yTemp, mouseX, mouseY);
      }
    }
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}


// Quelques méthodes pour effacer le contenu de notre liste
// et afficher le nombre d'éléments (c'est-à-dire le nombre de
// coordonnées sauvegardées dans la liste comme variable
void keyPressed() {

  if (key == 'c') {
  x.clear();
  y.clear();
  background(255);
  }

  if (key == 'a') {
    int s = x.size();
    println("Array size = "+s);
  }
}

