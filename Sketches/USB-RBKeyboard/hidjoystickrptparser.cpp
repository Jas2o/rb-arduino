#include "hidjoystickrptparser.h"

JoystickReportParser::JoystickReportParser(JoystickEvents *evt) : joyEvents(evt) {
}

void JoystickReportParser::Parse(USBHID *hid, bool is_rpt_id, uint8_t len, uint8_t *buf) {
  bool match = true;

  // Checking if there are changes in report since the method was last called
  for (uint8_t i = 0; i < RPT_GEMEPAD_LEN; i++)
    if (buf[i] != oldPad[i]) {
      match = false;
      break;
    }

  // Calling Game Pad event handler
  if (!match && joyEvents) {
    joyEvents->OnGamePadChanged((/*const*/ GamePadEventData*)buf);
  }
}

/*
//http://www.phanderson.com/arduino/arduino_display.html
void print_binary(int v) {
  int num_places = 8;
  int mask = 0, n;

  for (n = 1; n <= num_places; n++)
    mask = (mask << 1) | 0x0001;
  v = v & mask;  // truncate v to specified number of places

  while (num_places) {
    if (v & (0x0001 << num_places - 1))
      Serial.print("1");
    else
      Serial.print("0");

    --num_places;
  }
}
*/

int lastB1 = 0x00;
//int lastB3 = 0x08;
int alreadyStrum = 0x08;

// I'm just interested in the raw data
void JoystickEvents::OnGamePadChanged(/*const*/ GamePadEventData *evt) {
  if (evt->b15 == 0x00) {
    //Serial.println("Guitar");
  } else {
    //Serial.println("Keyboard");

    // Inject colours and strum
    //int lastB1 = evt->b1;
    bool strum = false;
    if ( bitRead(evt->b7, 3) | bitRead(evt->b6, 7) ) {
      evt->b1 += 0x02; //Green
      strum = true;
    }
    if ( bitRead(evt->b7, 1) | bitRead(evt->b6, 5) ) {
      evt->b1 += 0x04; //Red
      strum = true;
    }
    if ( bitRead(evt->b8, 7) | bitRead(evt->b6, 3) ) {
      evt->b1 += 0x08; //Yellow
      strum = true;
    }
    if ( bitRead(evt->b8, 6) | bitRead(evt->b6, 2) ) {
      evt->b1 += 0x01; //Blue
      strum = true;
    }
    if ( bitRead(evt->b8, 4) | bitRead(evt->b6, 0) ) {
      evt->b1 += 0x10; //Orange
      strum = true;
    }

    if (strum) {
      if (evt->b1 <= lastB1)
        strum = false;
    }
    lastB1 = evt->b1;

    if(evt->b3 == 0x08) { //Check the D-Pad wasn't already used
      if (evt->b1 == 0x00) {
         evt->b3 = 0x08;
      } else {
        if (alreadyStrum == 0x08) { //Was Neutral
          if (strum) {
            evt->b3 = 0x04;
          } else
            evt->b3 = 0x08;
        } else if (alreadyStrum == 0x04) { //Was Down
          if (strum) {
            evt->b3 = 0x00;
          } else
            evt->b3 = 0x04;
        } else if (alreadyStrum == 0x00) { //Was Up
          if (strum) {
            evt->b3 = 0x04;
          } else
            evt->b3 = 0x00;
        } else {
          evt->b3 = 0x08;
        }
      }
    }
    alreadyStrum = evt->b3;

    if (bitRead(evt->b14, 7)) evt->b1 += 0x20; //Overdrive/Tilt
    if ((evt->b6 > 0)) evt->b1 += 0x40; //Solo fret
    if (bitRead(evt->b9, 7)) evt->b1 += 0x10; // Lone orange key, will not strum

    int effect = 0x7F;
    if ( bitRead(evt->b7, 2) ) effect = 0xE5;
    else if ( bitRead(evt->b7, 0) ) effect = 0xB2;
    else if ( bitRead(evt->b8, 5) ) effect = 0x96;
    else if ( bitRead(evt->b8, 3) ) effect = 0x4C;
    else if ( bitRead(evt->b8, 1) ) effect = 0x19;
    evt->b7 = effect;

    evt->b6 = 127 - evt->b16; //Slider (Whammy)

    //print_binary(evt->b15); //Pedal
  }

/*
  Serial.print(evt->b1, HEX); //12BA-Colours-Tilt-Solo
  Serial.print(" ");
  Serial.print(evt->b2, HEX); //+-H
  Serial.print(" ");
  Serial.print(evt->b3, HEX); //D-Pad
  Serial.print(" ");
  Serial.print(0x80, HEX); //Left X - Static
  Serial.print(" ");
  Serial.print(0x80, HEX); //Left Y - Static
  Serial.print(" ");
  Serial.print(evt->b6, HEX); //Right X - Whammy
  Serial.print(" ");
  Serial.print(evt->b7, HEX); //Right Y - Effects
  Serial.println("");
*/

  //uint8_t buf[8] = { 0 }; //With the joystick7 firmware we send a buffer of 8, last one is a spacer
  uint8_t buf[28] = { 0x00, 0x00, 0x08, 0x80, 0x7F, 0x80, 0x7F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, /* */ 0x00 }; //With the joystick287 firmware
  int i = 0; buf[i++] = evt->b1; buf[i++] = evt->b2; buf[i++] = evt->b3; buf[i++] = evt->b4; buf[i++] = evt->b5; buf[i++] = evt->b6; buf[i++] = evt->b7;
  Serial.write((uint8_t *)&buf, sizeof(buf));
}

