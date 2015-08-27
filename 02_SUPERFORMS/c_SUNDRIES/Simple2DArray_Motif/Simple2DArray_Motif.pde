/*
SIMPLE PATTERN GENERATOR
USING A 2D ARRAY
 
 */

/////////////////////////// GLOBALS ////////////////////////////
int cellSize = 20;
int colums, rows;
int[][] maze;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noStroke();
  colums = width/cellSize;
  rows = height/cellSize;
  maze = new int[colums][rows];
  initMaze();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////
void initMaze() {
  background(0);
  for (int i=2; i<colums-2; i++) {
    for (int j=2; j<rows-2; j++) {
        if (int(random(2)) == 0) {
        rect( i*cellSize, j*cellSize, cellSize, cellSize);
      }
    }
  }
}

void mousePressed() {
  initMaze();
}

