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

   Board type is Itsy 32u4 @ 3V.

*/
#define Xbee Serial1
#define SWITCH 7

const char RUN_MSG = '1';
const char KILL_MSG = '0';

int switch_state = 0;

void setup() {
  Serial.begin(9600);
  Xbee.begin(115200);
  pinMode(SWITCH, INPUT_PULLUP);

  //use built-in RED LED to indicate switch state
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
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

    //turn RED LED on
    digitalWrite(LED_BUILTIN, HIGH);

  } 
  else {

    //send kill message over radio
    Xbee.print(KILL_MSG);

    //send kill message as debug up serial port 
    Serial.println("Kill!");

    //turn RED LED off
    digitalWrite(LED_BUILTIN, LOW);
  }

  //loop 4x a second
  delay(250);
}
