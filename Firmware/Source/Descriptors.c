/*
             LUFA Library
     Copyright (C) Dean Camera, 2010.
              
  dean [at] fourwalledcubicle [dot] com
      www.fourwalledcubicle.com
*/

/*
  Copyright 2010  Dean Camera (dean [at] fourwalledcubicle [dot] com)

  Permission to use, copy, modify, distribute, and sell this 
  software and its documentation for any purpose is hereby granted
  without fee, provided that the above copyright notice appear in 
  all copies and that both that the copyright notice and this
  permission notice and warranty disclaimer appear in supporting 
  documentation, and that the name of the author not be used in 
  advertising or publicity pertaining to distribution of the 
  software without specific, written prior permission.

  The author disclaim all warranties with regard to this
  software, including all implied warranties of merchantability
  and fitness.  In no event shall the author be liable for any
  special, indirect or consequential damages or any damages
  whatsoever resulting from loss of use, data or profits, whether
  in an action of contract, negligence or other tortious action,
  arising out of or in connection with the use or performance of
  this software.
*/

/** \file
 *
 *  USB Device Descriptors, for library use when in USB device mode. Descriptors are special 
 *  computer-readable structures which the host requests upon device enumeration, to determine
 *  the device's capabilities and functions.  
 */

#include "Descriptors.h"

/** HID class report descriptor. This is a special descriptor constructed with values from the
 *  USBIF HID class specification to describe the reports and capabilities of the HID device. This
 *  descriptor is parsed by the host and its contents used to determine what data (and in what encoding)
 *  the device will send, and what it may be sent back from the host. Refer to the HID specification for
 *  more details on HID report descriptors.
 */
const USB_Descriptor_HIDReport_Datatype_t PROGMEM JoystickReport[] =
{
0x05, 0x01, 0x09, 0x05, 0xA1, 0x01, 0x15, 0x00, 0x25, 0x01, 0x35, 0x00, 0x45, 0x01, 0x75, 0x01,
0x95, 0x0D, 0x05, 0x09, 0x19, 0x01, 0x29, 0x0D, 0x81, 0x02, 0x95, 0x03, 0x81, 0x01, 0x05, 0x01,
0x25, 0x07, 0x46, 0x3B, 0x01, 0x75, 0x04, 0x95, 0x01, 0x65, 0x14, 0x09, 0x39, 0x81, 0x42, 0x65,
0x00, 0x95, 0x01, 0x81, 0x01, 0x26, 0xFF, 0x00, 0x46, 0xFF, 0x00, 0x09, 0x30, 0x09, 0x31, 0x09,
0x32, 0x09, 0x35, 0x75, 0x08, 0x95, 0x04, 0x81, 0x02, 0x06, 0x00, 0xFF, 0x09, 0x20, 0x09, 0x21,
0x09, 0x22, 0x09, 0x23, 0x09, 0x24, 0x09, 0x25, 0x09, 0x26, 0x09, 0x27, 0x09, 0x28, 0x09, 0x29,
0x09, 0x2A, 0x09, 0x2B, 0x95, 0x0C, 0x81, 0x02, 0x0A, 0x21, 0x26, 0x95, 0x08, 0xB1, 0x02, 0x0A,
0x21, 0x26, 0x91, 0x02, 0x26, 0xFF, 0x03, 0x46, 0xFF, 0x03, 0x09, 0x2C, 0x09, 0x2D, 0x09, 0x2E,
0x09, 0x2F, 0x75, 0x10, 0x95, 0x04, 0x81, 0x02, 0xC0 
/*
  0x05,0x01, // usage page (generic desktop)
  0x09,0x05, // Usage (Gamepad)
  0xa1,0x01, // Collection (Application)
  0x15,0x00, // Logical minimum (0)
  0x25,0x01, // Logical maximum (1)
  0x35,0x00, // Physical minimum (0)
  0x45,0x01, // Physical maximum (1)
  0x75,0x01, // Report size (1)
  0x95,0x0d, // Report Count (13)
  0x05,0x09, // Usage page (button)
  0x19,0x01, // Usage Minimum (button 1)
  0x29,0x0d, // Usage Maximum (button 13)
  0x81,0x02, // Input (Data, Variable, Abs)
  0x95,0x03, // Report size (3)
  0x81,0x01, // Input (data,var,abs)
  0x05,0x01, // Usage Page (Generic Desktop)
  0x25,0x07, // Logical Minimum (7)
  0x46,0x3b,0x01, // physical max 315
  0x75,0x04, // report size (4)
  0x95,0x01, // report count (1)
  0x65,0x14, // Unit (eng rot:angular pos),
  0x09,0x39, // Usage (Hat switch)
  0x81,0x42, // INPUT (Data,Var,Abs,Null)
  0x65,0x00,  // unit (none)
  0x95,0x01, // report count 1
  0x81,0x01,// Input (Cnst, Ary, Abs)
  0x26,0xff,0x00, // logical maximum 255
  0x46,0xff,0x00, // physical maximum 255
  0x09,0x30, // usage x
  0x09,0x31, // usage y
  0x09,0x32, // usage z
  0x09,0x35, // usage Rz
  0x75,0x08, // report size 8
  0x95,0x04, // report count 4
  0x81,0x02, // Input (Data,Var,Abs)
  0xC0
*/
};

