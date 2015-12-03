
 //////////////////////////// GLOBALS //////////////////////////////
 
 PShape[] shps;
 //////////////////////////// SETUP ////////////////////////////////
 
 void setup() {
   size(1200, 800);
   background(255);
   smooth();
   shps = new PShape[45];
   for(int i = 0; i < shps.length; i++) {
    shps[i] = loadShape("shp_"+nf(i,3) + ".svg"); 
     
   }
   
 }
 
 ////////////////////////// DRAW ///////////////////////////////////

void draw() {
  background(255);
  randomSeed(10000);
  if(keyPressed) {
    int i = keyShape();
    if(i<49 && i>=0) {
    shape(shps[i], 0, 0); 
    println(key);
    }
  }
}
   

 ///////////////////////// FUNCTIONS /////////////////////////////

 int keyShape() {
   int k = key;
   return k-100; 
 } 
