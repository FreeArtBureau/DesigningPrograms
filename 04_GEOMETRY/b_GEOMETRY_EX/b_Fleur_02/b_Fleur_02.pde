/*
LIGNES
Lire aussi : http://freeartbureau.org/esad_teaching/blog/2013/10/14/beyond-the-basics/
 
 */

/////////////////////////// GLOBALS ////////////////////////////

float len = 300;      // Déclarer une variable pour la longeur de notre ligne.
float angle;         //  Déclarer une variable pour l'angle de rotation.
 
// On déclare une deuxième angle qui nous sert de valeur pour 
// varier les valeurs sin() et par la suite dont on sert pour
// aussi varier la longeur de nos lignes.
float angle2;       

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(500, 500);
  background(255);
  smooth();
  angle = radians(0);
  angle2 = radians(0);
  
  stroke(0);
  strokeWeight(0.3);
  frameRate(30);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  
  len = abs(sin(angle2*0.12)) * 150; 
  
  line(0, 0, len, len);
  
  /*
  float offSet = noise(len*0.05) * 100;
  line(0, 0, len+offSet, len+offSet);
  */
  
  popMatrix();

  angle += 0.0350;  
  angle2 += 0.5;

  // Activez ces lignes en dessus si vous voulez  
  // simplement faire un tour complet puis s'arrêter.
  /*
  if(angle >= radians(360)) {
   noLoop(); 
   }
  */
}

/////////////////////////// FUNCTIONS ////////////////////////////