/** Device descriptor structure. This descriptor, located in FLASH memory, describes the overall
 *  device characteristics, including the supported USB version, control endpoint size and the
 *  number of device configurations. The descriptor is read out by the USB host when the enumeration
 *  process begins.
 */
const USB_Descriptor_Device_t PROGMEM DeviceDescriptor =
{
	.Header                 = {.Size = sizeof(USB_Descriptor_Device_t), .Type = DTYPE_Device},
		
	.USBSpecification       = VERSION_BCD(01.10),
	.Class                  = 0x00,
	.SubClass               = 0x00,
	.Protocol               = 0x00,
	
	.Endpoint0Size          = FIXED_CONTROL_ENDPOINT_SIZE,
		
	.VendorID               = 0x12BA,
	.ProductID              = 0x0200,
	.ReleaseNumber          = 0x0313,
		
	.ManufacturerStrIndex   = 0x01,
	.ProductStrIndex        = 0x02,
	.SerialNumStrIndex      = NO_DESCRIPTOR,
		
	.NumberOfConfigurations = FIXED_NUM_CONFIGURATIONS
};

/** Configuration descriptor structure. This descriptor, located in FLASH memory, describes the usage
 *  of the device in one of its supported configurations, including information about any device interfaces
 *  and endpoints. The descriptor is read out by the USB host during the enumeration process when selecting
 *  a configuration so that the host may correctly communicate with the USB device.
 */
const USB_Descriptor_Configuration_t PROGMEM ConfigurationDescriptor =
{
	.Config = 
		{
			.Header                 = {.Size = sizeof(USB_Descriptor_Configuration_Header_t), .Type = DTYPE_Configuration},

			.TotalConfigurationSize = sizeof(USB_Descriptor_Configuration_t),
			.TotalInterfaces        = 1,
				
			.ConfigurationNumber    = 1,
			.ConfigurationStrIndex  = NO_DESCRIPTOR,
				
			.ConfigAttributes       = (USB_CONFIG_ATTR_BUSPOWERED /*| USB_CONFIG_ATTR_SELFPOWERED*/ ),
			
			.MaxPowerConsumption    = USB_CONFIG_POWER_MA(100)
		},
		
	.HID_Interface = 
		{
			.Header                 = {.Size = sizeof(USB_Descriptor_Interface_t), .Type = DTYPE_Interface},

			.InterfaceNumber        = 0x00,
			.AlternateSetting       = 0x00,
			
			.TotalEndpoints         = 2,
				
			.Class                  = 0x03,
			.SubClass               = 0x00,
			.Protocol               = HID_NON_BOOT_PROTOCOL,
				
			.InterfaceStrIndex      = NO_DESCRIPTOR
		},

	.HID_JoystickHID = 
		{
			.Header                 = {.Size = sizeof(USB_HID_Descriptor_t), .Type = DTYPE_HID},
			
			.HIDSpec                = VERSION_BCD(01.01),
			.CountryCode            = 0x00,
			.TotalReportDescriptors = 1,
			.HIDReportType          = DTYPE_Report,
			.HIDReportLength        = sizeof(JoystickReport)
		},

	.HID_ReportOUTEndpoint = 
		{
			.Header                 = {.Size = sizeof(USB_Descriptor_Endpoint_t), .Type = DTYPE_Endpoint},
			
			.EndpointAddress        = (ENDPOINT_DESCRIPTOR_DIR_OUT | JOYSTICK_EPNUM2),
			.Attributes             = (EP_TYPE_INTERRUPT | ENDPOINT_ATTR_NO_SYNC | ENDPOINT_USAGE_DATA),
			.EndpointSize           = JOYSTICK_EPSIZE2,
			.PollingIntervalMS      = 0x0A
		},

	.HID_ReportINEndpoint = 
	{
		.Header                 = {.Size = sizeof(USB_Descriptor_Endpoint_t), .Type = DTYPE_Endpoint},
		
		.EndpointAddress        = (ENDPOINT_DESCRIPTOR_DIR_IN | JOYSTICK_EPNUM),
		.Attributes             = (EP_TYPE_INTERRUPT | ENDPOINT_ATTR_NO_SYNC | ENDPOINT_USAGE_DATA),
		.EndpointSize           = JOYSTICK_EPSIZE,
		.PollingIntervalMS      = 0x0A
	}
};

