void CONTROLS(){ 
   
  if (oscswitch==1){
    IR();
    if (tunemode!=1 && recordlatch!=1){    //standard
      
   glidebutton = digitalRead(1);
    //   glidebutton = 1;
      shiftbutton = digitalRead(14);
      irswitch = digitalRead(15);
      wavepot=(analogRead(3))>>6;
      lfopot= (analogRead(4));
    // apot = (analogRead(5))<<4; arppot = 1;
     arppot = (analogRead(5));
    }
    
    if (tunemode==1){
      tempermentbutton = digitalRead(1);
      shiftbutton = digitalRead(14);
      wavepot=(analogRead(3));
      offsetpot=0;
      // offsetpot=(((analogRead(5))>> 7)-2)*12;
      keypot= (analogRead(4));
      // apot = (analogRead(5))/32; arppot = 1;
      arppot = 0;

      if (keypot<=4)
      {
        temperment=0;
      }

      if (keypot>4 && keypot<512)
      {
        temperment=1;
        keypotm=map(keypot,4,512,-11,11);
      }
      if (keypot>=512)
      { 
        temperment=2;
        keypotm=map(keypot,512,1020,-11,11);
      }
 

    }
    
    if (recordlatch==1){
       arppot = (analogRead(5));
      restbutton = digitalRead(1);
      recordbutton = digitalRead(14);
      irswitch = digitalRead(15);
      wavepot=(analogRead(3))>>6;
      lfopot= (analogRead(4));
    }
    
  }
  if (oscswitch==2){

    if (uosc>200){
      digitalWrite(13, HIGH);  
    }
    if (uosc<=200){
      digitalWrite(13, LOW);  
    }

    shiftbutton = digitalRead(14);

    irswitch = 0;
    dswitch=digitalRead(15);
    wavepot=127;
    waveoff=(analogRead(3))+128;
    lfopot = (analogRead(4));
    arppot = 1;
    bpot = (analogRead(5));
       epot = bpot >> 5;
       fpot= (bpot<<12)-4194304;
       gpot= bpot*4;
    dronemodebutton= digitalRead(1);
    if (dronemodebutton != prevdronemodebutton){
      if (dronemodebutton == HIGH) {
        dronemode++;
      }     

      else{

      }
      prevdronemodebutton = dronemodebutton;
    }
  }
}
