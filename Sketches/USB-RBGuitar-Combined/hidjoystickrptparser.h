#if !defined(__HIDJOYSTICKRPTPARSER_H__)
#define __HIDJOYSTICKRPTPARSER_H__

#include <usbhid.h>

extern bool DEBUG_PRINT;
extern bool isKeyboard;
extern bool isMustang;
extern bool isOtherMatch; //Used for normal guitar

struct GamePadEventData {
        uint8_t b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16;
};

class JoystickEvents {
public:
        virtual void OnGamePadChanged(/*const*/ GamePadEventData *evt);
};

#define RPT_GEMEPAD_LEN		16

class JoystickReportParser : public HIDReportParser {
        JoystickEvents *joyEvents;

        uint8_t oldPad[RPT_GEMEPAD_LEN];

public:
        JoystickReportParser(JoystickEvents *evt);

        virtual void Parse(USBHID *hid, bool is_rpt_id, uint8_t len, uint8_t *buf);
};

#endif // __HIDJOYSTICKRPTPARSER_H__
