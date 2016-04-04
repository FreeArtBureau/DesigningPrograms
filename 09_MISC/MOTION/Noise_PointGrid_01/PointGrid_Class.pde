/*
 * General purpose class fro drawing a grid of points
 * Use with PeasyCam
 *
 */

class PointGrid {

  //DATA
  // Our vertices are stored in a PVector
  PVector[][] VERTICES;

  // Just some variables to store offset coordinates for x, y, z
  float GRID_X_OFFSET = 0;
  float GRID_Y_OFFSET = 0;
  float GRID_Z_OFFSET = 0;
  float ZN;

  // Variables for grid cell sizes (rows & columns)
  int ROW_SIZE;
  int COLUMN_SIZE;
  int NUM;
  int TRANSX, TRANSY;

  /*
   * Constructor
   * @param : number of rows, number of columns, resolution
   */
  PointGrid(int _ROW, int _COL, int _NUM) {
    this.ROW_SIZE = _ROW;
    this.COLUMN_SIZE = _COL;
    this.NUM = _NUM;

    VERTICES = new PVector[NUM][NUM];
    for (int j=0; j<VERTICES.length; j++) {
      for (int i=0; i<VERTICES.length; i++) {
        VERTICES[i][j] = new PVector(i * ROW_SIZE, j * COLUMN_SIZE, GRID_Z_OFFSET);
      }
    }
    // Calculate translations to center grid
    TRANSX = -width/2-(ROW_SIZE*NUM/2)+ROW_SIZE/2;
    TRANSY = -height/2-(COLUMN_SIZE*NUM/2)+COLUMN_SIZE/2;
  }


  void render(boolean NOISE_SHIT) {

    pushMatrix();
    translate(TRANSX, TRANSY, 0);
    stroke(255);
    strokeWeight(3);
    noFill();

    for (int j=0; j<VERTICES.length-1; j++) {
        for (int i=0; i<VERTICES.length; i++) {

        if(NOISE_SHIT) {  
        // Noise Shit : Look further into what is happening here. It's a smooth nois algo ;–)
        float noiseTurbo = map(mouseX, 0, width, 0.0009, 0.027);
        float noiseAmm = map(mouseY, 0, height, 1, 150);
        
        //float noiseScaler = 0.001; //if this number gets smaller the circles will look more similar in size
        float ang = frameCount * 0.00333; //if this number gets bigger the movement will be more nervous... play around!
        float rad = width/2;
        
        float nx = (VERTICES[i][j].x + cos(ang) * rad) * noiseTurbo;
        float ny = (VERTICES[i][j].y + sin(ang) * rad) * noiseTurbo;
        ZN = noise(nx, ny) * noiseAmm;

        }

        // Draw vertices as points...
        point(VERTICES[i][j].x, VERTICES[i][j].y, ZN);
      }
    }
    popMatrix();
  }
}

