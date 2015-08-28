///////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : COULEUR
 SKETCH : EXERCISE_01_COULEUR
 TYPE : STATIQUE
 
 SUGGESTIONS :
 
 
 */
///////////////////////////////////////

size(400, 500);
background(255);
smooth();

point(149,25);
point(151,30);
point(153,35);
point(155,40);

line(50,200,300,250);
strokeCap(SQUARE);
strokeWeight(10);
line(75,125,250,85);
strokeWeight(5);
line(100,100,225,70);
strokeWeight(2);
line(125,75,200,57);

noStroke();
fill(255,0,0);
ellipse(250,292,100,100);
fill(255);
ellipse(250,292,50,50);
fill(0);
ellipse(250,292,20,20);

stroke(0);
strokeWeight(1);
noFill();
ellipse(75,220,5,5);
ellipse(100,275,10,10);
ellipse(125,335,25,25);

strokeWeight(5);
fill(255,255,0);
ellipse(275,700,650,650);
fill(0,255,0);
ellipse(275,700,550,550);
fill(0,0,255);
ellipse(275,700,450,450);

strokeWeight(2);
quad(150,145,150,195,255,220,255,120);

rect(275,135,45,65);
rect(100,155,30,30);
