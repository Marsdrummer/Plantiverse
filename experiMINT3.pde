
import processing.serial.*;
int bgcolor;   // Background color
int fgcolor;   // Fill color
Serial myPort;      // The serial port
int[] serialInArray = new int[4]; // Where we'll put what we receive
int serialCount = 0;     // A count of how many bytes we receive
int var1, var2, var3, var4;     // input variables from sensors
boolean firstContact = false;  // Whether we've heard from the microcontroller
          
  int bkgd_choice;  
  int vase_choice;  
  int leaves_choice;  
  int flower_choice;  
          
PFont f;

PImage img;
PImage img_bkgd;
PImage img_vase;
PImage img_stem;
PImage img_leaves;
PImage img_flower;
          
   
          
void setup() {
  fullScreen();
  fill(0,10);

  String portName = "COM3";
  myPort = new Serial(this, portName, 9600);
 
  f = createFont("Arial",16,true); // default is Arial, 16 point, anti-aliasing on  

  //put an empty pot there as a starting choice
  img = loadImage("NFP-11.png"); //an empty plant pot
  image(img, 0, 0);
}


void draw() {

//map each sensor onto an appropriate aspect of the art
//assign aspects with few variants to sensors that change slowly
  //soil sensor -> background (4 variants) = var1
  //water level sensor -> vase (8 variants) = var2
  //air humidity sensor -> leaves (4 variants) = var3
  //light sensor -> flowers (10 variants) = var4
  
//map each sensor reading to a range appropriate to the number of image variants
  bkgd_choice = int(map(var1, 0, 255, 1, 4));  
  vase_choice = int(map(var2, 0, 255, 1, 8));  
  leaves_choice = int(map(var3, 0, 255, 1, 4));  
  flower_choice = int(map(var4, 0, 255, 1, 10));  
  
  
//get the corresponding images
//all images are stored together in the 'data' folder
//the leading digit (0-4) indivates which part of the art it is

  img_bkgd = loadImage("NFP-0"+bkgd_choice+".png");
  img_vase = loadImage("NFP-1"+vase_choice+".png");
  img_stem = loadImage("NFP-21.png");  //there is only one stem image
  img_leaves = loadImage("NFP-3"+leaves_choice+".png");
  img_flower = loadImage("NFP-4"+flower_choice+".png");


//paint the flower
  image(img_bkgd, 0, 0);  
  image(img_vase, 0, 0);  
  image(img_stem, 0, 0);  
  image(img_leaves, 0, 0);  
  image(img_flower, 0, 0);  
  

// optional for debugging: create a text box with the variables
  //fill(255); //text will be white
  //int text_x = 20;  //the indentation from left
  //int text_y = 50;  //the line spacing and font size
  //textFont(f, text_y);
  //text("NFT art by X. Peerimint", text_x, text_y*2);  
  //textFont(f, text_y*.5);
  //text("soil: " + var1, text_x, text_y*4);  
  //text("water: " + var2, text_x, text_y*5);  
  //text("air: " + var3, text_x, text_y*6);  
  //text("light: " + var4, text_x, text_y*3);

//save the flower to a .png file 
  save("ExperiMINT"+var1 + "." + var2 + "." + var3+ "." + var4+".png");
 
}



void serialEvent(Serial myPort) {
 // read a byte from the serial port:
 int inByte = myPort.read();
 // if this is the first byte received, and it's an A,
 // clear the serial buffer and note that you've
 // had first contact from the microcontroller.
 // Otherwise, add the incoming byte to the array:
 if (firstContact == false) {
 if (inByte == 'A') {
  myPort.clear();   // clear the serial port buffer
  firstContact = true;  // you've had first contact from the microcontroller
  myPort.write('A');  // ask for more
 }
 }
 else {
 // Add the latest byte from the serial port to array:
 serialInArray[serialCount] = inByte;
 serialCount++;
 // If we have 3 bytes:
 if (serialCount > 3 ) {
  var1 = serialInArray[0];
  var2 = serialInArray[1];
  var3 = serialInArray[2];
  var4 = serialInArray[3];
  // print the values (for debugging purposes only):
  println(var1 + "." + var2 + "." + var3+ "." + var4);
  // Send a capital A to request new sensor readings:
  myPort.write('A');
  // Reset serialCount:
  serialCount = 0;
 }
 }
}
