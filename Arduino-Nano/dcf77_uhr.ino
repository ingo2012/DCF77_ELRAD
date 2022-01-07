// IGE 1.0 08.12.2021
// IGE 1.1 04.01.2022 , Anpassung Inv. NonInv Signal per PIN

// DCF77 Uhr mit Elrad DCF-RX , Elrad 04/88
//
// https://playground.arduino.cc/Code/DCF77/
// https://www.rc-modellbau-portal.de/index.php?threads/arduino-mit-dcf77-modul-und-rtc-echtzeituhr-ds3231.8278/
// TimeLib https://github.com/PaulStoffregen/Time



#include <Wire.h>               // Wire Bibliothek laden
#include <LiquidCrystal_I2C.h>  // 

#include <DCF77.h> 
#include <Time.h>
#include <Timezone.h>    //https://github.com/JChristensen/Timezone

#define DCF_PIN 2           // Verbindung zum DCF77 Arduino UNO PIN
#define DCF_INV_PIN 9       // DCF-Signal invertiert , nicht invertiert dann PIN auf low setzen , Elrad muss auf true !
#define DCF_INTERRUPT 0     // Interrupt number associated with pin, DCF-Lib
#define PIN_LED 13          // Status von der Verbindung an LED-PIN 13
#define VERSION "1.1"       // DEV Stand

// S-Meter
#define SIN_PIN A0
#define REF_VOLTAGE    1.1
#define PIN_STEPS   1024.0

// DEBUG  print
const bool DEBUG = false;

// I2C-Setup
LiquidCrystal_I2C lcd(0x27, 20, 4);   //Display 4 Zeilen , 20 Zeichen

// Central European Time (Frankfurt, Paris)
TimeChangeRule CEST = {"CEST", Last, Sun, Mar, 2, 120};     // Central European Summer Time
TimeChangeRule CET = {"CET ", Last, Sun, Oct, 3, 60};       // Central European Standard Time
Timezone CE(CEST, CET);

//pinMode(DCF_PIN,INPUT);
DCF77 DCF = DCF77(DCF_PIN, DCF_INTERRUPT, true); // true fuer Elrad-RX , false für nicht invertiertes Signal

// wurde ein gueltiges Signal gefunden
bool g_bDCFTimeFound = false;
bool firstClear = false;
bool dcf_sig_inverted = true; // Fuer ELV-Modul false, ELRAD true

time_t SyncTime = 0;
time_t UTCTime  = 0;
time_t DCFtime  = 0;

int u_sact = 0;
int u_smax = 0;
int u_smin = 1023;
int u_cnt = 0;
const int u_pcnt = 25; // Aenderung zwischen min und max muss u_pcnt betragen

void setup() {
  Serial.begin(9600);           // Seriellen Monitor starten
  pinMode(DCF_PIN,INPUT);
  pinMode(PIN_LED, OUTPUT);
  pinMode(DCF_INV_PIN, INPUT_PULLUP); 
  lcd.begin();                  
  lcd.noBacklight();            
  lcd.backlight();              //Hintergrundbeleuchtung einschalten (lcd.noBacklight(); schaltet die Beleuchtung aus).
  
  if ((digitalRead(DCF_INV_PIN) == HIGH))  {
    dcf_sig_inverted = false;
    DCF = DCF77(DCF_PIN, DCF_INTERRUPT, dcf_sig_inverted); // false für invertiertes Signal
  }

  lcd.setCursor(4,0);           
  lcd.print("DCF77-Clock");
  lcd.setCursor(4,1);  
  lcd.print("IGE 12/2021"); 
  lcd.setCursor(4,2);  
  lcd.print("Version "); 
  lcd.print(VERSION);
  lcd.setCursor(4,3);  
  lcd.print("INVERTED:");
  lcd.print(dcf_sig_inverted);
  
  delay(4000);
  lcd.clear();
  lcd.print("Warte auf Sync...");
  Serial.println("Warte auf DCF77 Zeit... ");
  Serial.println("ca.. 3 Minuten bis zum Sync ....");
  DCF.Start();
  //setSyncProvider(getDCFTime);
  // AD Wandler
  analogReference(INTERNAL); // 1.1V
}

