void ARP(){

  ////////////////////////////////////////////////////////////////// ARP
  //Variable effects speed but is changed based on the IR switch


  if (arppot <5){
    //  remember[0] = key;
    remember[1] = key;
    count=0;  
    //a=0;

  }
  if (arppot >=5 && arppot<170)  {

    arprateL = map(arppot, 5, 170, maxarp, 1);
    arprateL = constrain(arprateL, 1 , maxarp);  
    arprateF = map(arppot, 5, 170, 4, 1);
    arprateF = constrain(arprateL, 1 , 4);  

    if (count==0){
      remember[0] = key;
      remember[1] = key +0;
      toplatcha=0;
    }
    else if (count==1){
      remember[0] = key;
      remember[1] = key +2;
      toplatcha=0;
    }
    else if (count>=2){ 
      count=0;
    }

  }


  if (arppot >=170 && arppot<340)  {

    arprateL = map(arppot, 170, 340, maxarp , 1);
    arprateL = constrain(arprateL, 1 , maxarp);  
    arprateF = map(arppot, 170, 340, 1, 4);
    arprateF = constrain(arprateF, 1 , 4);  


    if (count==0)      {
      remember[0] = key;
      remember[1] = key +0;

    }
    else if (count==1)      {
      remember[0] = key;
      remember[1] = key -1;

    }
    else if (count==2)      {        
      remember[0] = key;
      remember[1] = key -2; 

    }
    else if (count>=3)      {        
      count=0;

    }
  }



  if (arppot >=340 && arppot<510)  {

    arprateL = map(arppot, 340, 510, maxarp , 1);
    arprateL = constrain(arprateL, 1 , maxarp);  
    arprateF = map(arppot, 340, 510,  1, 4);
    arprateF = constrain(arprateF, 1 , 4);  

    if (count<8)
    {
      remember[0] = key;
      remember[1] = key +count;

    }
    else if (count>=8)
    {
      // a=0; 
      count=0;
    }
  }

  if (arppot >=510 && arppot<680)  {


    arprateL = map(arppot, 510, 680, maxarp , 1);
    arprateL = constrain(arprateL, 1 , maxarp);  
    arprateF = map(arppot, 510, 680,  1, 4);
    arprateF = constrain(arprateF, 1 , 4);  

    if (count<8)
    {
      remember[0] = key;
      remember[1] = key+8 -count;

    }
    else if (count>=8)
    {
      // a=0; 
      count=0;
    }
  }
  if (arppot >=680 && arppot<850)  {
    
    
    
    recordlatch=0;
    resta=0;
    rest=0;
    arprateL = map(arppot, 680, 850,  maxarp , 1);
    arprateL = constrain(arprateL, 1 , maxarp);  
    arprateF = map(arppot, 680, 850,  1, 4);
    arprateF = constrain(arprateF, 1 , 4);  


    if (count==0)
    {    

      remember[0] = key;
      remember[1] = key+rarp;

    }
    else if (count==1)
    { 
       rarp=  random(-8,12);
       
      remember[0] = key;
      remember[1] = key +0;

    }
    else if (count>=2)
    {
      count=0;
    }

  }

  if (arppot >=850 && arppot<1020) {
    recordlatch=0;
    rplace=0;
    rcount=0;
    record=0;

    record=0;
    arprateL = map(arppot, 850, 1020,  maxarp , 1);
    arprateL = constrain(arprateL, 1 , maxarp);  
    arprateF = map(arppot, 850, 1020,  1, 4);
    arprateF = constrain(arprateF, 1 , 4);  

    if (count<rstop)
    {

      if (recordbank[count]==63){
        
        resta=1;
        remember[0] = key;
        remember[1] = key;
      }

      if (recordbank[count]!=63){
        resta=0;
        remember[0] = key;
        remember[1] = key+recordbank[count];
      }

    }

    if (count>=rstop)
    {
      count=0;
    }


  }

  if (arppot >=1020){

   // count=0;
   // arprateL=0;
   // arprateF=0;
    recordlatch=1;
    digitalWrite(13, LOW);  
    //arprateL=0;
    //arprateF=0;
    resta=0;

  }









  if (prevarprateF != arprateF){
    previrtempo=0;
  }

  prevarprateF = arprateF;


}



