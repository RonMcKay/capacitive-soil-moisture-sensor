#include <Arduino.h>

// #define MY_DEBUG
// #define MY_DEBUG_VERBOSE_SIGNING
// #define CALIBRATION_MODE

// Soft signing
// #define MY_SIGNING_SOFT
// #define MY_SIGNING_SOFT_RANDOMSEED_PIN 0
#define MY_SIGNING_ATSHA204

// Defining Node ID
#define MY_NODE_ID 1

#define MY_BAUD_RATE 9600

// Enable and select radio type attached
#define MY_RADIO_RF24

#include <MySensors.h>

#define SENSOR_ID 0

#define MESSAGEWAIT 50      // ms to wait between each send message
#define SLEEP_IN_MS 1800000 // ms to sleep between sensor measurements
#define MAX_RESEND_COUNT 3  // if a send message got no acknowledge message the sensor tries to send the message again but at most MAX_RESEND_COUNT times. Set to 1 for no resending.

#define PWM_WAIT_MS 200 // amount of ms to wait for the pwm signal to start up and the sensor values to settle

// Needed for conversion from raw sensor values to percentages
// calibrate in air and a glass of water with CALIBRATION_MODE and serial monitor
#define AIR_SENSOR_VALUE 152
#define WATER_SENSOR_VALUE 556

#define ABSOLUTE_CHANGE 4 // Sensor value will only be send if the absolute change compared to the last measured raw sensor value is at least this

// Values for battery measurements
const float VccMin = 2.4; // 8 MHz arduino runs reliably down to 2.4V (see datasheet)
const float VccMax = 3;   // 2 AAA = 3V

// these are used for checking if the current measurement has changed compared to the last one
int oldBatLevel;
int oldSensorVal;

int n_reads = 1;                // number of measurements to average over. Multiple measurements might increase repeatability but also increase battery consumption.
int wait_between_reads_ms = 20; // amount of ms to wait between multiple reads

MyMessage msgSensor(SENSOR_ID, V_HUM);

void presentation()
{
  // Send the sketch version information to the gateway and Controller
  sendSketchInfo("Capacitive Soil Moisture Sensor", "1.0");
  sleep(MESSAGEWAIT);

  present(SENSOR_ID, S_HUM);
  sleep(MESSAGEWAIT);
}

void startPWMSignal()
{
  TCCR2A = (1 << COM2B1) | (1 << WGM21) | (1 << WGM20); // Clear OC2B on Compare Match, Mode 7 - Fast PWM
  TCCR2B = (1 << WGM22) | (1 << CS20);                  // no clock prescaling

  // Note: Somehow the software and/or hardware configuration did not allow setting a lower OCR2A value to increase the frequency.
  // Each time I tried increasing the frequency while keeping the duty cycle at 50 percent the output of the capacitive probe was a constant regardless of the surrounding material.
  // If you know what is going on here I would be more than happy if you could shed some light on it in the GitHub discussion area.

  OCR2A = 7; // OCR2A is set as top so clock is divided by 8 -> 1 MHz output frequency max.
  OCR2B = 3; // 50 percent duty cycle
}

void stopPWMSignal()
{
  // Set the timers back to normal
  TCCR2A = 0;
  TCCR2B = 0;
}

void setup()
{
  pinMode(3, OUTPUT);
  pinMode(A0, INPUT);

  oldBatLevel = 200;
  oldSensorVal = -1023;
}

void resendbatterylevel(int batlevel)
{
  int repeat = 0;

  while (repeat < MAX_RESEND_COUNT)
  {
    if (sendBatteryLevel(batlevel))
    {
#ifdef MY_DEBUG
      Serial.print("Battery level send succesfully. Number of tries: ");
      Serial.println(++repeat);
#endif
      break;
    }
    else if (++repeat < MAX_RESEND_COUNT) // only sleep if it is not our last repeat
    {
      sleep(MESSAGEWAIT);
    }
#ifdef MY_DEBUG
    Serial.print("Battery send error ");
    Serial.println(repeat);
#endif
  }
}

void resend(MyMessage &msg)
{
  int repeat = 0;

  while (repeat < MAX_RESEND_COUNT)
  {
    if (send(msg))
    {
#ifdef MY_DEBUG
      Serial.print("Message send succesfully. Number of tries: ");
      Serial.println(++repeat);
#endif
      break;
    }
    else if (++repeat < MAX_RESEND_COUNT) // only sleep if it is not our last repeat
    {
      sleep(MESSAGEWAIT);
    }
#ifdef MY_DEBUG
    Serial.print("Error ");
    Serial.println(repeat);
#endif
  }
}

int read_sensor()
{
  startPWMSignal();
  delay(PWM_WAIT_MS); // let the PWM signal start up and the sensor values settle

  float sensor_value = 0;
  for (int i = 0; i < n_reads; ++i)
  {
    sensor_value += analogRead(A0);

    // only wait for next measurement if it is not the last one
    if (i + 1 < n_reads)
    {
      delay(wait_between_reads_ms);
    }
  }
  sensor_value /= n_reads;

  stopPWMSignal();

  return 1023 - (int)sensor_value;
}

void sendValue()
{
  int sensorVal = read_sensor(); // read raw sensor value
  if (abs(oldSensorVal - sensorVal) >= ABSOLUTE_CHANGE)
  {
    // convert raw sensor value to percent
    sensorVal = map(sensorVal, AIR_SENSOR_VALUE, WATER_SENSOR_VALUE, 0, 100);
    sensorVal = constrain(sensorVal, 0, 100);

    resend(msgSensor.set(sensorVal, 2));
    oldSensorVal = sensorVal;
  }

  int batLevel = map(hwCPUVoltage(), VccMin * 1000, VccMax * 1000, 0, 100); // * 1000, because 'hwCPUVoltage' reads the voltage in millivolts
  batLevel = constrain(batLevel, 0, 100);
  if (batLevel != oldBatLevel)
  {
    resendbatterylevel(batLevel);
    oldBatLevel = batLevel;
  }
}

void loop()
{
#ifndef CALIBRATION_MODE
  sendValue();
  sleep(SLEEP_IN_MS);
#endif

#ifdef CALIBRATION_MODE
  int sensorVal = read_sensor();
  Serial.println(sensorVal);
  wait(500);
#endif
} // end of loop
