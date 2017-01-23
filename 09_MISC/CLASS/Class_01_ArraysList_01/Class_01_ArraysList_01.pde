ArrayList ballCollection; 
//Ball[] myBall = new Ball[10];

void setup() {
  size(600,400);
  smooth();
  /*
  for(int i=0; i<myBall.length; i++) {
    float x = random(width);
    float y = random(height);
  myBall[i] = new Ball(x,y);
  }
  */
  ballCollection = new ArrayList();
  
  for(int i=0; i<100; i++) {
  Ball myBall = new Ball(random(width),random(height));
  ballCollection.add(myBall);
  }
}

void draw() {
 background(0);
 /*
  for(int i=0; i<myBall.length; i++) {
myBall[i].run(); 
  }
  */
  for(int i=0; i<100; i++) {
  Ball myBall = (Ball) ballCollection.get(i);
  myBall.run();
  }
}
