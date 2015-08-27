//Theo Calvin (theo at mediumlite dot com)
/*
MY COLOR SCHEMES : 
NATURAL
 #381C36, #7A4D24, #B89333, #A6C73C, #335E4D, #4CB8A4, #F2322A
TEMPLE OF FLAMINGO
#1D7561, #FC8448, #FF4138, #A8282B, #38141B, #E827B1, #BF36FF
BLUE
#31515C, #F5EBE1, #A69B8D, #261B17, #0D0D0D, #584359, #4CB8A4
SAFARI
#942A23, #ED7418, #FFAC14, #FFE05E, #BBC400, #FF790D, #E83F00
*/
import processing.pdf.*;
import java.util.*;
float y = 0; 
color[] MyColors = {
 #381C36, #7A4D24, #B89333, #A6C73C, #335E4D, #4CB8A4, #F2322A
};

void setup() {
  size(700, 800);
  beginRecord(PDF, timestamp()+".pdf");
  println("recording started");
  background(255);
  smooth();
  strokeWeight(0.16);
  noFill();
}

void draw() {
  beginShape(); 
  for (int i=0; i<width; i+=25) {
    color c = somecolour();
    stroke(c);
    curveVertex(i, y+noisePosY(i, y));
  }
  endShape();

  if (y > height-550) { 
    println("recording stopped");
    endRecord();
    noLoop();
  } 
  else {
    y+=0.7;
  }
}

float noisePosY (float _x, float _y) {
  return noise(_x/width*2, _y/height*2) * 773;
}

//PICK SOME RANDOM COLOUR ROUTINE/FUNCTION
color somecolour() {
  return MyColors[int(random(MyColors.length))];
  //RETURNS A VALUE TAKEN FROM OUR LIST OF COLORS DECALRED ABOVE.
}

// TIMESTAMP (GENERATIVE GESTALTUNG).
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

