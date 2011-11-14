/*

 NEBULOPHONE code v10 by Dr. Bleep
 bleeplabs.com for schematic and more info
 
DDS:
 http://mouro.info/signal-generator-using-arduino-and-dds/
 http://interface.khm.de/index.php/lab/experiments/arduino-dds-sinewave-generator/
 http://www.analog.com/library/analogdialogue/archives/38-08/dds.html
 
Setting up timers.
 http://www.cs.mun.ca/~rod/Winter2007/4723/notes/timer0/timer0.html
 http://arcfn.com/2009/07/secrets-of-arduino-pwm.html
 http://blog.wingedvictorydesign.com/2009/05/29/generate-real-time-audio-on-the-arduino-using-pulse-code-modulation/2/
 
Also good to know:
 http://billgrundmann.wordpress.com/2009/03/03/to-use-or-not-use-writedigital/
  
 float major[] = {
 4186.01,3951.07,3520,3135.96,2793.83,2637.02,2349.32,2093,1975.53,1760,1567.98,1396.91,1318.51,1174.66,1046.5,987.77,880,783.99,698.46,659.26,587.33,
 523.25,493.88,440,392,349.23,329.63,293.67,261.63,246.94,220,196,174.61,
 164.81,146.83,130.81,123.47,110,98,87.31,82.41,73.42,65.41,61.74,55,49,43.65,41.2,36.71,32.7,2093,
 1975.53,1760,1567.98,1396.91,1318.51,1174.66,1046.5,987.77,880,783.99,
 698.46,659.26,587.33,523.25,493.88,440,392,349.23,329.63,293.67,261.63,246.94,220,196,174.61,164.81,
 146.83,130.81,123.47,110,98,87.31,82.41,73.42,65.41,61.74,55,49,43.65,41.,36.71,32.7};
 
 long major[] = {
 418601,395107,352000,313596,279383,263702,234932,209300,197553,176000,156798,139691,131851,117466,104650,98777,88000,
 78399,69846,65926,58733,52325,49388,44000,39200,34923,32963,29367,26163,24694,22000,19600,17461,16481,14683,13081,
 12347,11000,9800,8731,8241,7342,6541,6174,5500,4900,4365,4120,3671,3270,3087,2750};
 
 
 long chromatic[] = {
 
 94641666,89284590,84230746,79462967,74965064,70721758,66718640,62942113,59379352,56018257,52847412,49856049,
 47034008,44371706,41860100,39510700,37293100,35200000,33224400,31359600,29599600,27938300,26370200,24890200,
 23493200,22174600,20930000,19755300,18646600,17600000,16612200,15679800,14799800,13969100,13185100,12445100,
 11746600,11087300,10465000,9877670,9323280,8800000,8306090,7839910,7399890,6984560,6592550,6222540,5873300,
 5543650,5232510,4938830,4661640,4400000,4153050,3919950,3699940,3492280,3296280,3111270,2936650,2771830,
 2616260,2469420,2330820,2200000,2076520,1959980,1849970,1746140,1648140,1555630,1468320,1385910,1308130,
 1234710,1165410,1100000,1038260,979989,924986,873071,824069,777817,734162,692957,654064,617354,582705,
 550000,519131,489994,462493,436535,412034,388909,367081,346478,327032,308677,291352,275000
 
 };
 int major[]={
 3,4,6,8,10,11,13,14
 
 };
 
 int minor[]={
 3,5,7,8,10,12,13,14 
 };
 
 */
#include <avr/pgmspace.h>
//#include <MemoryFree.h>

unsigned long chromatic[] = {

2750,2914,3087,3270,3465,3671,3889,4120,4365,4625,4900,5191,5500,5827,6174,6541,6930,7342,7778,
8241,8731,9250,9800,10383,11000,11654,12347,13081,13859,14683,15556,16481,17461,18500,19600,
20765,22000,23308,24694,26163,27718,29367,31113,32963,34923,36999,39200,41531,44000,46616,49388,
52325,55437,58733,62225,65926,69846,73999,78399,83061,88000,93233,98777,104650,110873,117466,
124451,131851,139691,147998,156798,166122,176000,186466,197553,209300,221746,234932,248902,263702,
279383,295996,313596,332244,352000,372931,395107,418601

};
int scale[]={
0,2,4,5,7,9,11,12,14,16,17,19,21,23,24,26,28,29,31,33,35,36,38,40,41,43,45,47,48,50,52,53,55,57,59,60,62,64
};

