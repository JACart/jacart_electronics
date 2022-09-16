/*
   Remote Kill Switch: Cart End

   This code runs on an Arduino (tested with an Arduino Uno) that has a relay connected to digital pin RELAY
   and is receiving a 5V and GROUND input.  The output of this relay is put in series with the kill switches on
   the cart.

   This code receives a signal from a Xbee (other end running the UserEnd code) of either a 0 or a 1.  When the
   received data is a 0, the relay is in an OFF/LOW state.  When the data is a 1, the relay is in an ON/HIGH state.
   The program should constantly be receiving data from the transmission source (UserEnd).  If data is not received
   for TIMEOUT, it will trigger a failsafe and put the relay into OFF/LOW.

   Please verify Xbee's are connected to each other in XCTU prior to running this code.  This code does not set up
   any Xbee settings or configurations.

   Matty Wolfson - 6/17/2022

   ---------------------

   Code is re-organized to better separate state and action logic.

   Board is Arduino Uno 5V

   Jason Forsyth - 7/12/2022
*/

//include SoftwareSerial to remove Xbee from built-in RX and TX lines
#include <SoftwareSerial.h>

//new RX line to receive from Xbee
const int XBEE_RX_PIN = 2;

//new TX line to send to Xbee
const int XBEE_TX_PIN = 3;

//instantiate SoftwareSerial for Xbee
SoftwareSerial Xbee (XBEE_RX_PIN, XBEE_TX_PIN);

// I/O pin for controlling relay
#define RELAY 7

/**
   Message formats for the RUN and KILL commands
*/
const char RUN_MSG = '1';
const char KILL_MSG = '0';

// time stamp in millis for last packet received
unsigned long lastPacketReceived = 0;

// Timeout in milliseconds.  Relay will flip if data is not received for period of time.
unsigned long TIMEOUT = 2000;

/**
   Various states for the Cart's operation
   DISCONNECTED: cart is disconnected from radio and timeout has exceeded. Should kill.
   CONNECTED_RUN: cart is connected to radio and last received command was RUN. Should run.
   CONNECTED_KILL: cart is connected to radio and last received command was KILL. Should kill.
   TIMEOUT_PENDING: cart is disconnected from radio, but has not yet timed out. Should repeat last command.
*/
enum STATE {STATE_DISCONNECTED, STATE_CONNECTED_RUN, STATE_CONNECTED_KILL, STATE_TIMEOUT_PENDING};
enum COMMAND {CMD_RUN, CMD_KILL, CMD_NONE};

//indicator RGB LED pins
const int LED_RED = A0;
const int LED_GROUND = A1;
const int LED_GREEN = A2;
const int LED_BLUE = A3;

void setup() {

  //set relay pin as OUTPUT. Throw relay.
  pinMode(RELAY, OUTPUT);
  digitalWrite(RELAY, LOW);

  //use built-in RED LED to indicate cart state
  pinMode(LED_RED, OUTPUT);
  pinMode(LED_GROUND, OUTPUT);
  pinMode(LED_GREEN, OUTPUT);
  pinMode(LED_BLUE, OUTPUT);

  digitalWrite(LED_RED, LOW);
  digitalWrite(LED_GROUND, LOW);
  digitalWrite(LED_GREEN, LOW);
  digitalWrite(LED_BLUE, LOW);

  //setup communication with Xbeee
  Xbee.begin(9600);

  //no packets have been received
  lastPacketReceived = 0;

  //turn on internal UART for debugging to console
  Serial.begin(9600);
}

/**
   State variables to manage board operation
*/
enum STATE current_state = STATE_DISCONNECTED;
enum STATE next_state = STATE_DISCONNECTED;

//record last good command to be repeated during TIMEOUT
enum COMMAND last_good_command = CMD_NONE;

//enable cart operation
inline void run_cart()
{

  //enable relay
  digitalWrite(RELAY, HIGH);

  //turn on built-in LED
  digitalWrite(LED_BUILTIN, HIGH);
}

//disable cart operation
inline void kill_cart()
{
  //disable relay
  digitalWrite(RELAY, LOW);

  //turn off built-in LED
  digitalWrite(LED_BUILTIN, LOW);
}

