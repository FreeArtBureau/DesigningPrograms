/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(660, 260);
  background(0);
  smooth();
  noFill();
  /*
  CASTING / Conversion d'un type de donnée en un autre
  random() renvoie des valeurs de type flottant. Si on
  veut des nombres entier on a besoin de convertir les
  valeurs. Pour ce faire on met la fonction entre int(...);
  Elle convertit donc les nombres flottants en nombres entiers
  !!  MAIS en convertant ces nombres, elle les arrondit toujours
  à l'unité endessus. Donc 99.9999 est arrondi à 9 !
  */
  float floatRandom = random(10, 100);
  int intRandom = int(floatRandom); // CASTING !
  
  fill(0,255,255);
  textSize(36);
  text("Random float = "+ floatRandom, 30, 100);
  text("Random int = "+ intRandom, 30, 145);
  
  textSize(12);
  text("Press any key to randomize !",30, 170);

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
 
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
 setup(); 
}
