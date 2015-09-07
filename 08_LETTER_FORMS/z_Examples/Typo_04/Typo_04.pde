/*
  PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;
import processing.pdf.*;
boolean PDFEXPORTING = false;

ControlP5 INTERFACES;
PImage[] glyphs; // images - Nous avons 26 images !

/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(0);
  smooth();
  size(600, 600);
  glyphInit(); // on charge nos glyphes/lettres
  controlInit(); // on initialise notre interface
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if (PDFEXPORTING) beginRecord(PDF, "Export_PDF_###.pdf");

  background(0);
  noFill();
  rectMode(CENTER);
  strokeCap(SQUARE);
  trameH();
  if(TRAMEV_ACTIVE) {
  trameV();
  }

  // PDF EXPORTING (Appuyer sur la touche 'ALT' pour exporter une image en pdf)
  if (PDFEXPORTING) {
    endRecord();
    println("Exported !");
    PDFEXPORTING = false;
  }
}



