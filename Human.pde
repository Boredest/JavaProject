

class Human {
  //Starting coordinates 
  float xPosi = 0;
  float yPosi = 0;
  float xSpeed = 2;
  float YSpeed = 2;

  //arm



  //Constructor
  Human() {
  }


void drawHuman()
  {
    //call movement once drawn

    noStroke();
    fill(38, 158, 50);
    circle(38, 10, 45);
    // rect(20, 0, 38, 30); // head
    rect(14, 32, 50, 50, 5); // body
    //draw the arms
    drawLeftArm();
    drawRightArm();
    rect(22, 84, 16, 150); // left leg
    rect(40, 84, 16, 150); // right leg
    fill(222, 222, 249);
    ellipse(30, 5, 12, 12); // left eye
    ellipse(47, 5, 12, 12);  // right eye
    rect(30, 15, 16, 3); // right leg
    fill(0);
    ellipse(30, 5, 5, 5);
    ellipse(47, 5, 5, 5);


    //arm movement
    armAngle += angleChange;
    if (armAngle > ANGLE_LIMIT || armAngle < 0)
    {
      angleChange = -angleChange;
      armAngle += angleChange;
    }
  }

  //Draw arms
  void drawLeftArm()
  {
    pushMatrix();
    translate(12, 32);
    rotate(radians(armAngle));
    rect(-5, -5, 12, 37); // left arm
    popMatrix();
  }
  //Draw arms
  void drawRightArm()
  {
    pushMatrix();
    translate(66, 32);
    rotate(radians(-armAngle));
    rect(-5, -5, 12, 37); // right arm
    popMatrix();
  }

  void humanMovement() {
    
    if (keyCode == LEFT) {
      
      translate(xPosi-=xSpeed, 0);
    } else if (keyCode == RIGHT) {

      translate(xPosi+=xSpeed, 0);
    }
   
  }
}