void loop() {
 
  delay(950);
  // Die Feldstaerke wird ueber 60 Sek. gemittellt.
  u_sact = analogRead(SIN_PIN);
  if (u_cnt > 61) {
    u_smax = 0;
    u_smin = 1023;
    u_cnt = 0;
  }
  if (u_sact > u_smax) {
    u_smax = u_sact;
  } 
  if (u_sact < u_smin){
    u_smin = u_sact;
  }
  u_cnt++;
  float u_sdiff = ((u_smax-u_smin ) / 3);
  float u_tmp = 100-  ((u_smin*1.0/u_smax*1.0)*100);
  if (DEBUG) {    
    Serial.print("U = ");
    Serial.print(analogRead(SIN_PIN)*REF_VOLTAGE/PIN_STEPS);
    Serial.println(" V");
    
    Serial.print(u_sact);
    Serial.println(" u_sact");
    
    Serial.print(u_smax);
    Serial.println(" u_smax");
    
    Serial.print(u_smin);
    Serial.println(" u_smin");
    
    Serial.print(u_sdiff);
    Serial.println(" u_sdiff");
    
    Serial.print(u_tmp);
    Serial.println(" u_tmp");
  
    Serial.print(u_pcnt);
    Serial.println(" u_pcnt");
  }
  
  if (u_tmp >= u_pcnt) {
    if (u_sact > (u_smin +(2*u_sdiff)+1)) {
        lcd.setCursor(17, 0);
        lcd.print("...");
        lcd.setCursor(17, 1);
        lcd.print(" ..");
        lcd.setCursor(17, 2);
        lcd.print("  .");
    } else if  (u_sact > (u_smin +u_sdiff)+1) {
        lcd.setCursor(17, 0);
        lcd.print("   ");
        lcd.setCursor(17, 1);
        lcd.print(" ..");
        lcd.setCursor(17, 2);
        lcd.print("  .");
    } else if  (u_sact > (u_smin)) {
        lcd.setCursor(17, 0);
        lcd.print("   ");
        lcd.setCursor(17, 1);
        lcd.print("   ");
        lcd.setCursor(17, 2);
        lcd.print("  .");
    }    
  } else {
        lcd.setCursor(17, 0);
        lcd.print("   ");
        lcd.setCursor(17, 1);
        lcd.print("   ");
        lcd.setCursor(17, 2);
        lcd.print("   ");
  }
    
  // Kann nur einmal abgerufen werden , bis zum nächsten Update, also Zeit in UTC setzen
  UTCTime = DCF.getUTCTime();    // Returns the current time in UTC
  
  if (UTCTime != 0) {
    u_cnt = 0;
    Serial.println("Aktuelle Zeit wurde empfangen!");
    setTime(UTCTime);
    SyncTime = UTCTime;
    
    printDateTime(CE, UTCTime, "Berlin");
    g_bDCFTimeFound = true;
    //Serial.print(cetDcf(CE, UTCTime));
    //Serial.println();
    
 }

   if (g_bDCFTimeFound) {
    delay(50);
    digitalWrite(PIN_LED, HIGH);
  }

  // 1x komplett lcd.clear
  if ((firstClear==false) and (UTCTime == 0)) {
    lcd.clear();
    firstClear= true;
  } else {
      digitalClockDisplay();
    }  

}

