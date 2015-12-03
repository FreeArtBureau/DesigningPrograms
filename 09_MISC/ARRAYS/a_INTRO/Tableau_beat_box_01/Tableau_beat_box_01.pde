
 //////////////////////////// GLOBALS //////////////////////////////
 
 PShape[] shps;
 //////////////////////////// SETUP ////////////////////////////////
 
 void setup() {
   size(1200, 800);
   background(255);
   smooth();
   shps = new PShape[45];
   for(int i = 0; i < shps.length; i++) {
    shps[i] = loadShape("shp_"+nf(i,3) + ".svg"); 
     
   }
   
 }
 
 ////////////////////////// DRAW ///////////////////////////////////

void draw() {
  background(255);
  if(keyPressed) {
 
   ///////NATURALS////////
   
      if(key == '&') {
    shape(shps[0],0,0);
  }
   
         if(key == 'é') {
    shape(shps[1],0,0);
  }
   
           if(key == '"') {
    shape(shps[2],0,0);
  } 
   
   
          if(key == '‘') {
    shape(shps[3],0,0);
  }
  
         if(key == '(') {
    shape(shps[4],0,0);
  }
  
         if(key == '§') {
    shape(shps[5],0,0);
  }
  
         if(key == 'è') {
    shape(shps[6],0,0);
  }
  
         if(key == '!') {
     shape(shps[7],0,0);
  }
  
         if(key == 'ç') {
    shape(shps[8],0,0);
  }
   /////////ALL BEATS//////////
   
    if(key == 'a') {
    shape(shps[9],0,0);
  }
   
  if(key == 'z') {
    shape(shps[10],0,0);
  }
  
   if(key == 'e') {
     shape(shps[11],0,0);
  }
  
    if(key == 'r') {
     shape(shps[12],0,0);
  }
  
    if(key == 't') {
     shape(shps[13],0,0);
  }
  
     if(key == 'y') {
     shape(shps[14],0,0);
  }
  
   if(key == 'u') {
     shape(shps[15],0,0);
  }
  
   if(key == 'i') {
     shape(shps[16],0,0);
  }
  
   if(key == 'o') {
     shape(shps[17],0,0);
  }
  
   if(key == 'p') {
     shape(shps[18],0,0);
  }
  
    if(key == '^') {
     shape(shps[19],0,0);
  }
  
  
    if(key == '$') {
     shape(shps[20],0,0);
  }
 
 
  /////////ALL SNARES//////////
  
      if(key == 'q') {
     shape(shps[21],0,0);
  }
  
      if(key == 's') {
     shape(shps[22],0,0);
  }
  
      if(key == 'd') {
     shape(shps[23],0,0);
  }
  
      if(key == 'f') {
     shape(shps[24],0,0);
  }
  
      if(key == 'g') {
     shape(shps[25],0,0);
  }
  
      if(key == 'h') {
     shape(shps[26],0,0);
  }
  
      if(key == 'j') {
     shape(shps[27],0,0);
  }
  
      if(key == 'k') {
     shape(shps[28],0,0);
  }
  
      if(key == 'l') {
     shape(shps[29],0,0);
  }
  
      if(key == 'm') {
     shape(shps[30],0,0);
  }
  
      if(key == 'ù') {
      shape(shps[31],0,0);
  }
  
      if(key == '`') {
     shape(shps[32],0,0);
  }
  
  /////////ALL HATS//////////
  
      if(key == '<') {
     shape(shps[33],0,0);
  }
  
        if(key == 'w') {
     shape(shps[34],0,0);
  }
  
        if(key == 'x') {
     shape(shps[35],0,0);
  }
  
        if(key == 'c') {
     shape(shps[36],0,0);
  }
  
        if(key == 'v') {
     shape(shps[37],0,0);
  }
  
        if(key == 'b') {
     shape(shps[38],0,0);
  }
  
        if(key == 'n') {
      shape(shps[39],0,0);
  }
  
        if(key == ',') {
     shape(shps[40],0,0);
  }
  
        if(key == ';') {
  shape(shps[41],0,0);
  }
  
        if(key == ':') {
     shape(shps[42],0,0);
  }
  
        if(key == '=') {
  shape(shps[43],0,0);
  }
  
  
       
  
}
}
   
 
 
 ///////////////////////// FUNCTIONS /////////////////////////////
 
 

   void keyPressed() {
   if (key == CODED) {
    if (keyCode == SHIFT) {
  shape(shps[44],0,0);
  }}}

