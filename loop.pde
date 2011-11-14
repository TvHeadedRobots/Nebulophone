

void loop()

{
/*
if (scount++==32){
gauge=millis()-sprev;
scount=0;
sprev=millis();
}



 Serial.print(keypress);
Serial.print(" ");

 Serial.print(OCR2B, DEC);
  Serial.print(" ");

Serial.println(freq);
*/



DDS(  );
CONTROLS ();
KEYS ();
GLIDE();
SHIFT();
WAVESELECT();

ARP();
LFO();
RECORD();
}

