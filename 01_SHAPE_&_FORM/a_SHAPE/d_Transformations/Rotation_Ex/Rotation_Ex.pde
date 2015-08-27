///////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014 
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : COULEUR
 SKETCH : ROTATION_EX
 TYPE : STATIQUE

 */
///////////////////////////////////////

size(200,200);
smooth();
rectMode(CENTER); // IMPORTANT

/*
pushMatrix() & popMatrix() permet d'isoler 
les transformations, sinon ils s'accumulent. 
*/

pushMatrix();
translate(100,100);
rotate(radians(45));
rect(0,0,100,100);
popMatrix();

// Activez ces instructions
/*
pushMatrix();
translate(100,100);
rotate(radians(15));
fill(0,0,255,150);
rect(0,0,100,100);
popMatrix();
*/
