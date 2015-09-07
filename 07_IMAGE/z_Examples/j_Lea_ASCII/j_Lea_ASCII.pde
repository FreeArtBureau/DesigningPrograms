/*
Original code written by Christopher Webb
http://www.openprocessing.org/user/6341


*/
char[] chars ={'█','█','▓','▒','░','#','≡','%','$','@','&', '€','*'};
String loadPath = "Light_02.jpg";
PImage img;
int devisions = 10;
int margins = 30;
PFont font;
float xDiv;
float yDiv;
 
void setup(){
  img = loadImage("japaneselady.jpg");
  size(img.width,img.height);
  font = createFont("ArialMT-10",12);
  xDiv = img.width/devisions;
  yDiv = img.height/devisions;
  println(xDiv);
}
 
void draw(){
  background(255);
  textFont(font,devisions+3);
  
  for(int i = margins; i < height-margins; i+= devisions){
    for(int j = margins; j < width-margins; j+= devisions){
      color pix = img.get(int(j),int(i));
      fill(pix);
      textAlign(CENTER);
      //gets char depending on brightness
      float value = brightness(pix);
      char charac = chars[int(value/25.5)];
      text(charac,j,i);
    }
  }
}
 
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      devisions++;
    } else if (keyCode == DOWN) {
      devisions--;
    }
  }
  constrain(devisions,1,99);
}

