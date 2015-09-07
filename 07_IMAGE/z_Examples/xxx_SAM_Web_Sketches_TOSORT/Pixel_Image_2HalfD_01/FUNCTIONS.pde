/////////////////////////// FUNCTIONS ////////////////////////////

// KEYS
void keyPressed() {
  if (key == 's') {
    save("normal_###.png");
    SaveHiRes(3);
    exit();
  }
}

// HI_RES OUTPUT - Note that the program exits once this operation has finished. Wait for export !
void SaveHiRes(int scaleFactor) {
  translate(width, height, 0);
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, P3D);
  beginRaw(hires);
  hires.scale(scaleFactor);
  draw();  
  endRaw();
  hires.save("hires_###.png");
}

void GIFJuicer() {
  
  
}
