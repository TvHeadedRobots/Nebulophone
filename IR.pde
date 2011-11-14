void IR(){
   ////////////////////////////////////////////////////////////////// IR
  // All of the Andromeda Space Rocker Kits can communicate via IR. The Nebulophone can sync it's arpeggiator to a multiple
  // of the IR clock rate. This is done but simply reading the analog input conected to the detector and measuring the time
  // between peaks. There are some sync issuse to work, though. I believe the rate is read correctly but sometimes the arp
  // speed can lag.

 // if (tunemode!=1){
    if (irswitch == 0){

      irin = (analogRead(2));

      if (irin > 5 && previrin <=5){

        irtempo = millis() - previrtempo; 
        previrtempo = millis();
        ir=1;

        //      irsub();
      }

      else {
        ir=0;   
      }

      previrin=irin; 
      arprate = irtempo / arprateF;

    }



    else if (irswitch == 1){
      arprate = arprateL;

    }



    if (millis() - prev8 >= arprate ) {
      prev8 = millis();

    //  r3 = (lfsr2>>12)-8;

      count++;   
PORTB |= _BV(5);

    }
    
    else {
    PORTB &= ~_BV(5);
    
    }
  }

