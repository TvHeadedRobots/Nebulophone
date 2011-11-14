void WAVESELECT(){
  
  ////////////////////////////////////////////////////////////////// Wave select  /////////////////////////////////////////////////////
  //////////// Wave select
  //Just like the LFO pot except the variable inside each mode controls release.
if (attackmode!=prevattackmode || wavepot != prevwavepot){ cprev2=0;attacka=0;attackw=0;}


  if (attackmode==0){
    frequencyouta=frequencyout;

  }

  if (attackmode==2){
    //  wavemod=0;
    attacka=0;            
    if (millis() - cprev2 > attacklength ) {       
      cprev2 = millis();

      counta++;
    }

    if (counta==0){
      frequencyouta=frequencyout; 
      toplatcha=0;
    }
    else if (counta==1){
      frequencyouta=0; 
      toplatcha=0;
    }
    else if (counta>=2){ 
      counta=0;
    }

  }
  if (attackmode==3){    // do the wiggle
  


    frequencyouta=frequencyout+attackw;

    if (attackw>=frequencyc/12){
      //attackw=frequencyw;
      upa=0;
    }

    if (attackw<=(frequencyc/-12)){
      //attackw=frequencyw2;
      upa=1;
    }


  if (millis() - cprev2 > attacklength ) {       
      cprev2 = millis();

      if (upa==1){
        attackw+=(frequencyc/24);  
        // wavemod+=4; 

      }
      if (upa==0){
        attackw-=(frequencyc/24);  
        //  wavemod-=4;    

      }   

    }

  }
  
  if (attackmode==4){    
  


    frequencyouta=frequencyout;

    if (tria>=255){
      //attackw=frequencyw;
      upa=0;
    }

    if (tria<=0){
      //attackw=frequencyw2;
      upa=1;
    }


  if (millis() - cprev2 > attacklength ) {       
      cprev2 = millis();

      if (upa==1){
        tria+=4;  
        // wavemod+=4; 

      }
      if (upa==0){
        tria-=4;  
        //  wavemod-=4;    

      }   

    }

  }
//if (wavepot != prevwavepot){frequencyouta=0;}
  if (wavepot ==0){

    releaselength = 5;
    // pulse +  oct down pulse
    waveselect=0;
    subwaveselect=32;
    oscsel=2;
    attackmode=0;

  }

  if (wavepot ==1){

    releaselength = 40;
    // pulse +  oct down pulse
    waveselect=0;
    subwaveselect=32;
    oscsel=2;
    attackmode=0;
  }

  if (wavepot ==2){

    releaselength = 5;
    // tri +  oct down squ
    waveselect=319;
    subwaveselect=319;
    oscsel=4;
    attackmode=0;

  }

  if (wavepot ==3){

    releaselength = 40;
    // tri +  oct down squ
    waveselect=319;
    subwaveselect=319;
    oscsel=4;
    attackmode=0;

  }
  if (wavepot ==4){
   attacklength = 6;

    releaselength=30;

    // Wiggle
    waveselect=64;
    oscsel=2;
    attackmode=3;

  }
  if (wavepot ==5){
   attacklength = 24;

    releaselength=35;

    // Wiggle 
    waveselect=64;
    oscsel=2;
    attackmode=3;

  }
  if (wavepot ==6){
   attacklength = 24;
    releaselength = 15;
    // gate
    waveselect=64;
    subwaveselect=64;
    oscsel=2;
    attackmode=2;

  }
  if (wavepot ==7){
   attacklength = 48;
    releaselength = 15;
    // gate
    waveselect=64;
    subwaveselect=64;
    oscsel=2;
    attackmode=2;
  }
  
if (wavepot ==8){
    // PEWPEW
           attacklength = 64;
   releaselength = 16;
    waveselect=575;
    noise=0;
    oscsel=6;
attackmode=4;
  }
   if (wavepot ==9){
    // PEWPEW
       attacklength = 64;
   releaselength = 50;
    waveselect=575;
    noise=0;
    oscsel=6;
attackmode=4;

  }
   if (wavepot ==10){
    // ramp

   releaselength = 2;
    waveselect=0;
    noise=0;
    oscsel=1;

  }
   if (wavepot ==11){
    // ramp
   releaselength = 25;
    waveselect=0;
    noise=0;
    oscsel=1;

  }
    if (wavepot ==12){
    // tri
   releaselength = 5;
    waveselect=575;
    oscsel=1;
        attackmode=0;

  }
    if (wavepot ==13){
    // tri
   releaselength = 25;
    waveselect=575;
    oscsel=1;
        attackmode=0;

  }
     if (wavepot ==14){
    // noise
   releaselength = 1;
    oscsel=3;

  }   
  if (wavepot ==15){
    // noise
   releaselength = 25;
    oscsel=3;

  }
  

prevwavepot=wavepot;
prevattackmode=attackmode;}
