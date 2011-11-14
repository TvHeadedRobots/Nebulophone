void SHIFT(){
  
  if (shiftcount<=600){
    if (shiftbutton != prevshiftbutton){
      if (shiftbutton == HIGH) {
        shift++;
        shiftcount=0;
      }     

      else{
        shiftcount=0;
      }
      prevshiftbutton = shiftbutton;
    }

    offx=12;
    if( shift == 0){
      keyoffset=(0);
    }

    if( shift > 3){
      shift=0;
    }
    if( shift > 0 ){
      keyoffset=(offx*shift);


    } 




 
  }
  
    if (shiftbutton == LOW) {
      shiftcount++;

    }    
    
  if (shiftcount>600){
    analogWrite(11, maxbrightness);
    digitalWrite(13, LOW);  
    tunemode=1;
    if (shiftbutton != prevshiftbutton){
      if (shiftbutton == LOW) {

        tunemode=0;
        shiftcount=0;
      }
    }
    prevshiftbutton = shiftbutton;
  }


}
