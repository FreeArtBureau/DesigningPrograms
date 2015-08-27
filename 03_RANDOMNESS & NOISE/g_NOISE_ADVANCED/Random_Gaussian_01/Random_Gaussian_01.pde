// Daniel Shiffman
// The Nature of Code
// http://www.shiffman.net/

// Declare a Random number generator object
import java.util.*;
Random generator;

void setup() {
  size(400, 400);
  background(255);
  generator = new Random();   // Initialize generator
  smooth();
  noStroke();
}

void draw() {

  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
  float xloc = (float) generator.nextGaussian();
  float yloc = (float) generator.nextGaussian();
  float dia = (float) generator.nextGaussian();

  float sd = 25;                // Define a standard deviation
  float mean = 200;             // Define a mean value (middle of the screen along the x-axis)
  xloc = ( xloc * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean
  yloc = ( yloc * sd ) + mean;
  //dia =  ((xloc * sd) + mean) / ((yloc * sd) + mean); // Find the right calculation.

  fill(0,0,200);
  for(int i=0; i<=100; i++) {
  ellipse(xloc, yloc, 1, 1);   // Draw an ellipse at our "normal" random location
  }
  
}



