void RECORD(){
  

 if (recordbutton != prevrecordbutton){

      if (recordbutton == HIGH) {
        rcount++;
 rplace=0;
      }     

      else{

      }
      prevrecordbutton = recordbutton;
          prevrcount=rcount;
    }
  



    if( rcount == 0){
      record=0 ;
     // rstop=rplace;
    }

    if( rcount == 1){
      record=1;
     
    }

    if( rcount > 1){
      // record=0 ;
      rcount=0;

    }

if (restbutton != prevrestbutton){
   if (restbutton == HIGH) {
   recordbank[rplace]=63;
        rplace++;
                rstop=rplace; 
       digitalWrite(13, HIGH);  rest=1;
   }     
   
   
   prevrestbutton = restbutton;
   }
   else{
   rest=0;
   }
//if (recordlatch==0){record=0;rcount=0;}
 if (rplace>=32){
   digitalWrite(13, LOW);
 record=0;
 rplace=0;
 } 
  if (record==1){
    digitalWrite(13, HIGH);
    
if (rplace<32){
delay(10);
    if (kh != prevkh2 || keypress!=prevkeypress2){
      if (keydown==1){
        recordbank[rplace]=key;
        rplace++;
        rstop=rplace; 
      }

           else{
      }
      prevkh2= kh;
      prevkeypress2=keypress;

    }
}


  }
  prevrecord=record;
}
 /*   
if (prevrecord!=record){
  if (record==1){
    rplace=0;
//  recordbank[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
}}


 if (recordbutton==0){
 //rcount++;
 }
 
 if (rcount>40 && recordlatch==1){
 record=1;
 rcount=0;
 }
 
 */
/*
  if (recordlatch==0){
    record=0;
    rcount=0;
  }
  if (recordlatch==1){
    if (recordbutton != prevrecordbutton){
      if (recordbutton == HIGH) {
        rcount++;

      }     

      else{

      }
      prevrecordbutton = recordbutton;
    }

    if( rcount == 0){
      record=0 ;
      rstop=rplace;
    }

    if( rcount == 1){
      record=1;
      if (      prevrcount!=rcount){
        rplace=0;
      }
    }

    if( rcount >= 2){
      // record=0 ;
      rcount=0;

    }
    prevrcount=rcount;
  }


  
 if (restbutton != prevrestbutton){
   if (restbutton == HIGH) {
   rest=1;
   
   }     
   
   else{
   
   }
   prevrestbutton = restbutton;
   }
   */


