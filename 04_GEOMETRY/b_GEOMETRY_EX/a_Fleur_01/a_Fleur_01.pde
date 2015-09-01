/*
Fleur_01
Lire aussi : http://freeartbureau.org/esad_teaching/blog/2013/10/14/beyond-the-basics/
*/

/////////////////////////// GLOBALS ////////////////////////////

float len; // Déclarer une variable pour la longeur de notre ligne.
float angle; // Déclarer une variable pour l'angle de rotation.

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(255);
  smooth();
  
  angle = radians(0); // On initialise la variable
  strokeWeight(0.3); // on pourrait jouer sur l'épaisseur du trait
  frameRate(12); // frameRate = la mise à jour de draw en frames/seconde
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  // on a besoin de pushMatrix & popMatrix pour isoler les transformations
  // à savoir translate et rotate.
  pushMatrix();  
  // translate pour mettre le point d'origine au centre
  translate(width/2, height/2); 
  // le changement de l'angle nous permet de faire pivoter notre ligne
  rotate(angle);
  stroke(0);
  
  // On calcule la valeur len grâce à une valeur aléatoire >> entre 50 et 150
  len = random(50, 150);
  
  // On dessine notre ligne à partir du milieu (notre point d'origine qui est égal à 0,0)
  // Donc x1, y1 = 0;
  // et on va terminer avec (x2, y2) qui est calculé par rapport à notre variable len (length)
  
  line(0, 0, len, len); // line(x1, y1, x2, y2)
  popMatrix();

  angle += 0.05; // On met à jour l'angle. Notes que si tu augmentes cette valeur, tu augmente le pas et l'écartement entre chaque ligne.
}

/////////////////////////// FUNCTIONS ////////////////////////////

