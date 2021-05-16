
boolean newColor = false;

int armAngle = 0;
int angleChange = 5;

final int ANGLE_LIMIT = 200;

//RAIN
int rainAmount = 50;
float rainStartHeight = random(-10, 90);
float randomXPos = 100;
//text for slider
color sliderText = color(255);
//MAX for array
int maxClouds = 4;
float newXPos = 0;
float newYPos = random(-10, 40);
//diff modes
boolean normal = true;
boolean easy = false;
boolean max = false;
boolean dogStopped = false;



//delcare obj
Background background;
Human human;
Animal animal;
Cloud[] clouds;
InterfaceUI button;

//slider
Slider s1;
//declare arrayList
ArrayList<Rain> Rain;


void setup() {
  size(1000, 700);
  frameRate(60);
  smooth();
  background = new Background(0, 0);
  //Slider UI
  s1 = new Slider(100, 675, width/6, 16, 8);
  //UI
  button = new InterfaceUI();
  //create arr list 
  Rain = new ArrayList<Rain>(rainAmount);

  clouds = new Cloud[maxClouds];
  human = new Human();
  animal = new Animal();

  //populat cloud array
  for (int i = 0; i< clouds.length; i++) {
    clouds[i] = new Cloud(newXPos, newYPos);
    newXPos+= 350;
  }

  //add rain 15
  for (int i = 0; i<=rainAmount; i++) {
    Rain.add(new Rain(randomXPos, 15));
    randomXPos += 200;
  }
}//END OF SETUP

//check for slider


void draw()
{//DRAW

  //button
  if (newColor) {
    background(button.newBackground);
  } else {
    background(0);
  }


  fill(255, 255, 0);
  circle(990, 0, 130);

  //draw slider
  s1.update();
  s1.display();
  //draw button
  button.drawButton();
  //draw checkbox
  button.drawCheckBox();
  button.drawGround();

  pushMatrix();
  translate(width/1.1, height-200);
  //draw  animal
  animal.drawAnimal();

  popMatrix();
  pushMatrix();
  translate(width/8, height-300);

  human.humanMovement();
  human.drawHuman();

  popMatrix();


  //array of clouds

  for (int i = 0; i< clouds.length; i++) {
    clouds[i].drawCloud();
    clouds[i].moveObject();

    //MAX
    if (s1.newspos == 250) {
      fill(sliderText);
      textSize(24);
      text("MAX", 150, 660);

      clouds[i].xSpeed = 6.25;
      animal.xSpeedA += 0.1;
      max = true;
      normal = false;
      easy = false;
    }
    //NORM
    else if (s1.newspos == 175 || s1.newspos >= 155 && s1.newspos <= 195) {
      fill(sliderText);
      textSize(24);
      text("NORMAL", 130, 660);
      clouds[i].xSpeed = 3.35;
      normal = true;
      max = false;
      easy = false;
      // animal.xSpeedA = 3;
    }
    //EASY
    else if (s1.newspos == 100) {
      fill(sliderText);
      textSize(24);
      text("SLOW", 150, 660);
      easy = true;
      max = false;
      normal = false;
      animal.xSpeedA = 1;
    }
  }

  //get rain
  for (int i = 0; i < Rain.size(); i ++) {

    Rain rain = Rain.get(i);
    rain.rainFall();

    if (max) {
      rain.rainSpeed = 8.5;
    } else if (normal) {
      rain.rainSpeed = 5.25;
    } else if (easy) {
      rain.rainSpeed = 3.25;
    }
  }

  if (dogStopped) {
    animal.animalMovement();
  }
}//end of DRAW


void mousePressed() {
  button.buttonLogic();
  button.checkBoxLogic();
}//MOUSEPRESSED



void keyPressed() {
  if (key == 'f') {

    angleChange = 10;
  }
  if (key == 'c') {
    dogStopped = true;
  }
  //rest
  if (key == 'r') {
    animal.animalX = 0;
    animal.xSpeed = 3;
    human.xPosi = 0;
    dogStopped = false;
  }
}//KEYPRESSED


void keyReleased() {
  angleChange = 5;
}  //KEYRELEASED
