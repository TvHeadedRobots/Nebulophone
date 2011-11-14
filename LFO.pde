void LFO(){
 ////////////////////////////////////////////////////////////////// LFO
  // The LFO outputs analog levels through the PWM in a more traditional way but since it's using
  // pin 11 with is also on Timer 1, it will sound much better since the LED won't actually be 
  // blinking at 500 Hz.
  // Only one pot is used to control mode as well as rate. Inside each mode a differnt output
  // is performed based on lforateC.
maxbrightness=64;
  if (tunemode!=1){
    
    if (lfopot <202){
      lforate = map(lfopot, 0, 202, 0 , maxbrightness);
      lforateC = constrain(lforate, 0,maxbrightness);
      analogWrite(11, lforateC);
    }

    else if (lfopot >=202 && lfopot <404){

      lforate = map(lfopot, 202, 404, 96 , 1);
      lforateC = constrain(lforate, 1 , 96);

      if (millis() - prev4 > lforateC ) {
        prev4 = millis();    

        lfo+=2;
        lfo+=(lfo/4);
        analogWrite(11, lfo);

        if (lfo>=maxbrightness){
          lfo=0;  
        }
      }

    }

    else if (lfopot >=404 && lfopot <606){

      lforate = map(lfopot, 404, 606, 64 , 1);
      lforateC = constrain(lforate, 1 , 64);

      if (lfo<=5){
        up=1;  
      }
      if (lfo>=maxbrightness){
        up=0;  
      }

      if (millis() - prev4 > lforateC ) {
        prev4 = millis();    

        if (up==1){
          lfo+=4;
          lfo+=(lfo/4);
        }
        if (up==0){
          lfo-=4;
          lfo-=(lfo/4);
        }         


        analogWrite(11, lfo);


      }

    }

    else if (lfopot >=606 && lfopot <808){
      lforate = map(lfopot, 606, 808, 255 , 1);
      lforateC = constrain(lforate, 1 , 255);

      if (millis() - prev4 > lforateC ) {
        prev4 = millis();    

        if (lfo==0){
          analogWrite(11, 0);
          lfo=1;
        }

        else if (lfo>=1){
          analogWrite(11, maxbrightness);
          lfo=0;
        }
      }
    }

    else if (lfopot >=808&& lfopot<1010){

      lforate = map(lfopot, 808, 1010, 255 , 1);
      lforateC = constrain(lforate, 1 , 255);

      if (millis() - prev4 > lforateC ) {
        prev4 = millis();    
r2 = (lfsr2>>8);
        analogWrite(11, r2);

      }

    }
    else if (lfopot>=1010 && lfopot<1020){

      if (millis() - prev4 > arprate/3 ) {
        prev4 = millis();    

        if (lfo==0){
          analogWrite(11, 0);
          lfo=1;
        }

        else if (lfo>=1){
          analogWrite(11, maxbrightness);
          lfo=0;
        }
      }

    }
    else if (lfopot>=1020){

      if (millis() - prev4 > arprate/2 ) {
        prev4 = millis();    

        if (lfo==0){
          analogWrite(11, 0);
          lfo=1;
        }

        else if (lfo>=1){
          analogWrite(11, maxbrightness);
          lfo=0;
        }
      }

    }
  }
  else{
  }

}
