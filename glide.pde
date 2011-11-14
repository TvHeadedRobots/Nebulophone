void GLIDE(){
   /////////////////////////////////////////////////////////////////////////////////// glide

  if (glidebutton != prevglidebutton){
    if (glidebutton == HIGH) {
      glide++;
            analogWrite(11, 255);
    }     

    else{

    }
    prevglidebutton = glidebutton;
  }
  
  
if (temperment==1){
keyr1=(scale[remember[1]+5])+ keyoffset+offsetpot+keypotm;
keyr0=(scale[remember[0]+5])+ keyoffset+offsetpot+keypotm;

}
if (temperment==2){
keyr1=(scale[remember[1]+3])+ keyoffset+offsetpot+keypotm;
keyr0=(scale[remember[0]+3])+ keyoffset+offsetpot+keypotm;

}
if (temperment==0){
keyr1=(remember[1])+ keyoffset+12+offsetpot+keypotm;
keyr0=(remember[0])+ keyoffset+12+offsetpot+keypotm;

}

  frequencyc=chromatic[keyr1];
  frequencyp=chromatic[keyr0];


  if (gliderate>0){
    frequencyout = frequencyp+g;
    f= frequencyc-frequencyp;
    gstep=(f/16);


    if (f>0){

      if (millis() - prev9 > gliderate ) {
        prev9 = millis();    
        g+=(gstep);

      }


      if (g>=f){

        remember[0]=remember[1];
        g=0;
      }
    }

    if (f<0){


      if (millis() - prev9 > gliderate ) {
        prev9 = millis();    
        g-=(gstep)*-1;
      }


      if (g<=f){

        remember[0]=remember[1];
        g=0;
      }

    }

  }








  if (gliderate==0){
    frequencyout= frequencyc;

  }

  if (glide ==0){
    gliderate=0;

  }
  else if (glide ==1){
    gliderate=2;

  }
  else if (glide==2){
    gliderate=6;

  }
  else if( glide == 3)
  {
    gliderate=12;
  }
  else if( glide >= 4)
  {
    glide=0;
  }}
