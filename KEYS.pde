void KEYS(){
  

  j++;//
  if (j>63){
    //dfreqc=(analogRead(4))*8;         
    //dfreqf=(analogRead(5)/8); 
  }

  keysb = (PINB & B00010111);
  keysd= (PIND &   B11110101);

  switch (keysb){
  case B10101:
    kh=1;
    keypress=1;
    keypressb=1;
    break;

  case B10011:
    kh=2;   
    keypress=1;   
    keypressb=1;
    break;

  case B111:
    kh=3;   
    keypress=1;   
    keypressb=1;
    break;

  case B10110:
    kh=10;   
    keypress=1;   
    keypressb=1;
    break;

  default: 
    keypressb=0;   
    break;
  }

  switch (keysd){
  case B11110100:
    kh=4;
    keypress=1;
    keypressd=1;
    break;

  case B11110001:
    kh=5;   
    keypress=1;   
    keypressd=1;
    break;

  case B11100101:
    kh=6;   
    keypress=1;   
    keypressd=1;
    break;

  case B11010101:
    kh=7;   
    keypress=1;   
    keypressd=1;
    break;

  case B10110101:
    kh=8;   
    keypress=1; 
    keypressd=1;  
    break;

  case B1110101:
    kh=9;   
    keypress=1; 
    keypressd=1;      
    break;

  default: 

    keypressd=0;  
    break;
  }

  key = kh;

  if (keypressd==0 && keypressb==0)
  {
    keypress=0;
  }

  if (kh != prevkh || keypress!=prevkeypress){

    if (keypress == 1) {
      count=0;
      remember[0] = prevkh;
      release=255;
              releaseb=255;
      remember[1] = key;
      keydown =1;
      scan=0;
    }   

    prevkh = kh;
    prevkeypress=keypress;
    prevkeydown=keydown;
  }

  if (keypress == 0) {

    keydown =0;
    if (millis() - prev > releaselength ) {       
      prev = millis();
      if (releaselength<20){
                releaseb-=4;
        if (release > 5){
          release-=(((release))*.3);
        }

        if (release <= 10){
                  releaseb-=4;
          release =0;
          ampholder=1;
        }
      }
      if (releaselength>=20){
        releaseb-=4;
        if (release > 5){
          release-=(((release))*.02);
        }

        if (release <= 10){
          release =0;
          ampholder=1;
        }
      }




    }

  }

  
}
