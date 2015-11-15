/////////////////////////// FUNCTIONS ////////////////////////////

void trameH() {
  for (int xPos=125; xPos<width-100; xPos+=50) {
    for (int yPos=125; yPos<height-100; yPos+=75) {
      fill(0);
      stroke(0);
      strokeWeight(strokeW);
      pushMatrix();
      translate(xPos, yPos);
      rotate(angle);     
      line(-lineLn, -lineLn, lineLn, lineLn);
      popMatrix();
    }
  }
}

void trameV() {
  for (int xPos=125; xPos<width-100; xPos+=50) {
    for (int yPos=125; yPos<height-100; yPos+=75) {
      fill(0);
      stroke(0);
      strokeWeight(strokeW);
      pushMatrix();
      translate(xPos, yPos);
      rotate(HALF_PI);
      rotate(-angle);

      line(-lineLn, -lineLn, lineLn, lineLn);
      popMatrix();
    }
  }
}



///////////////// ///////////////// ///////////////// ///////////////// 
// Bang button updates
public void bangSave() {
    //This method calls a function (below) which enables
    // us to open a dialog window and save a file with a name
    selectOutput("Save a preset", "fileSelectedOut"); 
}
public void bangLoad() {
    //This method calls a function (below) which enables
    // us to open a dialog window and load a file
    // NB. files are saved in .ser file format (specific to ControlP5)
    selectInput("Load a preset", "fileSelected"); 
}


///////////////// ///////////////// ///////////////// ///////////////// 

// File Selection method for choosing saved presets
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    String s = selection.getAbsolutePath();
    interfaces.getProperties().load(s);
  }
}

// File saving method for saving presets
void fileSelectedOut(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    // println("User selected " + selection.getAbsolutePath());
    String s = selection.getAbsolutePath();
    output.println(interfaces.saveProperties((s)));
    output.flush(); // Write the remaining data
    output.close(); // Finish the file
  }
}

