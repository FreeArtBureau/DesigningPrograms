/*

 Une classe simple pour afficher des points
 et leur donner un movement cyclique
 */

class FontAgent {
  float x, y;
  float dia;
  float theta;
  float xMoveSpeed;


  FontAgent(float x, float y) {
    this.x = x; 
    this.y = y;
    dia = random(1, PART_SIZE_MAX);
    xMoveSpeed = random(-DISP_FACT, DISP_FACT);
    theta = radians(0);
  }

  // Méthode pour afficher la forme
  void render() {
    noStroke();
    fill(255, 150);
    ellipse(x, y, dia, dia);
  }  


  // différentes méthodes pour animer les points

  // Movement cyclique simple sur l'axe x
  // Notez bien que tous les points bougent
  // ensemble et de la même manière
  void animate1() { 

    float xMove = cos(theta)*1;    
    x = x + xMove;
    theta += 0.1;
  }

  // Movement cyclique simple sur l'axe x
  // mais avec un déplacement différent pour chaque point
  void animate2() {  

    float xMove = cos(theta)*1;
    x = x + (xMove * xMoveSpeed);
    theta += 0.1;
  }

  // Movement cyclique simple sur l'axe x
  // mais avec de l'interaction de la souris
  void animate3() {  

    float xOff = map(mouseX, 0, width, 0.1, 1.5); 
    float xMove = cos(theta)* xOff;
    x += (xMove * xMoveSpeed);

    float thetaOff = map(mouseY, 0, height, 0.05, 0.5); 
    theta += thetaOff;
  }
}

