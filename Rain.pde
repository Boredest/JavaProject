class Rain extends Background{
  //start pos of Rain
  float rectX, rectY;
  float rainSpeed;
  boolean isRaining = false;
  //Constructor
  Rain(float newX, float newY) {
    super(newX, newY);
    this.rectX = newX;
    this.rectY = newY;
    rainSpeed = 3.5;
  }


  void rainFall() {
    //draw rain
    fill(0, 0, 255);
    pushMatrix();
    rotate(0.05);
    rect(rectX, rectY, 2.5, 40);
    popMatrix();
    //adding speed to Y value
    rectY = rectY + rainSpeed;

    // if pos Y > 800 rest
    if (rectY > 725) {
      rectY = -125;
    }
  }
  
}
