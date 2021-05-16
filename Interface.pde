class InterfaceUI {
  //for button
  float posX = 845; //posX of button
  float posY = 650; //posY of button
  //for checkBox
  float checkX = 0; //pos X of checkbox
  float checkY = 650;// pos Y of checkbox
  color buttonColor = color(255);
  color textColor = color(0);
  color buttonHighlight = color(100);
  color newBackground = color(150);
  color oldBackground = color(0);
  color pauseColor = color(255);
  PImage unchecked, checked;
  boolean checkedBox = false;



  //constuctor
  InterfaceUI() {
    //load images
    unchecked = loadImage("unchecked.png");
    checked = loadImage("checked.png");
    //resize images
    unchecked.resize(50, 50);
    checked.resize(50, 50);
  }

  // draw button near bottom right part of screen
  void drawButton() {
    //button UI
    fill(buttonColor);
    rect(posX, posY, 150, 50, 20);
    fill(textColor);
    textSize(30);
    text("Color", 880, 685);

    if (mouseX >=posX && mouseY > 540) {
      buttonColor =  buttonHighlight;
    } else {
      buttonColor = color(255);
    }
  }

  void buttonLogic() {
    if (mouseX >=posX && mouseY > 540 ) {
      newColor = !newColor;
    } else {
      buttonColor =  color(255);
    }
  }

  void drawCheckBox() {

    fill(255);
    //checkbox bg
    rect(checkX, checkY, 50, 50, 20);
    image(unchecked, checkX, checkY);
    textSize(24);
    text("Pause", checkX, 645);
  }

  void checkBoxLogic() {
    //check the box
    if (mouseX >=checkX && mouseX <= 45 && mouseY > 540 && checkedBox == false ) {
      checkedBox = true;
      image(checked, checkX, checkY);
      noLoop();
      fill(pauseColor);
      text("Paused", width/2, height/2);
    }
    //uncheck the box
    else if (mouseX >=checkX && mouseX <= 45 && mouseY > 540 && checkedBox == true ) {
      checkedBox = false;
      image(checked, checkX, checkY);
      loop();
    }
  }

  void drawGround() {
    fill(255);
    rect(width/2 + 150, 600, 100, 10, 20);
     rect(width/2 + 400, 600, 100, 10, 20);
     rect(width/2 - 150, 600, 100, 10, 20);
     rect(width/2 - 400, 600, 100, 10, 20);
     
    
     
     
  }
}
