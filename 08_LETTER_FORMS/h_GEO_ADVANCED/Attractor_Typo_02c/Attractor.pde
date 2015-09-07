
//PAS GRANDE CHOSE À FAIRE ICI
//JOUER AVEC LES VALUERS DE RADIUS ET RAMP
////////////////////////// CLASS ATTRACTOR //////////////////////////////

class Attractor {
  float x, y;
  //Value of 1 or -1 : pos for attraction, neg for repulsion
  float radius = 50; // diamètre de la force
 

  //Va doucement, beaucoup de changement avec cette valeur
  float ramp = 0.1939;

  ////////////////////////// CONSTRUCTOR //////////////////////////////

  Attractor(float x, float y) {
    this.x = x;
    this.y = y;
  }


  ////////////////////////// FUNCTIONS //////////////////////////////


  void attract(Node theNode) {
    //First define the distance between the attractors x & y pos and the Node's x & y pos. 
    float dx = x - theNode.x ;
    float dy = y - theNode.y ;
    //Calculate the distance between the node and the attractor
    //We use mag() which calculated the magnitude (length) of a vector and returns a float value. 
    float d = mag(dx, dy);

    //define the force applied in line with this distance
    if (d > 0 && d < radius) {
      float s = pow(d / radius, 1 / ramp);
      float f = s * 9 * strength * (1 / (s + 1) + ((s - 3) / 4)) / d;
      //f = strength * f/radius; //Original calculation gave less aesthetic looks.

      // Apply this force to the p of our node
      theNode.p.x += dx * f;
      theNode.p.y += dy * f;
    }
  }
}


