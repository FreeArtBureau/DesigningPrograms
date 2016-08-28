/*
 * VARIOUS FUNCTIONS
 *
 */


//////////////////////////////////// draws ellipses at various parts of body

void drawUserData() {
  //get array of IDs of all users present 
  int[] users=kinect.getUsers();

  ellipseMode(CENTER);

  //iterate through users
  for (int i=0; i < users.length; i++) {
    int uid=users[i];
    //draw center of mass of the user (simple mean across position of all user pixels that corresponds to the given user)
    PVector realCoM=new PVector();
    //get the CoM in realworld (3D) coordinates
    kinect.getCoM(uid, realCoM);
    PVector projCoM=new PVector();
    //convert realworld coordinates to projective (those that we can use to draw to our canvas)
    kinect.convertRealWorldToProjective(realCoM, projCoM);
    fill(255, 0, 0);
    ellipse(projCoM.x, projCoM.y, 10, 10);

    //check if user has a skeleton
    if (kinect.isTrackingSkeleton(uid)) {
      //draw head
      PVector realHead=new PVector();

      //get realworld coordinates of the given joint of the user (in this case Head -> SimpleOpenNI.SKEL_HEAD)
      kinect.getJointPositionSkeleton(uid, SimpleOpenNI.SKEL_HEAD, realHead);
      PVector projHead=new PVector();
      kinect.convertRealWorldToProjective(realHead, projHead);
      fill(0, 255, 0);
      ellipse(projHead.x, projHead.y, 10, 10);

      //draw left hand
      PVector realLHand=new PVector();
      kinect.getJointPositionSkeleton(uid, SimpleOpenNI.SKEL_LEFT_HAND, realLHand);
      PVector projLHand=new PVector();
      kinect.convertRealWorldToProjective(realLHand, projLHand);


      ///////////////////////////////////////////////////////// DEPTH & POSITIONAL DATA !
      // Get depth data for this hand
      // the depthmap collects distance data for every pixel in image
      int[] depth = kinect.depthMap();
      int d = 0;
      // to calculate the position for a pixel we use the formula : y*width+x
      // this is what we do here, getting the position of the pixel mapped to the 
     // left hand, then storing that value in our variable 'pos'
      int pos = ((int)projLHand.y*width)+(int)projLHand.x;
      
      // now we can get the depth/distance value for that pixel
      if (pos>0) {
        d = depth[pos];
        println("Left hand distance = "+d);
      }
      // map depth variable to change size of circle
      float dia = map(d, 0, 2000, 1, 100); 

      fill(255, 255, 0);
      ellipse(projLHand.x, projLHand.y, dia, dia);

      // get positional data for hand too
      float leftHandPositionX = projLHand.x;
      float leftHandPositionY = projLHand.y;
      println("Left hand position = X: "+leftHandPositionX+" Y: "+leftHandPositionY);

      ////////////////////////////////////////////////////////////////////////////
      
      //draw right hand
      PVector realRHand=new PVector();
      kinect.getJointPositionSkeleton(uid, SimpleOpenNI.SKEL_RIGHT_HAND, realRHand);
      PVector projRHand=new PVector();
      kinect.convertRealWorldToProjective(realRHand, projRHand);
      fill(0, 255, 255);
      ellipse(projRHand.x, projRHand.y, 10, 10);
    }
  }
}

///////////////////////////////////// gets user data and colours 
void updateDepthImage() {
  //retrieves depth image
  PImage depthImage = kinect.depthImage();
  depthImage.loadPixels();

  //get user pixels - array of the same size as depthImage.pixels, that gives information about the users in the depth image:
  // if upix[i]=0, there is no user at that pixel position
  // if upix[i] > 0, upix[i] indicates which userid is at that position
  int[] upix=kinect.userMap();

  //colorize users
  for (int i=0; i < upix.length; i++) {
    if (upix[i] > 0) {
      //there is a user on that position
      //NOTE: if you need to distinguish between users, check the value of the upix[i]
      img.pixels[i]=color(0, 0, 255);
    } else {
      //add depth data to the image
      img.pixels[i]=depthImage.pixels[i];
    }
  }
  img.updatePixels();
}


/////////////////////////// OTHER FUNCTIONS ////////////////////////////

//is called everytime a new user appears
void onNewUser(SimpleOpenNI curContext, int userId) {
  println("onNewUser - userId: " + userId);
  //asks OpenNI to start tracking a skeleton data for this user 
  //NOTE: you cannot request more than 2 skeletons at the same time due to the perfomance limitation
  //      so some user logic is necessary (e.g. only the closest user will have a skeleton)
  curContext.startTrackingSkeleton(userId);
}

//is called everytime a user disappears
void onLostUser(SimpleOpenNI curContext, int userId) {
  println("onLostUser - userId: " + userId);
}

