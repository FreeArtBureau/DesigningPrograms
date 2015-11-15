/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////

int[] data = new int[4]; // Déclare & crée notre tableau pour 4 éléments

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size (400, 200); 
  background (255);
  noStroke();
  fill(255,0,0);
  smooth();
  // Attribue nos valeurs (Les 4 éléments).
  data[0] = 60;	 
  data[1] = 150;
  data[2] = 260;
  data[3] = 320;
  
  println(data[2]); // On peut accéder à une valeur en indiquant sa position dans le tableau
                  // Ici à la position [2], c'est la valeur 260.
  
  // On peut se servir de ce tableau de valeurs pour dessiner une forme
  // Les coordonnées sur l'axe x reçoivent ces valeurs.
  ellipse(data[0], 100, 50,50);
    ellipse(data[1], 100, 50,50);
      ellipse(data[2], 100, 50,50);
        ellipse(data[3], 100, 50,50);
        
  // .length stocke le nombre d'éléments dans notre tableau
  //  Ceci sera utile lorsqu'on se sert d'une boucle for (voir l'exemple ARRAY_INTRO_02). 
  println(data.length);         
}


/////////////////////////// DRAW ////////////////////////////

void draw() {

}

/////////////////////////// FUNCTIONS ////////////////////////////


