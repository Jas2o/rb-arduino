// Wired Xbox 360 Controller to Rock Band 1 Guitar for PS3/PS4

/*
 Example sketch for the Xbox 360 USB library - developed by Kristian Lauszus
 For more information visit my blog: http://blog.tkjelectronics.dk/ or
 send me an e-mail:  kristianl@tkjelectronics.com
 */

#include <XBOXUSB.h>

// Satisfy IDE, which only needs to see the include statment in the ino.
#ifdef dobogusinclude
#include <spi4teensy3.h>
#include <SPI.h>
#endif

USB Usb;
XBOXUSB Xbox(&Usb);

//Switches
bool DEBUG_PRINT = false;
bool autoStrum = true;

void setup() {
  Serial.begin(115200);
#if !defined(__MIPSEL__)
  while (!Serial); // Wait for serial port to connect - used on Leonardo, Teensy and other boards with built-in USB CDC serial connection
#endif
  if(DEBUG_PRINT) Serial.println("Start");

  if (Usb.Init() == -1) {
    if(DEBUG_PRINT)
      Serial.print(F("\r\nOSC did not start"));
    while (1); //halt
  }

  delay(200);

}

//Temp values
int lastColors = 0x00; //Similar to b1
int lastB1 = 0x00;
int lastB2 = 0x00;
int lastB3 = 0x00;
int lastB6 = 0x00;
int lastB7 = 0x00;
int alreadyStrum = 0x08;
int effectNum = 0;
bool heldL1 = false;

void loop() {
  Usb.Task();

  byte b1 = 0x00; //ABXY
  byte b2 = 0x00; //Back, Xbox, Start
  byte b3 = 0x08; //D-Pad
  byte b6 = 0xFF; //Whammy - this is a test not connected value
  byte b7 = 0x00; //Effects - this is a test not connected value
  
  if (Xbox.Xbox360Connected) {
    b6 = 0x7F; //Whammy
    b7 = 0x7F; //Effects
  
    //D-Pad
    if (Xbox.getButtonPress(UP)) {
      if (Xbox.getButtonPress(RIGHT))
        b3 = 0x02;
      else if (Xbox.getButtonPress(LEFT))
        b3 = 0x07;
      else
        b3 = 0x00;
    }
    else if (Xbox.getButtonPress(DOWN)) {
      if (Xbox.getButtonPress(RIGHT))
        b3 = 0x03;
      else if (Xbox.getButtonPress(LEFT))
        b3 = 0x05;
      else
        b3 = 0x04;
    }
    else if (Xbox.getButtonPress(RIGHT))
      b3 = 0x02;
    else if (Xbox.getButtonPress(LEFT))
      b3 = 0x06;

    //Left joystick to whammy
    if (Xbox.getAnalogHat(LeftHatX) > 7500 || Xbox.getAnalogHat(LeftHatX) < -7500 || Xbox.getAnalogHat(LeftHatY) > 7500 || Xbox.getAnalogHat(LeftHatY) < -7500) {
      //If this is ever expanded for more fidelity, be aware that too many changes too frequently may fill the buffer and cause issues with controller getting going out of sync.
      
      if(Xbox.getAnalogHat(LeftHatX) <= -16383)
        b6 = 0x00;
      else if(Xbox.getAnalogHat(LeftHatX) >= 16383)
        b6 = 0xFF;
      else if(Xbox.getAnalogHat(LeftHatY) <= -16383)
        b6 = 0x00;
      else if(Xbox.getAnalogHat(LeftHatY) >= 16383)
        b6 = 0xFF;

      if(DEBUG_PRINT) {
        Serial.print(F("LeftHatX: "));
        Serial.print(Xbox.getAnalogHat(LeftHatX));
        Serial.print("\t");
      }
    }
  
    //Effects switch
    if (Xbox.getButtonPress(L1)) {
      if(!heldL1) {
        heldL1 = true;
        
        effectNum++;
        if(effectNum > 4)
          effectNum = 0;
      }
  
      if(effectNum == 0)
        b7 = 0xE5;
      else if(effectNum == 1)
        b7 = 0xB2;
      else if(effectNum == 2)
        b7 = 0x96;
      else if(effectNum == 3)
        b7 = 0x4C;
      else if(effectNum == 4)
        b7 = 0x19;
    } else
      heldL1 = false;
  
    //Colours
    if (Xbox.getButtonPress(A))
      b1 += 0x02; //Green
    if (Xbox.getButtonPress(B))
      b1 += 0x04; //Red
    if (Xbox.getButtonPress(Y))
      b1 += 0x08; //Yellow
    if (Xbox.getButtonPress(X))
      b1 += 0x01; //Blue
    if (Xbox.getButtonPress(R1))
      b1 += 0x10; //Orange
  
    if(autoStrum && !Xbox.getButtonPress(XBOX)) {
      bool strum = (b1 > lastColors);
      lastColors = b1;
      
      if(b1 != 0x00 && b3 == 0x08) { //Check the D-Pad wasn't already used
        if (alreadyStrum == 0x08) { //Was Neutral
          b3 = (strum ? 0x04 : 0x08);
        } else if (alreadyStrum == 0x04) { //Was Down
          b3 = (strum ? 0x00 : 0x04);
        } else if (alreadyStrum == 0x00) { //Was Up
          b3 = (strum ? 0x04 : 0x00);
        } else {
          b3 = 0x08;
        }
      }
      alreadyStrum = b3;
    }
  
    //Other buttons
    if (Xbox.getButtonPress(R2))
      b1 += 0x20; //Tilt
    if (Xbox.getButtonPress(L2))
      b1 += 0x40; //Solo
  
    if (Xbox.getButtonPress(START))
      b2 += 0x02;
    if (Xbox.getButtonPress(BACK))
      b2 += 0x01;
    //if (Xbox.getButtonPress(XBOX)) //Using for auto strum
      //b2 += 0x10; //this doesn't do anything on PS4
  }

  //If you continuously send data you run the risk of filling the LUFA firmware's buffer causing the controller button presses to go mental.
  if(lastB1 != b1 || lastB2 != b2 || lastB3 != b3 || lastB6 != b6 || lastB7 != b7) {
    lastB1 = b1;
    lastB2 = b2;
    lastB3 = b3;
    lastB6 = b6;
    lastB7 = b7;

    if(DEBUG_PRINT) {
      Serial.print(b1, HEX); //12BA-Colours-Tilt-Solo
      Serial.print(" ");
      Serial.print(b2, HEX); //+-H
      Serial.print(" ");
      Serial.print(b3, HEX); //D-Pad
      Serial.print(" ");
      Serial.print(0x80, HEX); //Left X - Static
      Serial.print(" ");
      Serial.print(0x80, HEX); //Left Y - Static
      Serial.print(" ");
      Serial.print(b6, HEX); //Right X - Whammy
      Serial.print(" ");
      Serial.print(b7, HEX); //Right Y - Effects
      Serial.println("");
    } else {
      uint8_t buf[28] = { b1, b2, b3, 0x80, 0x7F, b6, b7, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, /* */ 0x00 }; //With the joystick287 firmware
      Serial.write((uint8_t *)&buf, sizeof(buf));
    }
  }
}
