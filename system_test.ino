#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEServer.h>
#include <Stepper.h>

const int stepsPerRevolution = 200;

// See the following for generating UUIDs:
// https://www.uuidgenerator.net/

#define SERVICE_UUID        "4fafc201-1fb5-459e-8fcc-c5c9c331914b"
#define CHARACTERISTIC_UUID "beb5483e-36e1-4688-b7f5-ea07361b26a8"

Stepper myStepper0(stepsPerRevolution, 18, 0, 5, 0);
Stepper myStepper1(stepsPerRevolution, 17, 0, 16, 0);
Stepper myStepper2(stepsPerRevolution, 26, 0, 27, 0);
Stepper myStepper3(stepsPerRevolution, 14, 0, 12, 0);
//5,16
float n0;
float n1;
float n2;
float n3;
float numPerChip = 21;
int getTotal (char hex1, char hex0){
  int a = getValue(hex1);
  int b = getValue(hex0);
  return a+b;
  }

int getValue ( char hex){
  int val;
  if ( hex == '0'){
   val = 0;
   }
  else if ( hex == '1'){
   val = 1;
    }
  else if ( hex == '2'){
   val = 2;
    }
  else if ( hex == '3'){
   val = 3;
    }
  else if ( hex == '4'){
   val = 4;
    }
  else if ( hex == '5'){
   val = 5;
    }
  else if ( hex == '6'){
   val = 6;
    }
  else if ( hex == '7'){
   val = 7;
    }
  else if ( hex == '8'){
   val = 8;
    }
  else if ( hex == '9'){
   val = 9;
    }
  else if ( hex == 'A'){
   val = 10;
    }
  else if ( hex == 'B'){
   val = 11;
    }
  else if ( hex == 'C'){
   val = 12;
    }
  else if ( hex == 'D'){
   val = 13;
    }
  else if ( hex == 'E'){
   val = 14;
    }
  else{
   val = 15;
    }
  return val;
  }

float runMotor(Stepper myStepper, float n, unsigned char val, int STATE){
    int x; 
    int y = 22;
    int motorSpeed =  75;
    if (n + val >= 25){
          n = 25;
          x = floor((25 - n)*numPerChip);
          }
        else{
          n+=val;
          x = floor(val*numPerChip);
          }
    if(n < 1.0 and n >= 0 and val > 0){
      for(int i=0;i<x;i++){
        motorSpeed = 50;       
        myStepper.setSpeed(motorSpeed);
        myStepper.step(-1);
      }
    }
    else if (n >= 1.0 and n < 25 and val > 0) { 
      for(int i=0;i<x;i++){
        motorSpeed = 75;
        myStepper.setSpeed(motorSpeed);
        myStepper.step(-1);
         }
    }
     else {
        myStepper.step(0);
      }
    
    Serial.println(n);
    return n;
}

int collectVal(int red, int white, int green, int blue){
  int SendToUser = 0;
  SendToUser += red;
  SendToUser += white<<8;
  SendToUser += green<<16;
  SendToUser += blue<<24;
  return SendToUser;
  }

int up (Stepper myStepper, int pinNum){
      int n = 0;
      int pin = 0;
      for(int i=0;i<=round(25*numPerChip);i++) {
        pin = digitalRead(pinNum);
        if (pin == LOW){
        myStepper.setSpeed(75);
        myStepper.step(-1);
        n+=1;
        }
        else{
          break;
          }
    }
    return n;
  }
  
void down(Stepper myStepper, int n){
  for(int i=0;i<round(n*numPerChip);i++){
      myStepper.setSpeed(75);
      myStepper.step(1);
  }
}


class MyCallbacks: public BLECharacteristicCallbacks
{