//int minor[]={
//0,2,3,5,7,8,10,12,14,15,17,19,20,22,24,26,27,29,31,32,34,36,38,39,41,43,44,46,48,50,51,53,55,56,58,60,62,63,
//};


unsigned long counter, cprev1,cprev2;
unsigned long freq,freq2,keyfreq;

byte n =1;
int keypress, kh,prevkh2,prevkeypress2;
int prevn;
int prevkeypress,prevattackmode;
int keyr1,keyr0,keyra,keyrw,keyrw2;
int waveselect, subwaveselect,prevwavepot;
int r, r2;
int i=1;
long prev;
long prev4;

int irin;
int irout;
long irtempo;
int ir=0;
long previrtempo=1;
long previr=0;
int arpselect;
byte count =0;
int a=0;
int key =1;
int d;
int s;
int lforate;
int lforateC;
int lfo =0;
int l=0;
int j=10;
int r3;
byte dronemode=3;
byte dronemodebutton, prevdronemodebutton;
int irtempomod;
int irswitch;
int arprate =10; 
int arprateF; 
int arprateL;
int keyoffset=0;

byte scan=1;
byte shiftbutton;
byte prevshiftbutton;
int shift=0;
int maxrelease =250;
int maxbrightness =84;
int keym;
int prevarprateF;
int glide=3;
byte keyp;
byte keyc;
int remember[2];
int h=0;
long frequencyout;
long frequencyp;
long g;
long  f;
int gliderate;
long prev9;
int k;
int glidebutton;
int prevglidebutton;
int c=1;
int b;
int maxwaveindex =15;
int temp;
int release,releasem,releaseb;
int releaselength;
int ampholder=1;
int previrin;
static int oscc,oscx,oscy,oscz,oscb,oscxb;
float amp=1;
int wavepot,arppot, lfopot;
int himap, lowmap,lowf,hif,himap2, lowmap2;
int pwmPin = 3;
int ampm,ampb,read0,read1;
int arpcount,arp;
volatile unsigned long accumulator = 0;
volatile unsigned long accumulator2 = 0;
volatile unsigned long accumulator3 = 0;
volatile unsigned long accumulator4 = 0;
volatile unsigned long accumulator5 = 0;
volatile unsigned long increment = 0;
volatile unsigned long increment2 = 0;
volatile unsigned long increment3 = 0;
volatile unsigned long increment4 = 0;
volatile unsigned long increment5 = 0;
volatile unsigned long increment6 = 0;
volatile unsigned long increment7 = 0;


long prev8;
int incrementb = 0;
unsigned long holder4;
unsigned long holder3;
unsigned long holder2;
unsigned long holder;
int offx;
byte index = 0;
byte index2 = 0;
byte index3 = 0;
byte index4 = 0;
byte indexb = 0;
byte index5 = 0;
long frequency,frequencyc,frequency2,frequency2c,frequencyouta,frequencycs,frequencyps,temppot;
int rint, indexi;
int noise=0;
int wrc, cnw,apot,waveB,waveoff;
float bpotf;
int drone;
int acc=8;
int oscmode=1;
int ircount;
//long tempobank[4];
int aread,oscsel;
int oscswitch=1;
uint16_t osc,oscj, uosc, wr,wr2,rosc,bswitch;
int xpot;
int up=1;
int tempermentbutton,shiftcount;
int temperment=1;
int offsetpot=5;
int keypot=0;
int keypotm=0;
int tunemode =0;
int attackmode;
int attacklength;
int upa =1,upb=1,upc=1;
int toplatcha =0;
int attackon=0;
unsigned long prev2,prev3; 
int keydown,counta,prevkeydown;
//long tune;
int maxarp=306;
unsigned long frequencya,frequencyw,frequencyw2;
int attackp;
long attacka,attackw,wavemod;
long gstep;
unsigned int lfsr = 1;
unsigned int lfsr2 = 1;
unsigned bitholder,bitholder2;
volatile byte icnt1,icnt2,ms,noisecount;
int keysb,keysd,keypressb,keypressd,prevkeypressb,prevkeypressd,prevkh;
int scount;
int gauge,spd;
long sprev;
int restbutton=1,      recordbutton=1,prevrestbutton,      prevrecordbutton ;
int record, rcount=1,recordlatch,prevrcount,resta=0;
int recordbank[32]={2,63,5,63,10,63,5,63,1,63,63,63,10,63,63,63};
int rplace,rest=0,rstop=8,prevrecord;
 byte bhold;
volatile long whatok, whatno;
int i1,i2,i3,i4,tria;
byte b1, b2,b3,b4;
int epot,dswitch,noisekey,rarp;
 long fpot,bpot,gpot,recordinput;
 long thecount;
