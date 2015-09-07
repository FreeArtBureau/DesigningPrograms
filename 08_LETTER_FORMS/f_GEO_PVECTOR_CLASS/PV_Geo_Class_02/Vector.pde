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

  // Notre constructeur permet d'initialiser notre objet > instance d'une classe
  // http://www.commentcamarche.net/contents/553-java-constructeurs
  FontAgent(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(-0.1, 0.1);
    dia = 1.0;

  }

  // Méthode pour dessiner la forme
  void render() {
    fill(255,255,23, 53);
    noStroke(); 
    
   ellipse(loc.x, loc.y, dia, dia);
   // stroke(255,3);

     // line(loc.x+50, loc.y, loc.x, loc.y+50);

  }

  // Méthode pour bouger la forme
  // grâce à notre vecteur vélocité.
  void update() {
    loc.add(vel);
  }

  // des méthodes pour intervenir sur nos formes
  // et créer des animations différentes
  void animate1() {
    offX = frameCount * (loc.x + loc.y);
    loc.x += sin(offX)*0.5;
  }
  
   void animate2() {
    offX = noise(loc.x*frameCount*0.5, loc.y*frameCount*0.5)*30;
    loc.x += cos(offX)*0.02;// + offX;
    loc.x -= cos(frameRate)*0.5;// + offX;
    loc.y += sin(frameRate*100)*0.9;// + offX;
  }
  
    void animate3() {
    offX = noise(loc.x*frameCount*0.5, loc.y*frameCount*0.5)*30;
    loc.y += cos(offX)*0.02;// + offX;
    loc.y -= cos(frameRate)*0.5;// + offX;
    loc.x += sin(frameRate*90)*0.19;// + offX;
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

