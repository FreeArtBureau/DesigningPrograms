///////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014 
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : COULEUR
 SKETCH : INTERACTIVE JOSEF ALBERS
 TYPE : DYNAMIQUE
 
 SUGGESTIONS :
 
 COLORER D'AUTRES IMAGES :
 >>> http://tinyurl.com/cgx43tg
 >>> www.albersfoundation.org
 
 */
///////////////////////////////////////

void setup() {
  size(400, 400);
  // Notez bien le mode 'HSB' - TSV en français 
  //https://fr.wikipedia.org/wiki/Teinte_Saturation_Valeur
  colorMode(HSB, 255, 100, 100); 
}

void draw() { 
  // Nous déclarons 2 variables et leurs donnent des valeurs.
  // la fonction map() nous permet d'appliquer une plage de valeurs
  // à une autre plage de valeurs.
  float bgCol = map(mouseX, 0, width, 0, 255); // position de la souris sur l'axe x donne des valeurs entre 0 et 255
  float fillCol = map(mouseY, 0, height, 0, 255); // position de la souris sur l'axe y donne des valeurs entre 0 et 255

  rectMode(CENTER);
  noStroke();
  //la couleur de fond dépend de la variable bgCol et donc la position de notre souris sur l'axe x
  background(bgCol, bgCol, bgCol);
  //la couleur de fond dépend de la variable fillCol et donc la position de notre souris sur l'axe y
  fill(fillCol, fillCol, fillCol);
  
  rect(200, 200, 200, 200); 
}

