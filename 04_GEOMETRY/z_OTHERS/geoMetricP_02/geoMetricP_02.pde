/*
Jerome Herr
http://www.openprocessing.org/user/28663
*/

int num, movers=5, d=200, d2=300, frames=1500;
float angle, theta;
 
void setup() {
  size(1024, 768, JAVA2D);
  //smooth(5);
  stroke(255);
  num=3;
}
 
void draw() {
  background(0);
  strokeWeight(3);
  for (int i=0; i<num; i++) {
    float outerX = width/2 + cos(angle)*d;
    float outerY = height/2+sin(angle)*d;
    point(outerX, outerY);
    angle = TWO_PI/num*i;
    for (int j=0; j<movers; j++) {
      float offSet = TWO_PI/movers*j;
      float moverX = width/2+cos(theta+offSet)*d2;
      float moverY = height/2+sin(theta+offSet)*d2;
      line(outerX, outerY, moverX, moverY);
    }
  }
  theta += TWO_PI/frames;
   
  //if (frameCount<=(frames/movers)+1) saveFrame("image-###.gif");
}

void keyPressed(){
 if(key == '+') {
  num++;
 } 
 
  if(key == '-') {
  num--;
 }
}

