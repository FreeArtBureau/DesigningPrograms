/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
*/

PImage source;       // Source image
PImage destination;  // Destination image

void settings(){
    source = loadImage("japaneselady.jpg");  
  // On va créer une nouvelle PImage vierge de la même taille que celle de source
  // 
  destination = createImage(source.width, source.height, RGB);
    size(source.width, source.height);
  
}

void setup() {


}

void draw() {  
  float threshold = map(mouseX, 0, width, 0, 255);

  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++ ) {
      int pos = x + y*source.width;
      
      // En fonction de la valeur 'threshold', nous attribuons 2 couleurs
      // aux pixels 'destination'
      if (brightness(source.pixels[pos]) > threshold) {
        destination.pixels[pos]  = color(255);  // White
      }  else {
        destination.pixels[pos]  = color(0);    // Black
      }
    }
  }

  // Mettre à jour l'image 'destination'
  destination.updatePixels();
  // Afficher l'image 'destination'
  image(destination,0,0);
}