
// RIEN à FAIRE ICI
//CLASSE POUR DESSINER ET AFFICHER LES NOEUDS
////////////////////////// CLASS NODE //////////////////////////////

class Node extends PVector {
  PVector p = new PVector();
  float damping;
  color c;


  ////////////////////////// CONSTRUCTOR //////////////////////////////
//NB WE PUT COLOUR FIELD IN CONSTRUCTOR SO THAT EACH NODE INITIALISED
//HAS ITS OWN UNIQUE COLOUR THAT DOES NOT CHANGE THROUGHOUT THE ANIMATION.
  Node(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }


  ////////////////////////// FUNCTIONS //////////////////////////////


  void draw() {      
    stroke(c); 
    strokeWeight(0.9);
    point(x, y);

  }
  void update() {
    float angle = noise(x/noiseScale, y/noiseScale) * noiseStrength;
    x += sin(angle) + p.x;
    y += cos(angle) + p.y;

    //The greater the value of damping the slower the p & the quicker our node stops.
    p.x *= (1 - damping);
    p.y *= (1 - damping);
  } 

}

