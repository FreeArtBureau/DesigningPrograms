
class Box {
  float x, y;
  int fSize;
  float speed;
  color c;
  float transp;
  //Create a timerMax
  int timer, timerMax;
  //Create a boolean to check our object's life.
  boolean death;
  float angle = 0;
  float angleSpeed;

  Box(float x, float y, int fSize, float speed) {
    this.x = x;
    this.y = y;
    this.fSize = fSize;
    this.speed = speed;
    transp = 0;
    c = (int)random(150);
    timer = 0;
    death = false;
    this.timerMax = 500;
    angleSpeed = random(0.01, 0.50);
  }

  void render() {
    noStroke();
    fill(c, transp);

    //**IMPORTANT
    //Transformations take effect on graphic objects and therefore
    ///need to be used within the function that draws our form.
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rect(0, 0, fSize, fSize);
    popMatrix();
  }

  void timer() {
    //Map timer to transparency values between 0 & 255 
    transp = map(timer, 0, timerMax, 255, 0);
    if (timer>=timerMax) {
      death = true;
    }
  }

  void move() {   
    angle+=0.3 * angleSpeed;
    y+=speed;
    timer+=1;
  }
}

