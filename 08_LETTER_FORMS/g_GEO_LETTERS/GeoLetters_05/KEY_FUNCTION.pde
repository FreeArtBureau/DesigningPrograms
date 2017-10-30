
///////////////////////////////// KEYS N' THINGS

void keyPressed() {
  if (key == 'f')
    STOPANIME = !STOPANIME;
  if (STOPANIME) {
    noLoop();
  } 
  else {
    loop();
  }

  if (key == 'q') {
    setup();
  }

  if (key == 's') {
    saveFrame("FrameSaved_###.png");
  }

  /////////////////////// PDF EXPORT

  if (key == 'r') {
    beginRecord(PDF, "EXPORT_###.pdf");
    println("Beginning PDF Export");
  }

  if (key == 'e') {
    endRecord();
    saveFrame("FrameSaved_###.png");
    println("PDF Export Finito !");
  }
}