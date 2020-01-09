# cat /proc/asound/cards

p281:/sdcard # cat /proc/asound/cards                                                            
 0 [AMLM8AUDIO     ]: AML-M8AUDIO - AML-M8AUDIO
                      AML-M8AUDIO
 1 [CameraB409241  ]: USB-Audio - USB Camera-B4.09.24.1
                      OmniVision Technologies, Inc. USB Camera-B4.09.24.1 at usb-xhci-hcd.0.auto-2, h


# tinymix -D 1

p281:/sdcard # tinymix -D 1                                                                      
Mixer name: 'USB Camera-B4.09.24.1'
Number of controls: 2
ctl	type	num	name                                     value
0	INT	4	Capture Channel Map                      0 0 0 0
1	INT	4	Mic Capture Volume                       -1 -1 -1 -1


# tinycap /sdcard/record.wav -D 1 -r 16000 -b 16 -c 4


# /sys/bus/usb/devices/
