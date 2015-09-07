/*
PLEASE READ INFO
*/

/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;
import processing.pdf.*;
boolean PDFEXPORTING = false;

ControlP5 INTERFACES;
PImage[] glyphs; // images - Nous avons 26 images !

////////////////////////////////////////////// SETUP 

void setup() {  
  size(700, 600, JAVA2D);
  smooth();
  controlInit(); // on initialise notre interface
  glyphInit(); // on initialise nos glyphes

  ellipseMode(CENTER);
  background(255);
  noiseDetail(2, .5f);
}
////////////////////////////////////////////// DRAW

void draw() { 
  if (PDFEXPORTING) beginRecord(PDF, "Export_PDF_###.pdf");
  background(255);

  xCount += xSpeed;
  yCount += ySpeed;

  for (int y=0; y <= glyphs[INDEX].height-1; y++) {
    for (int x=0; x <= glyphs[INDEX].width-1; x++) {

      if (x%noiseRes == 0 && y%noiseRes == 0) {
        noiseVal = noise((x - xCount)*noiseScale, (y - yCount)*noiseScale, frameCount*noiseSpeed);

        float g = noiseVal*720.0f;
        theta = (-(g * PI))/180.0f;
        xv = cos(theta) * speed;
        yv = sin(theta) * speed;

        if (lines) {
          //c = somecolour();
          color pix = glyphs[INDEX].get(int(x), int (y));
          if ((pix >= color(0)) && (pix <= color(30))) {
            strokeWeight(0.3);
            stroke(0);

            if (NOISE_LENGTH) {
              float lineLen = noiseVal*0.0005;
              line (x - (xv/lineFX), y - (yv/lineFX), (x-lineLen)*0.9, (y-lineLen)*0.9);
            } else {
              //line (x - (xv/5), y - (yv/5), (x-lineLength)*0.9, (y-lineLength)*0.9);
              beginShape();
              vertex(x - (xv/lineFX), y - (yv/lineFX));
              vertex(x, y);
              endShape();
            }
          }
        }
      }
    }
  }
  //noiseCount += noiseSpeed;

  ///////////////////////////////////////////////////////////////////////////////
  // PDF EXPORTING (Appuyer sur la touche 'ALT' pour exporter une image en pdf)
  if (PDFEXPORTING) {
    endRecord();
    println("Exported !");
    PDFEXPORTING = false;
  }

  if (ANIMATE) {
    noiseSpeed = 0.001;
  } else {
    noiseSpeed = 0;
  }
}

