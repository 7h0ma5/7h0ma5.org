---
title: Serial Connection between Rasperry Pi and Arduino
published: 2012-07-05T13:00:00Z
tags: arduino,raspberry pi,connection,uart,serial,direct
image: http://data.7h0ma5.org/images/tech/rbpi-arduino.png
category: technic
---

My Raspberry Pi finally arrived yesterday and the first thing i wanted
to try was a serial connection to an Arduino. This is a little bit
tricky as the serial port of the Arduino runs on 5 volts and Raspberry
Pi’s on 3.3 volts. If the TX port of the Ardunio was directly
connected to the RX port of the Raspberry Pi the higher voltage could
possibly brick the device. The Arduino however is fine with just 3.3
volts on its RX port. So in order to connect the devices properly I
had to use a voltage divider:

![](http://data.7h0ma5.org/images/tech/rbpi-arduino.png)

If you are in the posession of an Arduino Mega, you can connect the
serial port of the Raspberry Pi via the Arduino with your Ccomputer
without a special connector. The Raspberry Pi is connected with on
third serial port of the Ardunino Mega and the Arduino Mega is
connected via USB to your computer. The following program lets the
Arduino forward all serial packets to either the Raspberry Pi or the
Computer:

``` cpp
void setup() {
    Serial.begin(115200);
    Serial3.begin(115200);
}
void loop() {
    if (Serial.available() > 0) {
        Serial3.write(Serial.read());
    }
    if (Serial3.available() > 0) {
        Serial.write(Serial3.read());
    }
}
```

Now you can connect directly from your computer to the Raspberry Pi
via the tty-device of the Arduino, in my case `/dev/ttyACM0`.