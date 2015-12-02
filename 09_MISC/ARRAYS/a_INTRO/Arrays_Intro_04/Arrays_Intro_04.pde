/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////
// Déclaration & attribution d'un tableau de couleurs
color[] MyColors = {
  #381C36, #7A4D24, #B89333, #A6C73C, #335E4D, #4CB8A4, #F2322A
};

int numCircles = 400;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size (640, 400); 
  background (255);
  noStroke();
  fill(255,0,0,150);
  smooth();
 //color c = somecolour(); //Notez ce qui se passe si on déclare cette variable en dehors de notre boucle.
  for (int i = 0;  i < numCircles; i++) {
    //On crée une variable de type color et on y attribue une valeur détérminé par notre fonction en bas.
    color c = somecolour();
    float dia = random(5,50);
    float xpos = random(dia, width-dia);
    float ypos = random(dia, height-dia);
    fill (c);
    ellipse(xpos, ypos, dia, dia);
  }
}


/////////////////////////// DRAW ////////////////////////////

void draw() {

}

/////////////////////////// FUNCTIONS ////////////////////////////

//Une fonction qui retourne une valeur.
//Cette valeur est une couleur choisie de manière aléatoire à partir de notre tableau de couleurs en haut.
color somecolour() {
  return MyColors[int(random(MyColors.length))];
  //RETURNS A VALUE TAKEN FROM OUR LIST OF COLORS DECALRED ABOVE.
}

