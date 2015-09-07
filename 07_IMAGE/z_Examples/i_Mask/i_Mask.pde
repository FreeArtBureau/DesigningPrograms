PGraphics offscreen;  // le dessin hors-écran // the offscreen drawing
PImage flowers;     // original image
PImage mix;           // l'image finale // the final image

void setup() {

  size(500, 500, P2D);       // size of the sketch
  // créer une image dans laquelle on va dessiner / create an offscreen image to draw into
  offscreen = createGraphics(width, height, P2D);
  flowers = loadImage("flowers.jpg");
  // le mix final / the final mix    flowers -> mask -> final image
  mix = createImage(width, height, ARGB);
}

void draw() {
  background(0);
  // start drawing into offscreen image // commencer le dessin hors-écran
  offscreen.beginDraw(); 
  offscreen.background(0); // fond noir // black background in offscreen
  fill(255); // white / blanc 
  noStroke(); // no stroke on ellipse
  // draw ellipse into offscreen // dessiner ellipse hors-écran
  offscreen.ellipse(mouseX, mouseY, 150, 150);
  // fin du hors-écran
  offscreen.endDraw();

  // copy the original image // copier l'image orginale
  mix.copy(flowers, 0, 0, width, height, 0, 0, width, height);
  // apply offscreen (black&white) to mask image // appliquer masque à l'image originale
  mix.mask(offscreen);

  // afficher le résultat
  image(mix, 0, 0);
}

