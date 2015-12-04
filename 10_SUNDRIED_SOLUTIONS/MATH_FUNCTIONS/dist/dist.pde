/////////////////////////// GLOBALS ////////////////////////////
// On crée une variable pour la distance minimum.
float distMin = 60;

/////////////////////////// SETUP ////////////////////////////
Particule[] mesParticules = new Particule[70];

void setup() {
  size(400, 400);
  background(0);
  smooth();
  for (int i=0; i<mesParticules.length; i++) {
    float xPos = random(width);
    float yPos = random(height);
    mesParticules[i] = new Particule(xPos, yPos);
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  for (int i=0; i<mesParticules.length; i++) {
    mesParticules[i].draw();
   // mesParticules[i].move();
    //On parcours également le prochain particule
    for (int j=i+1;j<mesParticules.length;j++) {
      //On crée une variable sui calcule la distance entre le dernier et le prochain particule dessiné
      float drawLines = dist( mesParticules[i].x, mesParticules[i].y, mesParticules[j].x, mesParticules[j].y);
      //On teste pour voir si cette distance est moins ou égale à notre variable distmin.
      if (drawLines <= distMin) {
        //Si oui, on dessine une ligne entre les deux. 
        pushStyle();
        stroke(255);
        strokeWeight(0.5);

        line( mesParticules[i].x, mesParticules[i].y, mesParticules[j].x, mesParticules[j].y);
        popStyle();
      }
    }
  }
}



/////////////////////////// FUNCTIONS ////////////////////////////

