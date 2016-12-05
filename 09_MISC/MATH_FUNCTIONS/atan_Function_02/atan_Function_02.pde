/*
SIMPLE EXAMPLE OF HOW THE FUNCTION ATAN
IS USED TO KEEP AN OBJECT FOLLOWING A 
CERTAIN DIRECTION. IN THIS CASE IT IS
THE MOUSE MOVEMENT THE OBJECT FOLLOWS.

*/

	
void draw() {
  background(204);
  translate(width/2, height/2);
  float a = atan2(mouseY-height/2, mouseX-width/2);
  rotate(a);
  //rect(-12, -5, 24, 10);
  //Draw Arrow
  line(-12,12,12,12);
  line(12,12,12-10,12-10);
  //line(10,-60,12,12);

}