void digitalClockDisplay() {
// Anzeigen der Zeit auf dem 20x4 LCD-Display
  int posX =  8;
  int utcy  = 1;
  int dateY = 3;
  int syncY = 2;
  time_t t = now(); 
  
  // Zeit CET / CEST
  lcd.setCursor(1, 0);
  lcd.print("CET  :");
  lcd.setCursor(posX, 0);
  lcd.print(cetDcf(CE, t));
  
  /*
  if (hour()<10){lcd.print("0");}
  lcd.print(hour()); lcd.print(":");
  if (minute()<10){lcd.print("0");}
  lcd.print(minute()); lcd.print(":");
  if (second()<10){lcd.print("0");}
  lcd.print(second());
*/
  // 
  // Zeit UTC
  lcd.setCursor(1, utcy);
  lcd.print("UTC  :");
  lcd.setCursor(posX, utcy);
  if (hour()<10){lcd.print("0");}
  lcd.print(hour()); lcd.print(":");
  if (minute()<10){lcd.print("0");}
  lcd.print(minute()); lcd.print(":");
  if (second()<10){lcd.print("0");}
  lcd.print(second());
  lcd.print(" ");

  // Last Sync
  lcd.setCursor(1, syncY);
  lcd.print("Sync :");
  lcd.setCursor(posX, syncY);
  lcd.print(cetDcf(CE, SyncTime));
  /*
  lcd.setCursor(1, syncY);
  lcd.print("Sync :");
  if (SyncTime!=0) {
    lcd.setCursor(posX, syncY);
    if (hour(SyncTime)<10){lcd.print("0");}
    lcd.print(hour(SyncTime)); lcd.print(":");
    if (minute(SyncTime)<10){lcd.print("0");}
    lcd.print(minute(SyncTime)); lcd.print(":");
    if (second(SyncTime)<10){lcd.print("0");}
    lcd.print(second(SyncTime));
  }
  */
  
  // Datum
  lcd.setCursor(1, dateY);
  lcd.print("Date :");
  lcd.setCursor(posX, dateY);
  lcd.print(cetDcfDate(CE, t));
  /*
  if (day()<10){lcd.print("0");}
  lcd.print(day()); lcd.print(".");
  if (month()<10){lcd.print("0");}
  lcd.print(month()); lcd.print(".");
  lcd.print(year());
  */
  // Anzeigen der Zeit auf dem seriellen Monitor am PC
  /*
  Serial.print(hour());
  printDigits(minute());
  printDigits(second());
  Serial.print(" ");
  Serial.print(day());
  Serial.print(" ");
  Serial.print(month());
  Serial.print(" ");
  Serial.print(year());
  Serial.println();
  
  Serial.print(SyncTime);
  Serial.println();
  printDateTime(CE, UTCTime, "Paris");
  */
}

void printDigits(int digits) {
  // Kleines Skript um bei Minuten und Sekunden eine 0 vornean zu stellen
  Serial.print(":");
  if(digits < 10)
  Serial.print('0');
  Serial.print(digits);
}

void printDateTime(Timezone tz, time_t utc, const char *descr)
{
    char buf[40];
    char m[4];    // temporary storage for month string (DateStrings.cpp uses shared buffer)
    TimeChangeRule *tcr;        // pointer to the time change rule, use to get the TZ abbrev

    time_t t = tz.toLocal(utc, &tcr);
    strcpy(m, monthShortStr(month(t)));
    sprintf(buf, "%.2d:%.2d:%.2d %s %.2d %s %d %s",
        hour(t), minute(t), second(t), dayShortStr(weekday(t)), day(t), m, year(t), tcr -> abbrev);
    Serial.print(buf);
    Serial.print(' ');
    Serial.println(descr);
}

char* cetDcf(Timezone tz, time_t utc) {
    static char buf[10];
    TimeChangeRule *tcr;  // pointer to the time change rule, use to get the TZ abbrev

    time_t t = tz.toLocal(utc, &tcr);
    sprintf(buf, "%.2d:%.2d:%.2d", hour(t), minute(t), second(t));
    //Serial.print("cetDcf :");
    //Serial.println(buf);
    return(buf);
 }

char* cetDcfDate(Timezone tz, time_t utc) {
    static char buf[11];
    TimeChangeRule *tcr;  // pointer to the time change rule, use to get the TZ abbrev

    time_t t = tz.toLocal(utc, &tcr);
    sprintf(buf, "%.2d.%.2d.%.4d", day(t), month(t), year(t));
    //Serial.print("cetDcf :");
    //Serial.println(buf);
    return(buf);
 }
