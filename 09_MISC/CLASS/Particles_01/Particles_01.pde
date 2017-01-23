/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

Particle[] particles;

int numParticles;
float MaxDist = 50; // Max distance between each particle
float velocity = 0.7; // Does what it says
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 430);
  background(217);
  smooth();
  numParticles = 100; // We have a hundred particles yeah !
  
  particles = new Particle[numParticles];
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle();
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(217);

  ////////////////// RENDER
  for (int i=0; i<particles.length; i++) {
    particles[i].render();
  }

  ////////////////// DRAW CONNECTIONS BASED ON MaxDist VALUE
  // Create 2 new particles for checking distances
  Particle a, b;
  float d;
  for (int i=0; i<particles.length; i++) {
    // Assign particle a to the current particle in arraylist
    a = particles[i];

    for (int j=i+1; j<particles.length; j++) {
      // Assign particle b to the next particle in arraylist
      // NB j = i + 1
      b = particles[j];  
      d = a.distance(b);
      if ( d <= MaxDist) {
        a.drawConnection(b, d);
      }
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

