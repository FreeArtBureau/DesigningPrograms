//Building Blocks 2011
//Processing Functions
/*
Constrain
Constrains values within a set range.
If val<min returs min
if val>max returns max
else returns val
constrain(val,min,max );
 */

///////////////////// GLOBALS ////////////////////
float var = 8.4;
float minVar = 2.0;
float maxVar = 5.5;

///////////////////// SETUP ////////////////////
void setup() {
  size(300, 200);
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

