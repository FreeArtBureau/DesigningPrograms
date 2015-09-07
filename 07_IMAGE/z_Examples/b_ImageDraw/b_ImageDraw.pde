

/////////////////////////// GLOBALS ////////////////////////////

PImage img;
float angle;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(400,600);
  background(0);
  smooth();
  imageMode(CENTER);
  img = loadImage ("circles.jpg");
  angle = radians(0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

  if (mousePressed) {
    // En combinant sinus avec la fonction noise
    // on peut créer des variantes aléatoires plus organiques.
    // Ici on crée une variable qui va jouer sur l'amplitude
    float amp = noise(mouseX*0.003, mouseY*0.003) * 100;
    
    float randSize = sin(angle*0.1) * amp;
    
    image(img,mouseX,mouseY,randSize,randSize);  
  
    angle+=0.1;  
  }
}

