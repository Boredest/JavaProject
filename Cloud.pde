class Cloud extends Background {
  PImage cloud;



  //Constructor
  Cloud(float xPos, float yPos) {
    //super 
    super(xPos, yPos);
    x = xPos;
    y = yPos;
    //load image
    cloud = loadImage("Cloud.png");
    //resize cloud
    cloud.resize(150, 100);
  }

  // draw cloud
  void drawCloud() {

    image(cloud, x, y);
  }
}
