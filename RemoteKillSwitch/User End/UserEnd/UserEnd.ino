/*
   Remote Kill Switch: User End

   This code runs on an Arduino (tested with an ItsyBitsy) that has a
   switch connected to the specified SWITCH digital pin and GROUND.
   It will send out a message every quarter of a second with either a
   0 or a 1 to indicate whether the switch is flipped on (state of 1)
   of off (state of 0).  This is then communicated over the Xbee to the
   Arduino running the CartEnd code.

   Please verify Xbee's are connected to each other in XCTU prior to
   running this code.  This code does not set up any Xbee settings or
   configurations

   Matty Wolfson - 6/17/2022

   Board type is Itsy 32u4 @ 5V.

   9/9/2022 - Modifications to pins made for Bobby's new board.

*/
//include SoftwareSerial to remove Xbee from built-in RX and TX lines
#include <SoftwareSerial.h>

//new RX line to receive from Xbee (DOUT)
const int XBEE_RX_PIN = 14;

//new TX line to send to Xbee (DIN)
const int XBEE_TX_PIN = 16;

//instantiate SoftwareSerial for Xbee
SoftwareSerial Xbee (XBEE_RX_PIN,XBEE_TX_PIN);


//GPIO pin that is connected to the switch
#define SWITCH 12

//message to send across the network
const char RUN_MSG = '1';
const char KILL_MSG = '0';

//variable for tracking switch state
int switch_state = 0;

//indicator RGB LED pins
const int LED_RED = A0;
const int LED_GROUND = A1;
const int LED_GREEN = A2;
const int LED_BLUE = A3;


void setup() {
  Serial.begin(9600);
  Xbee.begin(9600);
  pinMode(SWITCH, INPUT_PULLUP);

  //use built-in RED LED to indicate switch state
  pinMode(LED_RED,OUTPUT);
  pinMode(LED_GROUND,OUTPUT);
  pinMode(LED_GREEN,OUTPUT);
  pinMode(LED_BLUE,OUTPUT);
  pinMode(LED_BUILTIN,OUTPUT);

  digitalWrite(LED_RED,LOW);
  digitalWrite(LED_GROUND,LOW);
  digitalWrite(LED_GREEN,LOW);
  digitalWrite(LED_BLUE,LOW);
  digitalWrite(LED_BUILTIN,LOW);
  
}

void loop() {

  //read state of GPIO connected to switch
  switch_state = digitalRead(SWITCH);

  //if switch is LOW, Run the cart
  if (switch_state == LOW) {

    //send run message over radio
    Xbee.print(RUN_MSG);

    //send run message as debug up serial port
    Serial.println("Run!");

    //turn GREEN LED on, all others OFF
    digitalWrite(LED_RED, LOW);
    digitalWrite(LED_GREEN,HIGH);
    digitalWrite(LED_BLUE,LOW);

    //turn on built-in LED so can see if switch is active
    digitalWrite(LED_BUILTIN,HIGH);

  } 
  else {

    //send kill message over radio
    Xbee.print(KILL_MSG);

    //send kill message as debug up serial port 
    Serial.println("Kill!");

    //turn RED ON off, all others OFF
    digitalWrite(LED_RED, HIGH);
    digitalWrite(LED_GREEN,LOW);
    digitalWrite(LED_BLUE,LOW);

    //turn off built-in LED so can see if switch is active
    digitalWrite(LED_BUILTIN,LOW);
  }

  //loop 4x a second
  delay(250);
}
