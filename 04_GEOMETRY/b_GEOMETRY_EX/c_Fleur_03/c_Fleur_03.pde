/*
LIGNES
Lire aussi : http://freeartbureau.org/esad_teaching/blog/2013/10/14/beyond-the-basics/
 
 */

/////////////////////////// GLOBALS ////////////////////////////

float len = 300;      // Déclarer une variable pour la longeur de notre ligne.
float angle;         //  Déclarer une variable pour l'angle de rotation.
float angleStep;
// On déclare une deuxième angle qui nous sert de valeur pour 
// varier les valeurs sin() et par la suite dont on sert pour
// aussi varier la longeur de nos lignes.
float angle2;
float noiseScale;
color[] maPallete = {
  #23989D, #D67923, #238FD6, #B2569B, #ABB256
};

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(500, 500);
  background(255);
  smooth();
  angle = radians(0);
  angle2 = radians(0);
  strokeWeight(0.7);
  frameRate(30); // fixer le nombre d'images/secondes
  angleStep = random(0.0100, 0.0550); 
  noiseScale = random(0.012, 0.099);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  color couleurs = choisirdesCouleurs();

  stroke(couleurs);
  len = abs(sin(angle2*0.12)) * 50; 
  // line(0, 0, len, len);

  float offSet = noise(len*noiseScale) * 400;
  line(0, 0, len+offSet/2, len+offSet/2);
  popMatrix();
  angle += angleStep;  
  angle2 += 0.5;

  if(angle >= radians(360)) {
  saveFrame("Fleur_###.png");
  setup(); 
   }
   
}

/////////////////////////// FUNCTIONS ////////////////////////////
color choisirdesCouleurs() {
  return maPallete[int(random(maPallete.length))];
}