PROGMEM prog_char  waveTable[] =

{  
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
  255,255,255,255,255,255,

  1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,
  61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,
  114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,
  157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,
  200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,
  243,244,245,246,247,248,249,250,251,252,253,254,

  1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,
  33,35,37,39,41,43,45,47,49,51,53,55,57,59,61,63,65,
  67,69,71,73,75,77,79,81,83,85,87,89,91,93,95,97,99,
  101,103,105,107,109,111,113,115,117,119,121,123,125,127,129,131,133,
  135,137,139,141,143,145,147,149,151,153,155,157,159,161,163,165,167,
  169,171,173,175,177,179,181,183,185,187,189,191,193,195,197,199,201,
  203,205,207,209,211,213,215,217,219,221,223,225,227,229,231,233,235,
  237,239,241,243,245,247,249,251,253,255,254,252,250,248,246,244,242,
  240,238,236,234,232,230,228,226,224,222,220,218,216,214,212,210,208,
  206,204,202,200,198,196,194,192,190,188,186,184,182,180,178,176,174,
  172,170,168,166,164,162,160,158,156,154,152,150,148,146,144,142,
  140,138,136,134,132,130,128,126,124,122,120,118,116,114,112,110,108,
  106,104,102,100,98,96,94,92,90,88,86,84,82,80,78,76,74,72,70,68,66,
  64,62,60,58,56,54,52,50,48,46,44,42,40,38,36,34,32,30,28,26,24,22,
  20,18,16,14,12,10,8,6,4,2,0,



};

void setup(void)

{  

Serial.begin(9600); 
 digitalWrite(1, HIGH);

  pinMode(2, INPUT);  
  pinMode(4, INPUT); 
  pinMode(5, INPUT);        
  pinMode(6, INPUT);        
  pinMode(7, INPUT); 
  pinMode(8, INPUT);
  pinMode(9, INPUT);
  pinMode(10, INPUT);        
  pinMode(12, INPUT);
  pinMode(14, INPUT); 
  pinMode(15, INPUT); 
  pinMode(3, OUTPUT);
  pinMode(13, OUTPUT); // IR out
  pinMode(11, OUTPUT); // LFO LED out

  digitalWrite(2, HIGH);
  digitalWrite(4, HIGH);
  digitalWrite(5, HIGH);
  digitalWrite(6, HIGH);
  digitalWrite(7, HIGH);
  digitalWrite(8, HIGH);
  digitalWrite(9, HIGH);
  digitalWrite(10, HIGH);
  digitalWrite(12, HIGH);
  digitalWrite(14, HIGH);
  digitalWrite(15, HIGH);

  randomSeed(analogRead(5));


  if (digitalRead(14)==LOW){
    oscswitch=2;
  }
  else oscswitch=1;
  
/*
 
    cli();
  TCCR2A = _BV(COM2A1) | _BV(COM2B1) | _BV(WGM20);
  TCCR2B = _BV(CS20) ;
  TIMSK2 = _BV(TOIE2);
  sei();
TCCR1A= _BV(COM1A1) | _BV(WGM10);
TCCR1B = _BV(CS10) | _BV(WGM12);

  TIMSK1 = _BV(TOIE1);
 */ 
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))

 
 sbi (TIMSK2,TOIE2);
 
  sbi (TCCR2B, CS20);
  cbi (TCCR2B, CS21);
  cbi (TCCR2B, CS22);
  
  cbi (TCCR2A, COM2A0);  // clear Compare Match
  sbi (TCCR2A, COM2A1);
  sbi (TCCR2A, COM2B1);
  
  sbi (TCCR2A, WGM20);  // Mode 1  / Phase Correct PWM
  cbi (TCCR2A, WGM21);
  cbi (TCCR2B, WGM22);

}





////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





/*     
 
 // accelo graph//
 
 Serial.print(frequency);Serial.print(",");
 Serial.print(frequencyc);Serial.print(",");
 Serial.print(frequency2);Serial.print(",");
 Serial.print(frequency2c);Serial.print(",");
 Serial.print(frequency3);Serial.println();
 
 
 
 
 Serial.print(" ");
 Serial.print(CHAR, (pgm_read_byte(&sineTable[index2])));
 Serial.print(" ");
 
 
 amp=(b*.01);
 
 count1++;
 if (count1>8){
 count1=0;
 count1a++;
 
 }
 count2++;
 if (count2>2){
 count2=0;
 }
 
 
 */


















