/*
Jerome Herr
 http://www.openprocessing.org/user/28663
 */


int num=12, movers=100, d3=10, frames=300;
float angle, theta, d, d2;


void setup() {
  size(540, 540, P2D);

  noFill();
  smooth();
}

void draw() {
  randomSeed(1000);
  background(#202020);
  noFill();
  translate(width/2, height/2);

  rotate(frameCount*0.003);

  translate(-width/2, -height/2);
  for (int i=0; i<num; i++) {
    angle = TWO_PI/num*i;

    d = map(sin(theta+angle*5), -1, 1, 1, 100);

    // float outerX = width/2 + cos(angle)*d;
    // float outerY = height/2 + sin(angle)*d;

    float outerX = width/2 + cos(frameCount*0.05)*0.01;
    float outerY = height/2 + sin(frameCount*0.05)*0.01;

    float cx1 = width/2 + cos(angle)*d*4.8;
    float cy1 = height/2+sin(angle)*d*3.6;

    d2 = map(sin(theta), -1, 1, 0, 50);

    for (int j=0; j<movers; j++) {
      float offSet = TWO_PI/movers*j;

      float CmoverX = width/2+cos(theta+offSet)*d2*2;
      float CmoverY = height/2+sin(theta+offSet)*d2*2;

      float moverX = CmoverX + cos(angle)*d3*2;
      float moverY = CmoverY + sin(angle)*d3*2;

      float cx2 =  CmoverX + cos(angle)*d3;
      float cy2 = CmoverY + sin(angle)*d3;

      stroke(#ffffff, 33);
      bezier(outerX, outerY, cx1, cy1, cx2, cy2, moverX, moverY);
    }
  }
  theta += TWO_PI/frames;
}

