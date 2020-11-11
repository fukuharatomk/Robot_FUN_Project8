#include<Servo.h>

//Servo servo1;
Servo servo2;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  //servo1.attach(4);
  servo2.attach(5);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available() > 0) {

    // 受信したデータを読み込む
    int data = Serial.read();

    if (data == '1') {
      servo2.write(90);
      Serial.write(1);
    }

    if (data == '2') {
      servo2.write(0);
      Serial.write(2);
    }
  }
}
