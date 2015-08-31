// Click and Drag class by :
// Daniel Shiffman 

///////////////////////////////////////////
class Draggable {
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?

  float x, y, w, h;          // Location and size
  float offsetX, offsetY; // Mouseclick offset


  ///////////////////////////////////////////
  Draggable(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    offsetX = 0;
    offsetY = 0;
  }

  ///////////////////////////////////////////
  // Method to display
  void display() {
    stroke(0);
    if (dragging) { 
      tint(255,0,0);
    } else if (rollover) {
      tint(0,0,255);
    } else {
      tint(255);
    }
    for (int i=0; i<myImages.length; i++) {
      image(myImages[i], x, y, w, h);
    }
  }

  // Is a point inside the rectangle (for click)?
  void clicked(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
      offsetX = x-mx;
      offsetY = y-my;
    }
  }

  // Is a point inside the rectangle (for rollover)
  void rollover(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      rollover = true;
    } else {
      rollover = false;
    }
  }

  // Stop dragging
  void stopDragging() {
    dragging = false;
  }

  // Drag the rectangle
  void drag(int mx, int my) {
    if (dragging) {
      x = mx + offsetX;
      y = my + offsetY;
    }
  }
}

