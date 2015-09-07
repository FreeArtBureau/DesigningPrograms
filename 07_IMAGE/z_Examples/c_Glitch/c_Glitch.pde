
/////////////////////////// GLOBALS ////////////////////////////

PImage img;
boolean FreezeFrame = false;

byte[] data;
int num;

/////////////////////// SETUP ////////////////////////////

void setup() {
  size(960, 540, P2D);
  num = (int)random(129); 
  glitchImage();
  frameRate(15);
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  //On affiche l'image dans la fenêtre.
  image(img, 0, 0, width, height);

  //glitchImage(); // Si tu fais appel à cette fonction dans draw() nous avons un glitch animé ! ;–)

  //saveFrame("monimage_####.jpg");// Si vous voulez faire un export de vos image pour ensuite créer un petit film animé.
}

/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed() {
  if (key == 'g') {
    background(255);
    glitchImage();
  }

  if (key == 's') {
    saveFrame("myGlitch_###.png");
  }

  if (key == 'f') {
    FreezeFrame = !FreezeFrame;
    noLoop();
  } 
  else {
    loop();
  }

  if (key == 'r') {
    num = (int)random(129);
  }
}

////////////////////////////////////// //Glitch FUNCTION
void glitchImage() { 

  data=loadBytes("mona.jpeg");
  //  À l'aide d'une boucle on va récupérer cette liste de bytes de manière aléatoire
  //  et ensuite attribuer aussi une nouvelle position dans la liste [loc] de manière aléatoire
  for (int i=0;i<num;i++) { 
    int loc=(int)random(0, data.length);//guess at header being 128 bytes at most.. 
    data[loc]=(byte)random(5);
  }



  saveBytes("data/myimgedited2.jpg", data);
  //On recharge cette image sauvegardée dans data pour l'afficher dans draw() {}
  img = loadImage("myimgedited2.jpg");
}