/** Language descriptor structure. This descriptor, located in FLASH memory, is returned when the host requests
 *  the string descriptor with index 0 (the first index). It is actually an array of 16-bit integers, which indicate
 *  via the language ID table available at USB.org what languages the device supports for its string descriptors.
 */
const USB_Descriptor_String_t PROGMEM LanguageString =
{
	.Header                 = {.Size = USB_STRING_LEN(1), .Type = DTYPE_String},
		
	.UnicodeString          = {LANGUAGE_ID_ENG}
};

/** Manufacturer descriptor string. This is a Unicode string containing the manufacturer's details in human readable
 *  form, and is read out upon request by the host when the appropriate string ID is requested, listed in the Device
 *  Descriptor.
 */
const USB_Descriptor_String_t PROGMEM ManufacturerString =
{
	.Header                 = {.Size = USB_STRING_LEN(4), .Type = DTYPE_String},
		
	.UnicodeString          = L"Sony" //Licensed by Sony Computer Entertainment America
};

/** Product descriptor string. This is a Unicode string containing the product's details in human readable form,
 *  and is read out upon request by the host when the appropriate string ID is requested, listed in the Device
 *  Descriptor.
 */
const USB_Descriptor_String_t PROGMEM ProductString =
{
	.Header                 = {.Size = USB_STRING_LEN(33), .Type = DTYPE_String},
		
	.UnicodeString          = L"Harmonix Guitar for PlayStation®3"
};

/** This function is called by the library when in device mode, and must be overridden (see library "USB Descriptors"
 *  documentation) by the application code so that the address and size of a requested descriptor can be given
 *  to the USB library. When the device receives a Get Descriptor request on the control endpoint, this function
 *  is called so that the descriptor details can be passed back and the appropriate descriptor sent back to the
 *  USB host.
 */
uint16_t CALLBACK_USB_GetDescriptor(const uint16_t wValue,
                                    const uint8_t wIndex,
                                    void** const DescriptorAddress)
{
	const uint8_t  DescriptorType   = (wValue >> 8);
	const uint8_t  DescriptorNumber = (wValue & 0xFF);

	void*    Address = NULL;
	uint16_t Size    = NO_DESCRIPTOR;

	switch (DescriptorType)
	{
		case DTYPE_Device:
			Address = (void*)&DeviceDescriptor;
			Size    = sizeof(USB_Descriptor_Device_t);
			break;
		case DTYPE_Configuration: 
			Address = (void*)&ConfigurationDescriptor;
			Size    = sizeof(USB_Descriptor_Configuration_t);
			break;
		case DTYPE_String: 
			switch (DescriptorNumber)
			{
				case 0x00: 
					Address = (void*)&LanguageString;
					Size    = pgm_read_byte(&LanguageString.Header.Size);
					break;
				case 0x01: 
					Address = (void*)&ManufacturerString;
					Size    = pgm_read_byte(&ManufacturerString.Header.Size);
					break;
				case 0x02: 
					Address = (void*)&ProductString;
					Size    = pgm_read_byte(&ProductString.Header.Size);
					break;
			}
			
			break;
		case DTYPE_HID: 
			Address = (void*)&ConfigurationDescriptor.HID_JoystickHID;
			Size    = sizeof(USB_HID_Descriptor_t);
			break;
		case DTYPE_Report: 
			Address = (void*)&JoystickReport;
			Size    = sizeof(JoystickReport);
			break;
	}
	
	*DescriptorAddress = Address;
	return Size;
}
