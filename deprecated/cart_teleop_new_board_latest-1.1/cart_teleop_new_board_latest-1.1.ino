 /*
   cart_teleop_new_board.ino - Contains the main arduino code for controlling our autonomous golf cart with non-dac board.

      Author: Brandon Parr
      Version: 1.0
*/

#include <Wire.h>
#include <PID_v1.h>

int throttle = 5;         /* pin 3 */
int brake = 6;            /* pin 5 */
int leftSteer = 10;        /* pin 6 */
int throttleRelay = 7;    /* pin 7 */
int brakeRelay = 8;       /* pin 8 */
int rightSteer = 9;       /* pin 9 */

int wiper = A0;           /* pin A0 */

/* bounds for throttle mapping */
const int LOWER_THROTTLE_BOUNDS = 25;
const int UPPER_THROTTLE_BOUND = 226;

/* bounds for brake mapping */
const int LOWER_BRAKE_BOUND = 25;
const int UPPER_BRAKE_BOUND = 234;

/*bounds for steering mapping */
const int LOWER_STEER_BOUND = 0;
const int UPPER_STEER_BOUND = 255;

/* empirical potentiometer bounds */
const int LOWER_STEER_POT_BOUND = 310;
const int UPPER_STEER_POT_BOUND = 620;

/* Neutral steer value */
const float NEUTRAL_STEER = 2.5;

/*Values for the pid*/
double currentSteeringPot;
double pidSignal;

double steeringTarget;
int brakeTarget;
int throttleTarget;

const float STEER_VOLT_MAX_OFFSET = .7;
const float STEER_VOLT_MIN_OFFSET = .3;

const int LOWER_PID_BOUND = -255;
const int UPPER_PID_BOUND = 255;

PID myPID(&currentSteeringPot, &pidSignal, &steeringTarget, 10, 2.0, 1, DIRECT);
//PID myPID(&currentSteeringPot, &pidSignal, &steeringTarget, 10, 0, 0, DIRECT);

/* magic numbers */
const int MAGIC_START = 42;
const int MAGIC_END = 21;

unsigned long time_since;

void pid_setup() {
  myPID.SetMode(AUTOMATIC);
  myPID.SetOutputLimits(LOWER_PID_BOUND, UPPER_PID_BOUND);
  myPID.SetSampleTime(20);
}

/* Main program setup */
void setup() {
  // set up serial
  Serial.begin(57600);
  while (!Serial) {
    delay(15);
  }

  // set up relays
  pinMode(throttleRelay, OUTPUT);
  pinMode(brakeRelay, OUTPUT);

  // set up outputs
  pinMode(throttle, OUTPUT);
  pinMode(brake, OUTPUT);
  pinMode(leftSteer, OUTPUT);
  pinMode(rightSteer, OUTPUT);

  // set up wiper
  pinMode(wiper, INPUT);
  
  Serial.println("STARTING");

  steeringTarget = 50;
  brakeTarget = 0;
  throttleTarget = 0;
  currentSteeringPot = -1;
  pidSignal = -1;

  pid_setup();
}

/* Main program loop */
void loop() {
  delay(1);
  readCommands();
  steer();
  setThrottle();
  setBrake();
}

void readCommands() {
    if (Serial.available() >= 5){
      int firstByte = Serial.read();
      if (firstByte == MAGIC_START) {
        int secondByte = Serial.read();
        if (secondByte == MAGIC_END) {
           
           throttleTarget = Serial.read();
           brakeTarget = Serial.read();
           steeringTarget = Serial.read();
           Serial.print("Steer command:   \t\t");
           Serial.println(steeringTarget);
           Serial.print("Brake command:   \t\t");
           Serial.println(brakeTarget);
           Serial.print("Throttle command:\t\t");
           Serial.println(throttleTarget);
           Serial.println("");
        }
      }
    }
    
}

void setThrottle() {
  int val = map(throttleTarget, 0, 255, LOWER_THROTTLE_BOUNDS, UPPER_THROTTLE_BOUND);
  analogWrite(throttle, val);

  //Serial.print("Throttle set:\t\t");
  //Serial.println(throttleTarget);
  if (throttleTarget == 0) {
    digitalWrite(throttleRelay, LOW);
  } else {
    digitalWrite(throttleRelay, HIGH);
  }
}

void setBrake() {
  int val = map(brakeTarget, 0, 255, LOWER_BRAKE_BOUND, UPPER_BRAKE_BOUND);
  analogWrite(brake, val);

  //Serial.print("Brake set:\t\t");
  //Serial.println(brakeTarget);
  if (brakeTarget == 255) {
    digitalWrite(brakeRelay, LOW);
  } else {
    digitalWrite(brakeRelay, HIGH);
  }
}

void steer() { 
  if (steeringTarget != -1) {
    // read in the potentiometer value and map from 0 (full left) to 100 (full right)
   currentSteeringPot = analogRead(wiper);
   //Serial.print("Pot Absolute Value: ");
   //Serial.println(currentSteeringPot);
   currentSteeringPot = mapf(currentSteeringPot, LOWER_STEER_POT_BOUND, UPPER_STEER_POT_BOUND, 0.0, 100.0);
   //Serial.print("CURR POT ");
   //Serial.println(currentSteeringPot);
   myPID.Compute();
   //Serial.print("RAW COMPUTE ");
   //Serial.println(pidSignal);
   float signal = mapf(pidSignal, LOWER_PID_BOUND, UPPER_PID_BOUND, -STEER_VOLT_MAX_OFFSET, STEER_VOLT_MAX_OFFSET);
   //Serial.print("MAPPED SIGNAL: ");
   //Serial.println(signal);
   setSteerVoltages(signal);
  }
}

/* sends a steeringTarget voltage to both left and right steering channels */
void setSteerVoltages(float signal) {
  // check if values are valid - must be between 2.0 & 3.0 inclusive and sum up to 5.0
  if ((signal >= -STEER_VOLT_MAX_OFFSET  && signal <= STEER_VOLT_MAX_OFFSET) && (signal >= STEER_VOLT_MIN_OFFSET || signal <= -STEER_VOLT_MIN_OFFSET)){
    
      int finalLeft = mapf(NEUTRAL_STEER - signal, 0.0, 5.0, LOWER_STEER_BOUND, UPPER_STEER_BOUND);
      int finalRight = mapf(NEUTRAL_STEER + signal, 0.0, 5.0, LOWER_STEER_BOUND, UPPER_STEER_BOUND);

      //Serial.print("LEFT VOLT: ");
      //Serial.println(finalLeft);
      //Serial.print("RIGHT VOLT: ");
      //aaaaaSerial.println(finalRight);
    
      analogWrite(leftSteer, finalLeft);
      analogWrite(rightSteer, finalRight);
    
    
    

  }
  else
  {
    int finalLeft = mapf(NEUTRAL_STEER, 0.0, 5.0, LOWER_STEER_BOUND, UPPER_STEER_BOUND);
    int finalRight = mapf(NEUTRAL_STEER, 0.0, 5.0, LOWER_STEER_BOUND, UPPER_STEER_BOUND);

    analogWrite(leftSteer, finalLeft);
    analogWrite(rightSteer, finalRight);
  }
}

/* map function for a float value */
float mapf(float x, float inMin, float inMax, float outMin, float outMax) {
  return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}
