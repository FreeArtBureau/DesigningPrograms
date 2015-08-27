///////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014 
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : COULEUR
 SKETCH : EXERCISE_04 RAND
 TYPE : STATIQUE
 
 SUGGESTIONS :

 CHOISIR UNE DES IMAGES DANS LE DOSSIER
 IMAGES ET LE RECREER AVEC PROCESSING
 
 */
///////////////////////////////////////

size(500,700);
background(255);
smooth();

noFill();
strokeWeight(20);
strokeCap(SQUARE);

stroke(#E51515); //RED
ellipse(290,200,110,110);
stroke(#26B212);//GREEN
ellipse(290,200,180,180);
stroke(#F4F51E);//YELLOW
ellipse(290,200,250,250);
stroke(#1C740F);
arc(290,200,180,180,0.47,2.20); 
//FIRST TWO PARAMS GIVE X,Y POS. WIDTH & HEIGHT. START & STOP RADIANS.

noStroke();
fill(#F4F51E);

//PUSH & POPMATRIX ARE USED TO ISOLATE TRANSLATIONS OF THE COORDINATE SYSTEM.
//THEY WORK EXACTLY AS PUSH & POPSTYLE

//BODY
pushMatrix();
translate(230,340);
rotate(0.3); //HERE WE ROTATE IN RADIANS (SEE THE UNIT CIRCLE FOR REFERENCE).
rect(0,0,25,310);
popMatrix();

//LEFT HAND
pushMatrix();
translate(250,360);
rotate(5.5);
rect(0,0,25,165);
popMatrix();

pushMatrix();
translate(335,427);
rotate(PI+HALF_PI);
rect(0,0,20,70);
popMatrix();

pushMatrix();
translate(320,415);
rotate(0.3);
rect(0,0,20,70);
popMatrix();

//RIGHT HAND
pushMatrix();
translate(210,330);
rotate(1.3);
rect(0,0,25,145);
popMatrix();

pushMatrix();
translate(145,360);
rotate(2.3);
rect(0,0,20,70);
popMatrix();

pushMatrix();
translate(130,350);
rotate(0.3);
rect(0,0,20,70);
popMatrix();

fill(#0E3F8B); //BLUE CIRCLES
ellipse(220,630,40,40);
ellipse(380,170,40,40);
ellipse(290,210,40,40);

fill(#26B212); //GREEN CIRCLES
ellipse(175,385,40,40);
fill(#1C740F);
ellipse(230,175,40,40);

fill(#E51515);//RED CIRCLE
ellipse(410,450,40,40);
