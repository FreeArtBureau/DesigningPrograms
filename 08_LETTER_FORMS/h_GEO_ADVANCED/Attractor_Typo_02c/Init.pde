
//POUR INITIALISER NOS NOEUDS ET NOS ATTRACTORS

////////////////////////// INITIALISE & UPDATE SYSTEM //////////////////////////////

void initSystem() {
  background(0);
  // TAILLE DE LA FONTE ICI
  a = new RFont("Arial Bold.ttf", 280, LEFT);
  s = "pastel";
  
  // Nobmre de segments / points récupérés de notre forme
  RCommand.setSegmentLength(3);
  shp = a.toShape(s);
  myPoints = shp.getPoints();
  pnts = myPoints.length; 

  myAttractor = new Attractor[myPoints.length];
  myNodes = new Node[myPoints.length];

  pushMatrix();
  translate(transX, transY);
  for (int i=0; i<myPoints.length; i++) {    
    myAttractor[i] = new Attractor(myPoints[i].x, myPoints[i].y);
  }

  for (int i=0; i<myPoints.length; i++) {
    color myc = somecolour(); 

    myNodes[i] = new Node(myPoints[i].x, myPoints[i].y, color(myc, 73));
    myNodes[i].p.x = random(-nodeMov, nodeMov); 
    myNodes[i].p.y = random(-nodeMov, nodeMov); 
    myNodes[i].damping = damp;
  }
  popMatrix();
}

void updateSystem() {
 shp = a.toShape(s); 
  myPoints = shp.getPoints();

  myAttractor = new Attractor[myPoints.length];
  myNodes = new Node[myPoints.length];

 // pushMatrix();
//  translate(0, 40);
  for (int i=0; i<myPoints.length; i++) {    
    myAttractor[i] = new Attractor(myPoints[i].x, myPoints[i].y);
  }

  for (int i=0; i<myPoints.length; i++) {
    color myc = somecolour(); 
    myNodes[i] = new Node(myPoints[i].x, myPoints[i].y, color(myc,73));
    myNodes[i].p.x = random(-nodeMov, nodeMov);
    myNodes[i].p.y = random(-nodeMov, nodeMov); 
    myNodes[i].damping = damp;
  }
 // popMatrix(); 
}

//UTILISER CETTE FONCTION SI TU VEUX TE SERVIR DE LA LISTE DE COULEURS (DÉBUT DU SKETCH)
color somecolour() {
  return myColour[int(random(myColour.length))];
}
