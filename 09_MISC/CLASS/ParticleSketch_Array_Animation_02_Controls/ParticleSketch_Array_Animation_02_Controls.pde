// Importation de la librairie
import controlP5.*;

// Déclaration du tableau de particules
Particle[] particles;

// Instance de la classe ControlP5
ControlP5 controlP5;
ControlWindow controlWindow;
boolean controlP5Window = true;

// Données associées à ces controles
boolean isDrawParticles = false;
boolean isDrawConnexions = true;
float speedAmplitude = 2.0;


void setup()
{
  size(400, 400);
  smooth();

  // Objet qui va gérer les controles
  controlP5 = new ControlP5(this);

  // Création des controles
  // toggle pour controler le dessin des particules
  Controller tgDrawParticles = controlP5.addToggle("Draw particles?", isDrawParticles, 10, 10, 10, 10);
  tgDrawParticles.setId(1);

  // toggle pour controler le dessin des connexions
  Controller tgDrawConnec = controlP5.addToggle("Draw connexions?", isDrawConnexions, 10, 40, 10, 10);
  tgDrawConnec.setId(2);

  // slider pour controler l'amplitude de la vitesse
  Controller sliderSpeed = controlP5.addSlider("Speed", 0, 10, speedAmplitude, 10,70,150,10);
  sliderSpeed.setId(3);


  // Fenêtre externe ? 
  if (controlP5Window)
  {
    controlP5.setAutoDraw(false);
    //controlWindow = controlP5.addControlWindow("Interface", 100, 100, 200, 200);
    //controlWindow.setBackground( color(0) );

    //tgDrawParticles.setWindow(controlWindow);
    //tgDrawConnec.setWindow(controlWindow);
    //sliderSpeed.setWindow(controlWindow);
  }

  // Création du tableau de particules
  particles  = new Particle[120];

  // Création des particules
  for (int i=0;i<120;i++) {
    particles[i] = new Particle(random(width), random(height));
  }
}

void draw()
{
  background(255);
//  filter(BLUR,1);

  fill(0);
  noStroke();
  for (int i=0;i<particles.length;i++) {
    particles[i].move();
    particles[i].collision();
    if (isDrawParticles)
      particles[i].draw();
  }

  if (isDrawConnexions)
  {
    stroke(128, 128);
    Particle pi, pj;
    float d;
    for (int i=0;i<particles.length;i++)
    {
      pi = particles[i];
      for (int j=i+1;j<particles.length;j++)
      {
        pj = particles[j];
        d = pi.distance(pj);
        if ( d <= 70) {
          pi.drawConnection(pj,d);
        }
      }
    }
  }
  
  controlP5.draw();
}