
Sub emulate( ) 

  wire = fopen("wire.bin", "wb") 
  
  ticks = saturn_speed 
  update_lcd=0 
  update_kbd=128 

  'Open "salida.txt" For Output As 10
  while (quit=0)  	
 	' Locate 20,20:Print Hex(pc,8)	
  
   	 	  	 	   
  	cadaxveces-=1
  	 If cadaxveces<10 Then 
  	 	 cadaxveces=300000
	 
  	 	    display.touched=1'IIf((Rnd(1)*10)>4,1,0)
	    'Locate 20,20:Print Hex(pc,8)
	    'Locate 21,20:If I Then Print Hex(I[0],2);"-";Hex(I[1],2);"-";Hex(I[2],2);"-";Hex(I[3],2)
	    'display_redraw()
	    'display.touched=IIf((Rnd(1)*10)>4,1,0)
	    'display_ann() 
	    'display.dispon=1
	    'If I Then If I[1]<0 Then end
	    'If I Then If I[2]<0 Then end
	    'If I Then If I[3]<0 Then end
	    'If CARRY<0 Then end
	    #If 0
	    Locate 22,1
	     print "line_   " ;display.line_ ;"    "
		  Print "start1  " ;display.start1  ;"    "
		  Print "start12 " ;display.start12  ;"    "
		  Print "end1    " ;display.end1  ;"    "
		  Print "start2  " ;display.start2  ;"    "
		  Print "end2    " ;display.end2  ;"    "
		  Print "loffset " ;display.loffset  ;"    "
		  Print "boffset " ;display.boffset  ;"    "
		  Print "lcntsave" ;display.lcntsave  ;"    "
		  Print "lcounter" ;display.lcounter  ;"    "
		  Print "dispon  " ;display.dispon  ;"    "
		  Print "contrast" ;display.contrast  ;"    "
		  Print "noscan  " ;display.noscan  ;"    "
		  Print "Pointer " ;" ";Hex(display.Pointer_,8)
		  Print "disoffs " ;display.disoffs  ;"    "
		  Print "touched " ;display.touched  ;"    "
		 #EndIf
  	 End If
    
    if (SHUTDN) Then 
       ticks-=12: goto o_done  
    End If
 
    if (pc<&h7E000) Then 
       I = rom+pc: goto o_fetch  
    End If
 
    if (ISMODULE(1, pc)) Then 
       I = dato(1)+pc-base_(1): goto o_fetch  
    End If
 
    if (CARDSTATUS And 2) Then 
    	 if (ISMODULE(3, pc)) Then I = dato(3)+pc-base_(3): goto o_fetch  
    End If
 
    if (CARDSTATUS And 1) Then 
     	 If (ISMODULE(4, pc)) Then I = dato(4)+pc-base_(4): goto o_fetch  
    End If
 
    I = rom+pc 
    
    
o_fetch:

'Print #10,Hex(pc,8);" - "; Hex(I[0],2);" ";Hex(I[1],2);" ";Hex(I[2],2);" ";Hex(I[3],2)
'For f=0 To 15
'	Print #10,AA(f);
'	Print #10,BB(f);
'	Print #10,CC(f);
'	Print #10,DD(f);
'	Print #10,R0(f);
'	Print #10,R1(f);
'	Print #10,R2(f);
'	Print #10,R3(f);
'	Print #10,R4(f)
'Next
'Print #10,ST(0);ST(1);ST(2);ST(3)
'Print #10,CARRY;MODE


#Include "fetch.bi"
#include "opcodes.bi"

o_goyes: 
    if (CARRY=0) Then 
       pc+=2
       goto o_done  
    End If
    ticks -= 40 
    jmp = GOJMP[0] Or (GOJMP[1] Shl 4) 
    if (jmp) Then 
      pc+=jmp
    else
      pc=rstkpop()
    End If
    goto o_done 
    
o_invalid: 
    print  "Invalid Opcode at ", Hex(pc,8)
    fclose(wire) 
    quit = 1 
    Exit Sub 
    
o_invalid3:  pc+=3: ticks-=1 : goto o_done 
o_invalid4:  pc+=4: ticks-=1 : goto o_done 
o_invalid5:  pc+=5: ticks-=1 : goto o_done 
o_invalid6:  pc+=6: ticks-=1 : goto o_done 

o_done: 
'Print I[0];"  ",I[1];"  ",I[2];"  ",I[3];"  "
'Sleep
    If (ticks>0) Then Continue while  /' 1/8192s has elapsed '/

    ticks = saturn_speed 

    update_lcd Xor=1 
    if (update_lcd) Then  /' LCD_REFRESH 4096Hz '/
      display_next() 
      if (display.touched) Then display_redraw() 
      if (ioram(&h10) And 8) then
        if (ioram(&h12) And 1) Then
          fputc(Npack(@ioram(0)+&h16, 2), wire) 
          ioram(&h12) = 0 
          if (ioram(&h10) And 4) Then INTERRUPT("IO") 
        End If
      End If
    End If
 

    update_kbd-=1  
    if (update_kbd<=0) Then  /' KBD_UPDATE 64Hz '/
      if ((ioram(&h2f) And 1) = 0) Then update_kbd = 128 
      presskeys(inkey,keypressed,1)
      if (IR15X) Then 
        SHUTDN = 0 
        if ( INTP=0) Then INTERRUPT("ON") 
      End If
    End If
 

    if ((ioram(&h2f) And 1) = 0) Then continue While /' T2, T1, KBD_POLL disabled ? '/


    if (t2) Then  /' T2 8192Hz '/
      t2-=1  
    Else   
      t2 = &hffffffff 
      if (ioram(&h2f) And 4) Then
        ioram(&h2f) Or=8: SHUTDN = 0  
      End If
      if (ioram(&h2f) And 2) Then
        ioram(&h2f) Or=8: if ( INTP=0) Then INTERRUPT("T2")  
      End If
    End If
 

    If ((t2 And &h1ff) = 0) Then  /' T1 16Hz '/
      if (t1) Then 
        t1-=1  
      else /' 1s has elapsed '/
        t1 = &hf 
        if (ioram(&h2e) And 4) Then
        	ioram(&h2e) Or=8: SHUTDN = 0  
        End If
        if (ioram(&h2e) And 2) Then
        	ioram(&h2e) Or=8
        	if ( INTP=0) Then INTERRUPT("T1")  
        End If
      End If
    End If
 

    If (update_kbd<=0) Then  /' KBD_POLL 64Hz '/
      update_kbd = 128 
      if (KDN_rising_edge) Then 
        KDN_rising_edge = 0 
        SHUTDN = 0 
        if (INTE And ( INTP=0)) Then INTERRUPT("KP") 
      End If
    End If
 

  Wend
  
	Close 10
  fclose(wire) 
  return 
End Sub

