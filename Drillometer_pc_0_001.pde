import processing.serial.*;

int connectingSpeed = 9600;
Serial serial;
String portName = ",";

import controlP5.*;
ControlP5 cp5;
Textarea myTextarea;

int tmp = 0;
double Ftmp = 0.0;
boolean messageFlag = false;
IntList queue;

/*
class Burilo {
 float Mx,
 }
 */

void setup() {
  
  queue = new IntList();
  
  size(1024, 768);
  
  createInteface();
  
  
}




void draw()
{
  background(200);
  //acceptMessage();
  //sendMessage();
  String Stringtmp = myTextarea.getText();
  println(queue);

  println(queue.size());
  //myTextarea.setText("Запись номер "+tmp+ "\n" + Stringtmp );
  //delay(1000);
 
}
