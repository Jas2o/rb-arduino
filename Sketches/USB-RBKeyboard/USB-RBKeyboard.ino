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
bool PS3Setup = false;

void setup() {
  Serial.begin(115200);
#if !defined(__MIPSEL__)
  while (!Serial); // Wait for serial port to connect - used on Leonardo, Teensy and other boards with built-in USB CDC serial connection
#endif
  //Serial.println("Start");
  if (Usb.Init() == -1) {
    //Serial.println("OSC did not start.");
  }

  delay(200);

  if (!Hid.SetReportParser(0, &Joy))
    ErrorMessage<uint8_t > (PSTR("SetReportParser"), 1);
}

void loop() {
  Usb.Task();

  byte data[40] = { 0xE9, 0x00, 0x89, 0x1B, 0x00,
                    0x00, 0x00, 0x02, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x80, 0x00, 0x00, 0x00,
                    0x00, 0x89, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0xE9, 0x01, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00
                  };

  if (!PS3Setup && Usb.getUsbTaskState() == 144) {
    delay(100);
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

    //Serial.print("Result of command is: 0x");
    //Serial.println(result);
  }

}

