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
  data[0] = 60;	 // Attribue nos valeurs (Les 4 éléments).
  data[1] = 150;
  data[2] = 260;
  data[3] = 320;
    
  // .length stocke le nombre d'éléments dans notre tableau
  //  Ceci sera utile lorsqu'on se sert d'une boucle for.
  println(data.length);   
  
  //Souvent on se sert d'une boucle for avec les tableaux surtout lorsqu'il s'agit de tableaux avec beaucoup de valeurs.
  //On va faire exactement la même chose que dans l'exemple précédent à l'aide d'une boucle.
  
  for(int i=0; i<data.length; i++) {
   ellipse(data[i], 100,50,50); 
  }
  
}


/////////////////////////// DRAW ////////////////////////////

void draw() {

}

/////////////////////////// FUNCTIONS ////////////////////////////


