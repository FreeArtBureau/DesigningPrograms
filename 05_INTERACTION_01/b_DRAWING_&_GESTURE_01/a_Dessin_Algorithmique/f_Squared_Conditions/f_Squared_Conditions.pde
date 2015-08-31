///////////////////////////////////////
/*
THE SQUARED DRAWING 

*/
/////////////////////////// GLOBALS ////////////////////////////

int dir; 
float rectTaille; // Variable pour la taille de nos rectangles
float rectTailleMax; // Variable pour la taille maximale de nos rectangles

// Une liste/array de valeurs !
// Une liste est comme une variable sauf que nous pouvons stocker plusieurs valeurs
// Ici, on déclare une variable qui contient des valeurs colormétriques (en héxidécimale)
color[] maPallete = {#23989D, #D67923,#238FD6,#B2569B,#ABB256};

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noFill();
  stroke(255);
  rectMode(CENTER);
  dir = 1; // initialisation
  rectTailleMax = 80; // Initialisation
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

  if (mousePressed) {    
     strokeWeight(0.2);
    // Pour choisir des couleurs de notre palette d'en haut
    // on déclare une variable dans laquelle on stocke
    // les couleurs générés par notre petite fonction en bas   
    color couleurs = choisirdesCouleurs();
   
    stroke(couleurs);
    rect(mouseX, mouseY, rectTaille, rectTaille);
    
    // Si la taille de notre rectangle est égal à zero
    // la direction est positive.
    if (rectTaille == 0) {
      dir = 1;
    }
        
    // Si la taille de notre rectangle est supérieur où égal à la taille maximale ( définit dans setup() )
    // la direction est négative.    
    if (rectTaille >= rectTailleMax) {
      dir = -1;
    }
    
    // On réactualise la taille en ajoutant 7 à chaque fois et 
    // en multipliant soit par +1 soit -1 pour changer de direction.
    rectTaille += 10 * dir;    
  }
  
}

/////////////////////////// FUNCTIONS ////////////////////////////

// Fonction façile pour réinitialiser la taille à zero à chaque fois 
// que nous lâchons la souris. 
void mouseReleased() {
 rectTaille = 0;
}

// Fonction qui retourne une valeur (colormétrique)
// Ces couleurs se trouvent dans la palette en haut
// et qui sont choisis de manière aléatoires grâce à
// la fonction random()
color choisirdesCouleurs() {
return maPallete[int(random(maPallete.length))]; 
}
