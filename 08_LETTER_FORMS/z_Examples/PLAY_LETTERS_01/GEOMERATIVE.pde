/*

*/

int FONTSIZE;

void geomerativeInit() {
  RG.init(this); 
  font = new RFont("AnonymousPro-Bold.ttf", FONTSIZE, CENTER);
  RCommand.setSegmentLength(1);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  grp = font.toGroup(myText);
  pnts = grp.getPoints();
  vec = new FontAgent[pnts.length];

  for (int i=0; i<pnts.length; i++) {
    vec[i] = new FontAgent(pnts[i].x, pnts[i].y);
  }
  
}
