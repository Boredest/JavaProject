class Background {
  float x = 0;
  float y = 0; 
  float xSpeed = 3.5;

  Background(float xPos, float yPos)
  {
    x = xPos;
    y = yPos;
   
  }


  void moveObject() {
    //translation speed

    x+=xSpeed;
    if (x > 1100) {
      x = -400;
    }
  }
}
