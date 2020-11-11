import processing.serial.*;

Serial port;


int scene = 0;

int t_start;//現在の状態になった時刻[ミリ秒]
float time;//現在の状態になってからの経過時間[秒]
int time1 = 2;//2秒
int portread = 256;//Arduinoからの信号受け取り用変数

void setup(){
  size(400,250);
  port = new Serial(this, "/dev/cu.usbmodem14101",9600);
  t_start = millis();
}

void draw(){
  background(0);
  time = (millis() - t_start) / 1000.0;//経過時間を更新
  //println(t_start);
  println(time);
  if(scene == 0){//最初
    mu();
    if(time > time1){
      scene = 1;
    }
  }else if(scene == 1){//電源入った時
    
    port.write("1");
    portread = port.read();
    if(portread == 1){
      port.write("2");
     }
    portread = port.read();
    if(portread ==2){
      ok();
    }
  }
}


void ok(){
    fill(#006400);
    textSize(75);
    text("OK!",width/3,height/2);
}

void mu(){
    fill(#006400);
    ellipse(150,75,20,20);
    ellipse(width-150,75,20,20);
    rect(150,150,100,20);//無表情
}
