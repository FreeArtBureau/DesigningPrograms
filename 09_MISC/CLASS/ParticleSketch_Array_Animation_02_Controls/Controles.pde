// Méthode qui est appelée lorsqu'un évènements (click souris, mouvement slider, etc...)
// se produit sur un des controles.
void controlEvent(ControlEvent theEvent) 
{
  switch(theEvent.controller().getId()) {
    case 1:
      isDrawParticles = ( theEvent.controller().getValue() == 1.0 );
    break;
    case 2:
      isDrawConnexions = ( theEvent.controller().getValue() == 1.0 );
    break;  
    case 3:
       speedAmplitude = theEvent.controller().getValue();
      for (int i=0;i<particles.length;i++)
        particles[i].speed.set( random(-speedAmplitude,speedAmplitude), random(-speedAmplitude,speedAmplitude), 0 );
    break;
  }
}