/*
------------------------------------------------
Un sketch basé sur le travail réalisé par Sophie
et en collaboration avec Maxim
-----------------------------

Le principe est de dessiner des lignes en fonction du niveau sonore
d'une musique importée et jouée en temps réel.

*/

/////////////////////////// GLOBALS ////////////////////////////
import ddf.minim.*;    // Importer la bibliothèque Son (Minim)
float len;      // Déclarer une variable pour la longeur de notre ligne.
float angle;         //  Déclarer une variable pour l'angle de rotation.
 
// On déclare une deuxième angle qui nous sert de valeur pour 
// varier les valeurs sin() et par la suite dont on sert pour
// aussi varier la longeur de nos lignes.
float angle2;       

Minim minim; // Déclaration d'un objet minim
AudioPlayer son;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400, P2D);
  background(0);
  smooth();
  angle = radians(0);
  angle2 = radians(0);
  
  minim = new Minim(this); //créer un nouvel élément son 
  son = minim.loadFile("kids_beat.mp3", 512);//mp3,wav,aiff
  len = 15;
  stroke(255);
  strokeWeight(0.1);
  frameRate(30);
  
  son.play();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  
 float mix = son.mix.level() * 400; 
 
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  
  //len = abs(sin(angle2*0.05)) * mix;   
  len = abs(mix);   

  line(0, 0, len, len);
    
  float offSet = noise(len*0.05) * 100;
  //line(0, 0, len+offSet, len+offSet);
  
  
  popMatrix();

  angle += 0.007;  
  angle2 += 0.15;

  // Activez ces lignes en dessus si vous voulez  
  // simplement faire un tour complet puis s'arrêter.
  /*
  if(angle >= radians(360)) {
   noLoop(); 
   }
  */
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
 if(key == 's') saveFrame("monImage.png"); 
  
}



