/*
FACE_FONT
Developed from an idea & some code by Douglas Edric Stanley

IDÉES :
- Changer de police
- Changer l'Image
- Changer les caractères affichés
- Explorez le code / Mettez des commentaires
- Comment pourriez-vous faire évoluer ce sketch/programme ?

*/
/////////////////////////// GLOBALS ////////////////////////////
PFont font;
PImage img;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(510, 500);
  background(255);
  smooth();
  noStroke();
  font = createFont("helvetica",15);
  img = loadImage("t_only.jpg");
  //image(img,0,0);

  for(int x=0; x<img.width; x+=5) {
    for(int y=0; y<img.height; y+=5) {
      
       color c = img.get(x,y);
       fill(c);
       
       textFont(font,random(1,10));     
       text((char)random(65,67),x,y);
    }
  }

}

/////////////////////////// DRAW ////////////////////////////
void draw() {


}

/////////////////////////// FUNCTIONS ////////////////////////////
