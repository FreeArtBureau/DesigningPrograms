class Particle {

  // Les vecteurs sont un moyen plus souple pour créer des systèmes 
  // qui simulent de la physique - movement/collision/...
  PVector loc; // position des particules
  PVector vel; // velocité/vitesse des particules (rate of change of position)
  PVector acc; // accéleration (rate of change of velocity)

  float drag = 0.470; // accélération - utilser des petites valeurs

  // couleur des particules
  color c;
  float particleSize;
  float shrink; // rétrécissement des particules
  int opacity;
  float fade;

  // constructor : this is a special function that is
  // called whenever a Particle is instantiated.
  Particle(PVector p) {
    loc = p.get();

    // La vélocité reste à zero car maintenant c'est l'accélération
    // qui détermine la position de nos particules 
    vel = new PVector(0, 0);    
    acc = new PVector(random(-drag, drag),random(-drag, drag));
    
    // Utiliser ces valeurs si vous voulez garder le même comportement que votre premier sketch     
    //acc = new PVector(random(1,3),random(-drag, drag));   


    c = color(255);
    particleSize = random(0.1, 5); 
    shrink = 0.93;
    opacity = 215;
    // fondu, pour que la traînée disparaisse
    // plus le nombre est petit plus la traînée disparaît lentement
    fade = 1.96;
  }


  // J'ai écrit cette méthode qui réunit tous les autres méthodes ci-dessus
  // On a donc une seule méthode à appeler dans la partie draw() de notre programme 
  void drawParticles() {
    // Les 2 méthodes 
    render();
    update();
  }


  // J'ai écrit une méthode pour afficher la forme. 
  // C'est plus clair dans la lecture. 
  void render() {
    if (opacity>0) {
      fill(c, opacity);
      ellipse(loc.x, loc.y, particleSize, particleSize);
    }
  }

  // La méthode update gère tous les changements des variables
  void update() { 
    // On ajoute d'abord l'accélération à la vélocité
    vel.add(acc);
    acc.limit(1); // limiter l'accélération car elle est accumulative
    loc.add(vel); // ajouter la vélocité à la position
   

    // rétrécissement des particules petit à petit
    particleSize*= shrink;
    opacity*=fade;
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

void addParticles(PVector _p) {
  // ajout de 15 particules dans le tableau lors de chaque boucle :
  for (int i=0; i<15; i++) {
    // adding a new particle into the array
    pickles = (Particle[]) append(pickles, new Particle(_p));
  }
}


void limitParticles() {

  // while we have more than the max number of particles...
  // Ceci permet de limiter notre liste de particules.
  while (pickles.length>maxParticles) {
    // take the oldest of the front of the array
    pickles = (Particle[]) subset(pickles, 1);
  }
  // DEBUG
  //println(pickles.length);
}



