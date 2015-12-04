
//Création de class très simple.
class Particule {
  float x, y;


  Particule(float x, float y) {

    this.x = x;
    this.y = y;
  }

  void draw() {
    fill(255, 0, 0);
    ellipse(x, y, 10, 10);
  }
  
  /* 
  void move() {
   x+=noise(-10, 10);
   y+=random(-10, 10);
   }
   */
}

