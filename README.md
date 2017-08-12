# CCCVPedals

Ctrl+C & Ctrl+V Pedals

This arduino sketch is a necessary tool for every "efective" programmer.

It is was developed and tested on Medion gaming pedals, which contains 2 48kOhm potentiometers. One is connected to analog pin A0, second one to A1. The board used is a cheap one 16MHz Arduino Pro https://store.arduino.cc/arduino-pro-mini

The USB inferfaces is done using V-USB within library https://github.com/gloob/vusb-for-arduino and compiled in Arduino IDE 0023. The newer versions is not working. 

For compiling on Ubuntu 16.04 with current avr-lib I had to encapsulate /usr/bin/avr-gcc with custom script replacing parameter:

"-assembler-with-cpp" with "-x assembler-with-cpp"

sudo mv /usr/bin/avr-gcc /usr/bin/avr-gcc_orig
sudo cp <this project clone>/avr-gcc /usr/bin/avr-gcc
