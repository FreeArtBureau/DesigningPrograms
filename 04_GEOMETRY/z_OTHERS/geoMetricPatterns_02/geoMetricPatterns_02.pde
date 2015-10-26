/*
Jerome Herr
 http://www.openprocessing.org/user/28663
 */


int num=9, movers=100, d3=100;
float angle, theta, d2;


void setup() {
  size(540, 540, P2D);
  background(0);
  noFill();
  smooth();
  //frameRate(12);
}

void draw() {
  background(0);
  noFill();
  translate(width/2, height/2);

  //rotate(frameCount*0.003);

  translate(-width/2, -height/2);
  for (int i=0; i<num; i++) {
    angle = TWO_PI/num*i;
    d2 = map(sin(theta), -1, 1, 45, 60);

    for (int j=0; j<movers; j++) {
      float offSet = TWO_PI/movers*j;

      float CmoverX = width/2+cos(theta+offSet)*d2*2;
      float CmoverY = height/2+sin(theta+offSet)*d2*2;

      float moverX = CmoverX + cos(angle)*d3;
      float moverY = CmoverY + sin(angle)*d3;
      
      float moverX2 = CmoverX + cos(angle)*d2;
      float moverY2 = CmoverY + sin(angle)*d2;

      stroke(#ffffff, 33);
      ellipse(moverX, moverY,1,1);
      ellipse(moverX2, moverY2, 1, 1);
    }
  }
  theta += TWO_PI/500;
}

