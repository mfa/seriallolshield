// -*- mode: c -*-
#include <Charliplexing.h>

int data;
int length = 0;
int line = 0;

void lit_line(int line, int length){
  // line: 0..8, length: 0..13
  for(uint8_t y = 0;y < length;y++) {
    LedSign::Set(y, line, 1);
  }
}

void clear_line(int line) {
  // line: 0..8
  for(uint8_t y = 0;y < 14;y++) {
    LedSign::Set(y, line, 0);
  }
}

void reset_all(){
  for(uint8_t y = 0;y < 14;y++) {
    for(uint8_t x = 0;x < 9;x++) {
      LedSign::Set(y,x,0);
    }
  }
}

void setup() {
  LedSign::Init();
  lit_line(0, 1);
  Serial.begin(9600);
}

void loop(){
  if(Serial.available() > 0) {
    data = Serial.read();
  }
  if(data == 83) {
    // 'S' for reset
    line = 0;
    length = 0;
    reset_all();
    data = 0;
  }
  else if(data == 88) {
    // 'X' for activate all LEDs
    for(uint8_t line = 0;line < 9;line++) {
      lit_line(line, 14);
    }
    data = 0;
  }
  else if(data == 89) {
    // 'Y' for clear line
    clear_line(line);
    data = 0;
  }
  else if(data == 90) {
    // 'Z' for show
    lit_line(line, length);
    data = 0;
  }
  else if(data >=0) {
    if(data > 48 && data < 58) {
      // 1..9 -> 0..8
      line = data - 49;
    }
    if(data > 64 && data < 79) {
      // y = A B C D E  F G H I J  K L M N
      length = data - 64;
    }
  }
}
