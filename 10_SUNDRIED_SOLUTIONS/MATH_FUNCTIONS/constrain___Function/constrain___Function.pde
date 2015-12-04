/*
 * Constrain
 * Constrains values within a set range.

 * MW 3.11.15
 *
 * end 
 */
 
///////////////////// GLOBALS ////////////////////
float var = 8.4;
float minVar = 2.0;
float maxVar = 3.5;

///////////////////// SETUP ////////////////////
void setup() {
  background(150);
  smooth();
  float result = constrain(var,minVar,maxVar);
  println("The constrain value is = "+ var);
   println("The min value is = "+ minVar);
    println("The max value is = "+ maxVar);
     println("The result is = "+ result);
}


///////////////////// DRAW ////////////////////
void draw() {
}

