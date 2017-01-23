class Ball {
  //GLOABAL VARIABLES
  float x, y;
  float vx = 5;
  float vy = 3.7;

  //CONSTRUCTOR
  Ball(float xPos, float yPos) {
    x=xPos;
    y=yPos;
  }

  //FUNCTIONS
  void run() {
    //display
    display();
    //move
    move();
    //bounce
    bounce();
    //gravity
    gravity();
  } 

//CONSTRUCTION OF OUR FUNCTIONS
  void display() {
    ellipse(x, y, 20, 20);
  }

  void move() {
    x+=vx; 
    y+=vy;
  }

  void bounce() {
    if (x<0) {
      //vx = vx * -1 (THIS MAKES ANY VALUE NEGATIVE).
      vx*=-1;
    }
    if (x>width) {
       vx*=-1;
    }
    if (y<0) {
     vy*=-1;
    }
    if (y>height) {
      vy*=-1;
    }
  }
  
  void gravity() {
   vy+=0.3; 
  }
}

