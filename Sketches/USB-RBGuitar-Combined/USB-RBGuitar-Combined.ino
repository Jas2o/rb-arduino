#include <usbhid.h>
#include <hiduniversal.h>
#include <usbhub.h>

// Satisfy IDE, which only needs to see the include statment in the ino.
#ifdef dobogusinclude
#include <spi4teensy3.h>
#include <SPI.h>
#endif

#include "hidjoystickrptparser.h"

USB Usb;
USBHub Hub(&Usb);
HIDUniversal Hid(&Usb);
JoystickEvents JoyEvents;
JoystickReportParser Joy(&JoyEvents);

bool DEBUG_PRINT = false;

//No touchy
bool PS3Setup = false;
bool isKeyboard = false; //Detected by USB device's VID/PID
bool isMustang = false;
bool isOtherMatch = false;

void setup() {
  Serial.begin(115200);
#if !defined(__MIPSEL__)
  while (!Serial); // Wait for serial port to connect - used on Leonardo, Teensy and other boards with built-in USB CDC serial connection
#endif
  if (Usb.Init() == -1) {
    if(DEBUG_PRINT)
      Serial.println("OSC did not start.");
    while (1); //halt
  }

  delay(200);

  if (!Hid.SetReportParser(0, &Joy))
    ErrorMessage<uint8_t > (PSTR("SetReportParser"), 1);
}

void loop() {
  Usb.Task();

  if (!PS3Setup && Usb.getUsbTaskState() == 144) {
    delay(100);

    byte data[40] = { 0xE9, 0x00, 0x89, 0x1B, 0x00,
                      0x00, 0x00, 0x02, 0x00, 0x00,
                      0x00, 0x00, 0x00, 0x00, 0x00,
                      0x00, 0x00, 0x00, 0x00, 0x00,
                      0x00, 0x80, 0x00, 0x00, 0x00,
                      0x00, 0x89, 0x00, 0x00, 0x00,
                      0x00, 0x00, 0xE9, 0x01, 0x00,
                      0x00, 0x00, 0x00, 0x00, 0x00
                    };
    
    int result = Usb.ctrlReq(
                   Hid.GetAddress(), //addr ??????
                   0, //ep
                   0x21, //bmReqType
                   0x09, //bRequest
                   0x00, //wValLo
                   0x03, //wValHi
                   0x00, //wInd
                   40, //total
                   sizeof(data) / sizeof(byte), //nbytes
                   data,
                   NULL //USBReadParser * p
                 );

    if (result == 0)
      PS3Setup = true;

    if(DEBUG_PRINT) {
      Serial.print("Result of PS3 setup command is: 0x");
      Serial.println(result);
    }

    //--

    uint8_t rcode = 0;
    byte num_conf = 0;
   
    USB_DEVICE_DESCRIPTOR buf;
    rcode = Usb.getDevDescr(1, 0, 0x12, ( uint8_t *)&buf );
    if( rcode ) {
      if(DEBUG_PRINT) {
        Serial.print("USB ERROR: "); Serial.println( rcode );
      }
      while (1);
    }

    if(DEBUG_PRINT) {
      Serial.print("VID: 0x"); Serial.print(buf.idVendor, HEX);
      Serial.print(" PID: 0x"); Serial.println(buf.idProduct, HEX);
    }

    if(buf.idVendor == 0x12BA || buf.idVendor == 0x1BAD) { //PS3 or Wii
      //PS3 Keyboard, PS3 MPA Keys, Wii Keyboard, Wii MPA Keys (not tested)
      if(buf.idProduct == 0x2330 || buf.idProduct == 0x2338 || buf.idProduct == 0x3330 || buf.idProduct == 0x3338) {
        isKeyboard = true;
        if(DEBUG_PRINT)
          Serial.println("Keyboard");
      }

      //(not tested)
      //PS3 Mustang, PS3 MPA Guitar, Wii Mustang, Wii MPA Guitar
      else if(buf.idProduct == 0x2430 || buf.idProduct == 0x2538 || buf.idProduct == 0x3430 || buf.idProduct == 0x3538) {
        isMustang = true;
        if(DEBUG_PRINT)
          Serial.println("MIDI Guitar");
      }

      else {
        isOtherMatch = true;
        if(DEBUG_PRINT)
          Serial.println("Other (Guitar?)");
      }
    }
  }

}
