import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.opengl.*; 
import peasy.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Noise_PointGrid_01 extends PApplet {

/*
 :::::::::::::::::
 MOTION ALGORITHMS 
 :::::::::::::::::
 Sketch : POINTGRID_01
 
 Smooth noise algo_00 implemented
 NB 29.01.2016
 NOTES :
 */
 
/////////////////////////// GLOBALS ////////////////////////////


PeasyCam CAM;
PointGrid PG;
/////////////////////////// SETUP ///////////////////////////  /

public void setup() {
  size(800, 500, OPENGL);
  background(0);
  smooth();
  PG = new PointGrid(14,8,50);
  CAM = new PeasyCam(this,500);
}


/////////////////////////// DRAW ////////////////////////////

public void draw() {
  background(0);
  translate(width/2, height/2);

  PG.render(true);

println("fps : "+frameRate);
}
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


  public void render(boolean NOISE_SHIT) {

    pushMatrix();
    translate(TRANSX, TRANSY, 0);
    stroke(255);
    strokeWeight(3);
    noFill();

    for (int j=0; j<VERTICES.length-1; j++) {
        for (int i=0; i<VERTICES.length; i++) {

        if(NOISE_SHIT) {  
        // Noise Shit : Look further into what is happening here. It's a smooth nois algo ;\u2013)
        float noiseTurbo = map(mouseX, 0, width, 0.0009f, 0.027f);
        float noiseAmm = map(mouseY, 0, height, 1, 150);
        
        //float noiseScaler = 0.001; //if this number gets smaller the circles will look more similar in size
        float ang = frameCount * 0.00333f; //if this number gets bigger the movement will be more nervous... play around!
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

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#030303", "--hide-stop", "Noise_PointGrid_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
