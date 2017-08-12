#include "UsbKeyboard.h"

#define LEFT_PEDAL A0
#define RIGHT_PEDAL A1
#define PRESS_TRESHOLD 800
#define ENHANCED_PRESS_TRESHOLD 3000

unsigned long leftPressTime, rightPressTime;

bool leftKeySent, rightKeySent, leftKey2Sent, rightKey2Sent;
void setup() {  
  Serial.begin(9600);
  leftKeySent = false;
  rightKeySent = false;
  leftKey2Sent = false;
  rightKey2Sent = false;
  leftPressTime = 0;
  rightPressTime = 0;
}

void loop() {
  UsbKeyboard.update();
  int leftPedal = analogRead(LEFT_PEDAL);
  //Serial.print("LeftPedal:");
  //Serial.print(leftPedal, DEC);
  int rightPedal = analogRead(RIGHT_PEDAL);
  //Serial.print(" RightPedal:");
  //Serial.println(rightPedal, DEC);
  ////////////////////LeftPedal///////////////////////////
  if (leftPedal > PRESS_TRESHOLD){
    if(!leftKeySent) {
      leftPressTime = millis();
      leftKeySent = true;
      UsbKeyboard.sendKeyStroke(KEY_C, MOD_CONTROL_LEFT);
      delay(20);
      Serial.println("Sent Ctrl+C");
    }
    else{
      if((millis()-leftPressTime > ENHANCED_PRESS_TRESHOLD) && !leftKey2Sent){
        leftKey2Sent = true;
        UsbKeyboard.sendKeyStroke(KEY_A, MOD_CONTROL_LEFT);
        delay(20);
        Serial.println("Sent Ctrl+A");
        leftPressTime = 0;
      }
    }
  }
  else{
    leftKeySent = false;
    leftKey2Sent = false;
  }
  ////////////////////RightPedal///////////////////////////
  if (rightPedal > PRESS_TRESHOLD){ 
    if(!rightKeySent) {
      rightPressTime = millis();
      rightKeySent = true;
      UsbKeyboard.sendKeyStroke(KEY_V, MOD_CONTROL_LEFT);
      delay(20);
      Serial.println("Sent Ctrl+V");
    }
    else{
      if(millis()-rightPressTime > ENHANCED_PRESS_TRESHOLD && !rightKey2Sent){
        rightKey2Sent = true;
        UsbKeyboard.sendKeyStroke(KEY_S, MOD_CONTROL_LEFT);
        delay(20);
        Serial.println("Sent Ctrl+S");
        rightPressTime = 0;
      }      
    }
  }
  else{
    rightKeySent = false;
    rightKey2Sent = false;
  }
}