  void onWrite(BLECharacteristic *pCharacteristic)
  {
    
    std::string value = pCharacteristic->getValue();
    char state = (char) value[0];
    char val0 = (char) value[1];
    char val1 = (char) value[2];
    char val2 = (char) value[3];
    char val3 = (char) value[4];
    char val4 = (char) value[5];
    char val5 = (char) value[6];
    char val6 = (char) value[7];
    char val7 = (char) value[8];

    if (value.length() > 0)
    {
      Serial.println("*********");
      Serial.print("New value: ");
      Serial.print(state);
      Serial.print(" ");
      Serial.print(val0);
      Serial.print(" ");
      Serial.print(val1);
      Serial.print(" ");
      Serial.print(val2);
      Serial.print(" ");
      Serial.print(val3);
      Serial.print(" ");
      Serial.print(val4);
      Serial.print(" ");
      Serial.print(val5);
      Serial.print(" ");
      Serial.print(val6);
      Serial.print(" ");
      Serial.print(val7);
      Serial.print(" ");
      Serial.println();
      Serial.println("*********");
    }
  
  int STATE = getValue(state);

  int chip0 = getTotal( val0, val1);
  int chip1 = getTotal( val2, val3);
  int chip2 = getTotal( val4, val5);
  int chip3 = getTotal( val6, val7);

  if (STATE == 1){
    down(myStepper0, round(n0));
    down(myStepper1, round(n1));
    down(myStepper2, round(n2));
    delay(1);
    down(myStepper3, round(n3));
    }


  else if(STATE == 2){
  //  Serial.println(n0);
    int count0 = up(myStepper0,35);
    delay(1);
    int count1 = up(myStepper1,32);
    delay(1);
    int count2 = up(myStepper2,33);
    delay(1);
    int count3 = up(myStepper3,25);
    float cur_stack0 = 25 - n0;
    float cur_stack1 = 25 - n1;
    float cur_stack2 = 25 - n2;
    float cur_stack3 = 25 - n3;
    count0 = round(25 - count0/numPerChip - cur_stack0);
    count1 = round(25 - count1/numPerChip - cur_stack1);
    count2 = round(25 - count2/numPerChip - cur_stack2);
    count3 = round(25 - count3/numPerChip - cur_stack3);
    Serial.println(count0);
    Serial.println(count1);
    Serial.println(count2);
    Serial.println(count3);
    int userData = collectVal(count0,count1,count2,count3);
    delay(10);
    pCharacteristic->setValue(userData);

    cur_stack0 += count0;
    cur_stack1 += count1;
    cur_stack2 += count2;
    cur_stack3 += count3;
    
    n0 = 25 - cur_stack0;
    n1 = 25 - cur_stack1;
    n2 = 25 - cur_stack2;
    n3 = 25 - cur_stack3;

    down(myStepper0, round(n0));
    down(myStepper1, round(n1));
    down(myStepper2, round(n2));
    down(myStepper3, round(n3));

  }
 else {
  n0 = runMotor( myStepper0, n0, chip0, STATE);
  n1 = runMotor( myStepper1, n1, chip1, STATE);
  n2 = runMotor( myStepper2, n2, chip2, STATE);
  n3 = runMotor( myStepper3, n3, chip3, STATE);
 }
  }
};

int stepCount = 0;

void setup()
{
  Serial.begin(115200);
  pinMode(19, OUTPUT);
  pinMode(18, OUTPUT);
  pinMode(5,  OUTPUT);
  pinMode(17, OUTPUT);
  pinMode(16, OUTPUT);
  pinMode(35, INPUT); // Switch 0
  pinMode(32, INPUT); // Switch 1
  pinMode(33, INPUT); // Switch 2
  pinMode(25, INPUT); // Switch 3
  pinMode(3,OUTPUT);
  Serial.println("READY");


  BLEDevice::init("Poker-Chip-Counting-Companion");
  BLEServer *pServer = BLEDevice::createServer();

  BLEService *pService = pServer->createService(SERVICE_UUID);

  BLECharacteristic *pCharacteristic = pService->createCharacteristic(
                                         CHARACTERISTIC_UUID,
                                         BLECharacteristic::PROPERTY_READ |
                                         BLECharacteristic::PROPERTY_WRITE
                                       );
  
  pCharacteristic->setCallbacks(new MyCallbacks());
//  int send_to_phone = 370546198;
//  pCharacteristic->setValue(send_to_phone);
  pService->start();

  BLEAdvertising *pAdvertising = pServer->getAdvertising();
  pAdvertising->start();
}

void loop()
{
  delay(2000);
  
}
