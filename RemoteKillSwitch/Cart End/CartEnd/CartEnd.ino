/*
 * Remote Kill Switch: Cart End
 * 
 * This code runs on an Arduino (tested with an Arduino Uno) that has a relay connected to digital pin RELAY
 * and is receiving a 5V and GROUND input.  The output of this relay is put in series with the kill switches on
 * the cart.
 * 
 * This code receives a signal from a Xbee (other end running the UserEnd code) of either a 0 or a 1.  When the
 * received data is a 0, the relay is in an OFF/LOW state.  When the data is a 1, the relay is in an ON/HIGH state.
 * The program should constantly be receiving data from the transmission source (UserEnd).  If data is not received
 * for TIMEOUT, it will trigger a failsafe and put the relay into OFF/LOW.  
 * 
 * Please verify Xbee's are connected to each other in XCTU prior to running this code.  This code does not set up 
 * any Xbee settings or configurations.
 * 
 * Matty Wolfson - 6/17/2022
 */

#include <time.h>
#define Xbee Serial
#define RELAY 7

int currentState = 0;

unsigned long lastPacketReceived = 0;

unsigned long TIMEOUT = 2000;  /* Timeout in milliseconds.  Relay will flip if data is not received for period of time.  */

void setup() {
  pinMode(RELAY, OUTPUT);
  digitalWrite(RELAY, LOW);
  Serial.begin(115200);
  lastPacketReceived = millis();
}

void loop() {
  unsigned long currentTime = millis();
  if(currentTime - lastPacketReceived > TIMEOUT) {
    digitalWrite(RELAY, LOW);
    lastPacketReceived = currentTime;
  }
  while(Xbee.available() > 0) {
    currentTime = millis();
    
    // Disconnect failsafe.  Times out if data is not received for TIMEOUT
    if(currentTime - lastPacketReceived > TIMEOUT) {
      digitalWrite(RELAY, LOW);
      lastPacketReceived = currentTime;
    }

    // Gets Xbee data and converts to an integer value
    char c = Xbee.read();
    int val = c - '0';
    if(val != currentState) {
        // Relay state triggers
        if(val == 0) {
          digitalWrite(RELAY, LOW);
        }
        if(val == 1) {
          digitalWrite(RELAY, HIGH);
        }
        currentState = val;
    }
    lastPacketReceived = currentTime;
  } 
}
