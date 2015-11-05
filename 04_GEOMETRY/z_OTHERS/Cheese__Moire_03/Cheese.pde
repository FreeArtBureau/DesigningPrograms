/**
 * 
 * Cheese Class
 * MW 23.10.2015
 * 
 *
 * REF : 
 *
 */


class Cheese {
  float x, y;
  int numSlices;
  float edge_gap;
  float dia;
  int hue;
  boolean rotate;
  boolean ANIME = false; // global var for setting animation
  float rotationRefine;


  // @params: x & y postions, number of cheese slices, diameter size, rotate, angle refine
  Cheese(float _x, float _y, int _numSlices, float _gap, float _dia, boolean _rotate, float _refine) {
    this.x = _x;
    this.y = _y;
    this.numSlices = _numSlices;
    this.dia = _dia;
    this.rotate = _rotate;
    this.rotationRefine = _refine;
    this.edge_gap = _gap;
    //hue = (int)random(360);

  }


  void draw() {
    cheese();
  }  

  /////////////////////////////////////////
  void cheese() {

    noStroke();
    //int h = frameCount%360;
    //fill(hue, 100, 100);
    //hue = h;
    fill(0, 0, 100);

    float cheeseSlices = TWO_PI/numSlices;
    float refineLines = edge_gap; 
    float yAnime;
    
    if (ANIME) {
      yAnime = map(sin(frameCount*rotationRefine), -1, 1, 0, 35);
    } else {
      yAnime = 0.0;
    }
    
    for (int i=0; i<numSlices; i++) {
      pushMatrix();
      translate(x, y);
      
      if (rotate == true) { 
        rotate(frameCount*rotationRefine);
      }
      rotate(i*cheeseSlices);
      arc(0, yAnime, dia/refineLines, dia, (PI*2.5)-(cheeseSlices/2), (PI*2.5)+(cheeseSlices/2));
      popMatrix();
    }
  }

  void animate_01(int _diaMax) {
    dia = abs(sin(frameCount*0.01)*_diaMax);
  }

}

