class Ball {
  //GLOABAL VARIABLES
  float x, y;
  float vx = 5;
  float vy = 3.7;

  //CONSTRUCTOR
  Ball(float x, float y) {
    /*
   some programmers prefer to use the same of the field for the parameter.
   as you can't write 
   x = x
   you need to add this (which refers to the object)
   this.x = x
   in my opinion a transparent approach
   */
    this.x = x;
    this.y = y;
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
    if (x>width-20) {
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