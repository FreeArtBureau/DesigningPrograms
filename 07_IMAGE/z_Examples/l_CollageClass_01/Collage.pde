//////////////////////// CLASS

class Collage extends PImage {
  PImage[] imgs;
  float x, y;
  float angle, angle2;
  float mRand;


  Collage(float _x, float _y, boolean rotate) {
    this.x=_x;
    this.y=_y;
    if (rotate) {
      angle = random(radians(360));
      angle2 = random(radians(360));
    } else {
      angle = 0;
      angle2 = 0;
    }
    mRand = random(0.001, 5.0);
    //mRand = 1.0;
    imgs = new PImage[(int)random(5)];// random number

    for (int i = 0; i < imgs.length; ++i) {
      imgs[i] = loadImage("unit_"+nf(i, 3)+".png");
      imgs[i].resize(imgs[i].width/2, imgs[i].height/2);
    }
  }


  void display() {

    pushMatrix();
    translate(x, y);
    rotate(angle);

    for (int i = 0; i < imgs.length; ++i) {
      image(imgs[i], 0, 0);
    }
    popMatrix();
  }

  void move(float _fact) {
    x+=(cos(angle2)*_fact);
    y+=(sin(angle2)*_fact);
  }

  void move2() {
    x+=(cos(angle2)*mRand);
    y+=(sin(angle2)*mRand);
  }
  
  void move3() {
    float n = noise(x*0.001, y*0.001)*133;
    x+=(cos(n)*mRand);
    y+=(sin(n)*mRand);
  }
}

