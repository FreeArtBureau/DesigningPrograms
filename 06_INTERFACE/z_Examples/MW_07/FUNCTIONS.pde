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
    INTERFACE.getProperties().load(s);
  }
}

// File saving method for saving presets
void fileSelectedOut(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    // println("User selected " + selection.getAbsolutePath());
    String s = selection.getAbsolutePath();
    output.println(INTERFACE.saveProperties((s)));
    output.flush(); // Write the remaining data
    output.close(); // Finish the file
  }
}
