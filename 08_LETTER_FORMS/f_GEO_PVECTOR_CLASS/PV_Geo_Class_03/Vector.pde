class FontAgent {

  // PVector est une classe propre à Processing
  // qui contient des informations pour la position
  // éventuellement la vélocité > vecteur vitesse
  // http://fr.wikipedia.org/wiki/Vitesse#Vecteur-vitesse
  PVector loc;
  PVector vel;
  float offX;
  float xMove;
  float dia;
  float trans;

  // Notre constructeur permet d'initialiser notre objet > instance d'une classe
  // http://www.commentcamarche.net/contents/553-java-constructeurs
  FontAgent(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(-0.1, 0.1);
    dia = 2.0;
    trans = 33;
  }

  // Méthode pour dessiner la forme
  void render() {
    fill(120,255,60, trans);
    noStroke(); 
    ellipse(loc.x, loc.y, dia, dia);
  }

  // Méthode pour bouger la forme
  // grâce à notre vecteur vélocité.
  void update() {
    //loc.add(vel);
    trans-=0.5;
    dia -= 0.05;
  }

  // des méthodes pour intervenir sur nos formes
  // et créer des animations différentes
  void animate1() {
    offX = frameCount * (loc.x + loc.y);
    loc.x += sin(offX)*0.5;
  }

  void animate2() {
    offX = frameCount * (loc.x + loc.y);
    dia+= noise(offX*0.05) * 0.05;
    loc.x += noise(offX)*0.5;
  }

  void animate3() {
    offX = noise(frameCount+(loc.x*0.05), frameCount+(loc.y*0.05)) * 30.05;
    //dia+= sin(offX*0.003) * 0.5;
//    dia-=0.05;
    loc.x += cos(offX)*0.5;
    loc.y += sin(offX)*0.5;
  }


  ////////////////////////////////////////////////
  /*   
   void check() {
   if(loc.x > width) {
   loc.x = 0;
   } 
   if(loc.x < 0) {
   loc.x = width;
   } 
   
   if(loc.y > height) {
   loc.y = 0;
   } 
   if(loc.y < 0) {
   loc.y = height;
   } 
   }
   */
}

