
/////////////////////////// GLOBALS ////////////////////////////
PImage img; 
float angle;
int PixelSize; 
int pas;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  img = loadImage("japaneselady.jpg");  
      size(img.width, img.height, P3D);  // P3D est un mode spéciale qui permet une rendue en 3 dimensions
      noStroke();

      rectMode(CENTER);
      PixelSize = 10;
      angle = radians(0);  
      pas =  5;
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);  
  // On parcourt l'image grâce à une boucle
  for ( int x = 0; x < width; x+=pas) {
    for ( int y = 0; y < height; y+=pas) {

      /* Un peu de math
         Nous allons bouger les pixels de l'image grâce à notre fonction sinus
         et en fonction de la luminosité des pixels de l'image 
         Ces valeurs sont stockées dans la variable z
         qui est utilisé plus loin pour positionner nos rectangles/pixels sur l'axe z
         C'est cette variable qui joue sur la profondeur de l'image affichée.
         Notez que nous avons d'autres fonctions qui permettent de récupérer d'autres infos sur une image :
         saturation() / hue() / red() / green() / blue()
         Activez une de ces lignes pour visualiser les effets différents
         N'oubliez pas de désactiver les autres !
       */
      
      float z = sin(angle*0.05) *  brightness(img.get(x, y)) - 100.0;
      //float z = sin(angle*0.15) *  saturation(img.get(x, y)) - 100.0;
      //float z = sin(angle*0.15) *  hue(img.get(x, y)) - 100.0;
      //float z = sin(angle*0.15) *  blue(img.get(x, y)) - 100.0;

      // on récupère  la couleur du pixel en fonction des variables x & y
      int pixelColor = img.get(x, y);
      fill(pixelColor); // Rajoutez de la transparence fill(pixelColour, 50); par exemple.
   
      // On se sert de translate pour positionner nos rectangles/pixels
      pushMatrix();
      translate(x,y,z); // Notez bien l'axe z (profondeur)
      
        rect(0,0,PixelSize,PixelSize);
      //box(pas,pas,z); // Forme 3D
      popMatrix();
    }
  }
  // Utiliser la souris pour contrôler le mouvement
  //float angleStep = map(mouseX, 0, width, 0.01, 2.3);
  //angle+=angleStep;
  
  // mouvement auto
  angle+=0.4; 
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("img_###.png");
}


