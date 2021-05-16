class Animal extends Human {
  float animalX =0, animalY = 0;
  float xSpeedA =  3;
  Animal() {
  }///animal construc


  void drawAnimal()
  {
    //call movement once drawn

    noStroke();
    fill(38, 158, 50);
    // circle(38, 10, 45);
    rect(-85+animalX, 0+animalY, 38, 30, 100); // head
    rect(0+animalX, 0+animalY, 50, 45); // body
    rect(-50+animalX, 0+animalY, 50, 45);

    rect(0+animalX, 0+animalY, 16, 100); // right legs
    rect(30+animalX, 0+animalY, 16, 100); // right legs

    //left legs
    rect(-30+animalX, 0+animalY, 16, 100);
    rect(-60+animalX, 0+animalY, 16, 100);
    fill(222, 222, 249);
    ellipse(-80+animalX, 10 +animalY, 12, 12); // ey
    fill(0);

    drawTail();


  }//draw Animal

  void drawTail() {

    pushMatrix();
    rotate(radians(0.1));
    fill(38, 158, 50);
    rect(50+animalX, 1+animalY, 40, 10);
    popMatrix();
  }

  void animalMovement() {

    animalX -= xSpeedA;


    if (animalX <= -640 || animalX == human.xPosi ) {
      xSpeedA = 0; //stop
      animalX = -640;
      //animalX = -700;
    }
  }
}