//runs forever
void loop() {

  /**
     Perform Action based upon current state
  */

  //execute state action logic
  if (current_state == STATE_CONNECTED_RUN)
  {
    run_cart();

#if DEBUG
    Serial.println("RUN!");
#endif

    digitalWrite(LED_RED, LOW);
    digitalWrite(LED_GREEN, HIGH);
    digitalWrite(LED_BLUE, LOW);

  }
  else if (current_state == STATE_DISCONNECTED)
  {
    kill_cart();

#if DEBUG
    Serial.println("DISC!");
#endif

    digitalWrite(LED_RED, LOW);
    digitalWrite(LED_GREEN, LOW);
    digitalWrite(LED_BLUE, HIGH);

  }
  else if (current_state == STATE_CONNECTED_KILL)
  {
    kill_cart();

    Serial.println("KILL!");

    digitalWrite(LED_RED, HIGH);
    digitalWrite(LED_GREEN, LOW);
    digitalWrite(LED_BLUE, LOW);
  }
  else if (current_state == STATE_TIMEOUT_PENDING)
  {
    if (last_good_command == CMD_RUN)
    {
      run_cart();
    }
    else if (last_good_command == CMD_KILL)
    {
      kill_cart();
    }
    else //failsafe is last command was CMD_NONE
    {
      kill_cart();

      Serial.println("FAILSAFE!");

      digitalWrite(LED_RED, HIGH);
      digitalWrite(LED_GREEN, HIGH);
      digitalWrite(LED_BLUE, HIGH);

    }
  }

  //failsafe condition
  else
  {
    kill_cart();
    Serial.println("FAILSAFE!");
    digitalWrite(LED_RED, HIGH);
    digitalWrite(LED_GREEN, HIGH);
    digitalWrite(LED_BLUE, HIGH);

  }


  /*
     Parse inputs and incoming messages (if any)
  */

  boolean valid_packet_recevied = false;
  enum COMMAND received_command = CMD_NONE;

  // check to see if any bytes are available
  while (Xbee.available() > 0)
  {

    //read a byte
    char c = Xbee.read();

    //print out to serial terminal
    Serial.println(c);

    // if a valid command was received
    if (c == RUN_MSG || c == KILL_MSG)
    {
      //if command was RUN, assign CMD_RUN; otherwise CMD_KILL
      received_command = (c == RUN_MSG) ? CMD_RUN : CMD_KILL;

      //mark valid packet received
      valid_packet_recevied = true;

      //record received time
      lastPacketReceived = millis();

      //denote last good command for pending state
      last_good_command = received_command;
    }

    //failsafe for invalid message received
    else
    {
      ///ERROR! Data was received but was not recognized as valid.
      received_command = CMD_NONE;
      valid_packet_recevied = false;
    }
  }

  /**
     Update state machine logic to see where we are
  */

  //if valid RUN command was received
  if ((valid_packet_recevied == true) && (received_command == CMD_RUN))
  {
    next_state = STATE_CONNECTED_RUN;
  }

  //if valid KILL command was received
  else if ((valid_packet_recevied == true) && (received_command == CMD_KILL))
  {
    next_state = STATE_CONNECTED_KILL;
  }

  //if invalid or no packet was received
  else if (valid_packet_recevied == false)
  {
    long disconnected_time = abs(millis() - lastPacketReceived);

    // determine if we should move into disconnect state. Additional logic added so
    // that cart will not pop into TIMEOUT state upon boot.
    if ((disconnected_time < TIMEOUT) && (current_state != STATE_DISCONNECTED))
    {
      next_state = STATE_TIMEOUT_PENDING;
    }

    // if we're already in disconnected state and didn't receive anything new
    else if (current_state == STATE_DISCONNECTED)
    {
      next_state = STATE_DISCONNECTED;
    }

    //timeout has expired. Go to disconnected.
    else
    {
      next_state = STATE_DISCONNECTED;

      Serial.println("TIMEOUT!");
    }
  }

  //failsafe state because our logic is wrong
  else
  {

    next_state = STATE_DISCONNECTED;
  }

  //update state variable
  current_state = next_state;

  delay(50);

}
