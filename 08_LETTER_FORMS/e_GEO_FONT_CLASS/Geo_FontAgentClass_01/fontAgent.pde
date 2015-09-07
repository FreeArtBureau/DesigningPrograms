/*

 Une classe simple pour afficher des points
 */

class FontAgent {

  float x, y;
  float dia;

  FontAgent(float x, float y) {
    this.x = x;
    this.y = y;
    dia = 15;
  } 


  void render() {
    noFill();
    stroke(255, 150);
    ellipse(x, y, dia, dia);
    noStroke();
    fill(255);
    ellipse(x, y, dia/5, dia/5);
  }
}

