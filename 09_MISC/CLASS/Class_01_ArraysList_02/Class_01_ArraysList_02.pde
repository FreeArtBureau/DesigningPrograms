ArrayList ballCollection; 
//AN ARRAYLIST IS A DYNAMIC ARRAY IN WHICH WE CAN ADD AND SUBTRACT DATA
//AS OPPOSED TO A SIMPLE ARRAY IN WHICH WE DECLARE A CERTAIN NUMBER OF DATA.

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
}

void draw() {
 background(0);
 /*
  for(int i=0; i<myBall.length; i++) {
myBall[i].run(); 
  }
  */
  
  Ball myBall = new Ball(width/2,30);
  ballCollection.add(myBall);

  for(int i=0; i<ballCollection.size(); i++) {
  Ball mb = (Ball) ballCollection.get(i);
  mb.run();
  }
}
