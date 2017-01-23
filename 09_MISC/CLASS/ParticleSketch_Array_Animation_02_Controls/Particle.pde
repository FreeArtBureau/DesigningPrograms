class Particle
{
  PVector pos; // position
  PVector speed; // vitesse
  float d; // diamètre
  
  // Cosntructeur
  Particle(float x, float y)
  {
    pos = new PVector(x,y);
    speed = new PVector( random(-speedAmplitude,speedAmplitude), random(-speedAmplitude,speedAmplitude) );
    d = random(10)+2;
  }
  
  // Méthode move
  // A pour but de déplacer notre particule
  void move()
  {
    // Ajout de la vitesse à la position de la particule
    pos.add(speed);
  }

  // Méthode collision
  // A pour but tester les collisions de notre billes avec les
  // bordures de l'écran
  void collision()
  {
    if (pos.x - d/2 <= 0 || pos.x+d/2>=width)
      speed.x = -speed.x;
    if (pos.y - d/2 <= 0 || pos.y+d/2>=height)
      speed.y = -speed.y;
  }
  
  void draw()
  {
    ellipse(pos.x,pos.y,d,d);
  }
  
  void drawConnection(Particle other, float d)
  {
    stroke( map(d,0,70,50,255) );
    line(pos.x, pos.y, other.pos.x, other.pos.y);
  }
  
  float distance(Particle other)
  {
    return dist(pos.x, pos.y, other.pos.x, other.pos.y);
  }
  
}
