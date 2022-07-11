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

   Board is Arduino Uno 5V
*/

#define Xbee Serial
#define RELAY 7

const char RUN = '1';
const char KILL = '0';

//int currentState = 0;

unsigned long lastPacketReceived = 0;

unsigned long TIMEOUT = 2000;  /* Timeout in milliseconds.  Relay will flip if data is not received for period of time.  */


enum STATE {STATE_DISCONNECTED, STATE_CONNECTED_RUN, STATE_CONNECTED_KILL, STATE_TIMEOUT_PENDING};
enum COMMAND {CMD_RUN, CMD_KILL, CMD_NONE};


void setup() {
  pinMode(RELAY, OUTPUT);
  digitalWrite(RELAY, LOW);

  Xbee.begin(115200);

  lastPacketReceived = millis();
}


enum STATE current_state = STATE_DISCONNECTED;
enum STATE next_state = STATE_DISCONNECTED;

enum COMMAND last_good_command = CMD_NONE;

void loop() {

  /**
     Perform Action based upon current state
  */

  if (current_state == STATE_CONNECTED_RUN)
  {
    //enable relay
    digitalWrite(RELAY, HIGH);
  }
  else if (current_state == STATE_DISCONNECTED)
  {
    //kill relay
    digitalWrite(RELAY, LOW);
  }
  else if (current_state == STATE_CONNECTED_KILL)
  {
    //kill relay
    digitalWrite(RELAY, LOW);
  }
  else if (current_state = STATE_TIMEOUT_PENDING)
  {
    //repeat last command
    if (last_good_command == CMD_RUN)
    {
      //enable relay
      digitalWrite(RELAY, HIGH);
    }
    else if (last_good_command == CMD_KILL)
    {
      //kill relay
      digitalWrite(RELAY, LOW);
    }
    else
    {
      //failsafe condition. Kill the cart.
      //kill relay
      digitalWrite(RELAY, LOW);
    }
  }
  else
  {
    //failsafe condition
    //kill relay
    digitalWrite(RELAY, LOW);
  }


  /*
     Parse inputs and incoming messages (if any)
  */

  boolean valid_packet_recevied = false;
  enum COMMAND received_command = CMD_NONE;

  // check to see if any bytes are available
  while (Xbee.available() > 0)
  {
    char c = Xbee.read();

    // if a RUN command was received
    if (c == RUN)
    {
      received_command = CMD_RUN;
      valid_packet_recevied = true;
      lastPacketReceived = millis();
      last_good_command = received_command;
    }

    // if a KILL command was received
    else if (c == KILL)
    {
      received_command = CMD_KILL;
      valid_packet_recevied = true;
      lastPacketReceived = millis();
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

    //timeout has expired. Go to disconnected.
    else
    {
      next_state = STATE_DISCONNECTED;
    }
  }
  else
  {
    //failsafe state because our logic is wrong
    next_state = STATE_DISCONNECTED;
  }

  //update state variable
  current_state = next_state;
  
  delay(50);

/*

  if (currentTime - lastPacketReceived > TIMEOUT) {
    digitalWrite(RELAY, LOW);
    lastPacketReceived = currentTime;
  }
  while (Xbee.available() > 0) {
    currentTime = millis();

    // Disconnect failsafe.  Times out if data is not received for TIMEOUT
    if (currentTime - lastPacketReceived > TIMEOUT) {
      digitalWrite(RELAY, LOW);
      lastPacketReceived = currentTime;
    }

    // Gets Xbee data and converts to an integer value
    char c = Xbee.read();
    int val = c - '0';
    if (val != currentState) {
      // Relay state triggers
      if (val == 0) {
        digitalWrite(RELAY, LOW);
      }
      if (val == 1) {
        digitalWrite(RELAY, HIGH);
      }
      currentState = val;
    }
    lastPacketReceived = currentTime;
  } */
}
