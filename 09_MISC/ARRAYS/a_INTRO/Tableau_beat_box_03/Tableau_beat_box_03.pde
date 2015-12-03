
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
    
    shape(shps[(int)random(shps.length)], 0, 0); 
    println(keyCode);
  }
}
   
 
 
 ///////////////////////// FUNCTIONS /////////////////////////////
 /*
 void keyPressed() {
 if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {

   for(int i = 0; i < shps.length; i++) { 
     keyCode = i;   
    
 
    shape(shps[(int)random(shps.length)], 0, 0); 
     
   //}
    
    println(keyCode);
  }
}
*/
