/*
NOISE TERRAIN BASED ON
JEAN-MICHEL GERIDAN'S
SKETCH

*/

float valeur;           //value
float echelle=0.05;     //noise scale
float moment=0;
float gs = 30;          //grid size

int subdiv = 30;        //divisions w and h
int n = subdiv*subdiv;  //array´s size
float []z = new float [n];


void setup() {
  size( 800, 600, P3D );
  noStroke();
}


void draw() {
  lights();
  background(255);
  moment+=.025;
  for (int y = 0; y < subdiv; y++) {
    for (int x = 0; x < subdiv; x++) {
      //noiseDetail(6,0.3);
      valeur = noise( ( -moment + x ) * echelle, (y) * echelle );
      z[x*10+y] = valeur*255;
      stroke(valeur*255);
      point(x, y);
    }
  }

  noStroke();
  pushMatrix();
  translate( width/2-(gs*subdiv/2), height, -400 );
  rotateX(HALF_PI);
  for (int i=0; i<subdiv-1; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j=0; j<subdiv; j++) {
      fill(((z[j * 10 + i]) *-1) + 160);
      vertex( i * gs, j*gs, z[j * 10 + i]*2 );
      vertex( (i * gs) + gs, (j*gs), z[(j*10+i)+1]*2 );
    }

    endShape();
  }

  popMatrix();
}


