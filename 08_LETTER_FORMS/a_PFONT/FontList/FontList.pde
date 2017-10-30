
File selection;
ArrayList<String> theFontFiles;
int numFiles;

void setup() {
  theFontFiles = new ArrayList<String>();
  String path = "/Users/tisane/GIT/DesigningPrograms/08_LETTER_FORMS/a_PFONT/FontList/fonts";
  selection = new File(path);
  File[] files = selection.listFiles();
  //println(files);



  for(int i=0; i<files.length; i++){
    String s = files[i].getName();
    theFontFiles.add(s);
  }
  numFiles = theFontFiles.size();
  println("Number of font files = "+numFiles);
  for(String s: theFontFiles){
   println(s); 
  }
  
}


void draw() {
}