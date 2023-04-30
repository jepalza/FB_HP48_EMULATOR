
#define PORT1DEF "port1.bin"

Sub setport1( newstring As Byte Ptr)

    'if (newstring) Then 
    '
    ' 
    '    if (*newstring) Then 
    '    
    '        strcpy(PORT1, newstring) 
    '    else
    '           
    '        strcpy(PORT1, PORT1DEF)
    '    End If
 
    '
    'End If
 
End Sub

Function readport1( ) As Integer

  Dim As Long ii, s 
  Dim As UByte c 
  Dim As FILE Ptr fich = fopen(PORT1DEF, "rb") 

  if (fich<>NULL) Then 
  
   
     fseek(fich, 0, SEEK_END) 
     s = ftell(fich) * 2 
     fseek(fich, 0, SEEK_SET) 

     port1 = malloc(262144) 

     if (port1<>NULL) Then 
	    for ii=0 To s-1 Step 2         
	      c = fgetc(fich)
	      port1[ii] = (c And &hf) 
	      port1[ii+1] = ((c Shr 4) And &hf)  
	    Next
		Dato(3) = port1 
		CARDSTATUS Or= &hA 
      if (s<>262144L) Then memset(port1, 0, 16)   
     Else
      fclose(fich) 
      Return 0 
     End If
  End If
 
    return -1 
End Function

sub load()

  Dim As FILE Ptr fich 
  Dim As Long ii, s 
  Dim As UByte c 
  Dim As Integer swap_ 


  if (load_state) Then 
    
    fich = fopen("saturn.bin", "rb") 
    if (fich <> NULL) Then 
      
      fread(@AA(0), 16, 1, fich)
      fread(@BB(0), 16, 1, fich) 
      fread(@CC(0), 16, 1, fich) 
      fread(@DD(0), 16, 1, fich) 
      fread(@R0(0), 16, 1, fich) 
      fread(@R1(0), 16, 1, fich) 
      fread(@R2(0), 16, 1, fich) 
      fread(@R3(0), 16, 1, fich) 
      fread(@R4(0), 16, 1, fich) 
      
      if (pc=0) Then 
       	fread(@pc, 4, 1, fich)
      Else
         fseek(fich, 4, SEEK_CUR)
      End If
 
      fread(@d0,   4, 1, fich)
      fread(@d1,   4, 1, fich)
      fread(@OUT_, 4, 1, fich)
      fread(@IN_,   4, 1, fich)
      
      fread(@ST(0), 4, 1, fich)

      HST = fgetc(fich) 
      
      if (P=0) Then 
       	P = fgetc(fich)
      Else 
         fseek(fich, 1, SEEK_CUR)
      End If
 
      CARRY = fgetc(fich) 
      MODE  = fgetc(fich) 
      INTP  = fgetc(fich) 
      INTE  = fgetc(fich) 
      INTD  = fgetc(fich) 
      SHUTDN = fgetc(fich) 
      fread(@rstk(0), 32, 1, fich) 
      rstkp = fgetc(fich) 
      
      for ii=0 To 4        
			ucfg(ii) = fgetc(fich) 
			fread(@base_(ii), 4, 1, fich) 
			fread(@size(ii), 4, 1, fich) 
      Next

      fread(@ioram(0), 64, 1, fich) 
      t1 = fgetc(fich) 
      fread(@t2, 4, 1, fich) 
      fread(@crc, 4, 1, fich) 
      fread(@display, sizeof(display_t), 1, fich) 
      fclose(fich) 
    
    End If
  
  End If

 
 
 
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 '''''''''''''''  ROM
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  rom = malloc(1048576) 

  If modelo=GX Then fich = fopen("rom48gx.bin", "rb") 
  'fich = fopen("rom48gx_2.bin", "rb") 
  If modelo=SX Then fich = fopen("rom48sx.bin", "rb") 
  if (fich=NULL) Then 
    free(rom) 
    Print "The rom dump file 'rom.bin' is missing.":Sleep:end
  End If
 
  fseek(fich,0,SEEK_END) 
  s = ftell(fich)*2 
  fseek(fich,0,SEEK_SET) 
  c = fgetc(fich) 
  
  Select Case (c)  
  	case &h32  
  		swap_ = 0 ' ROm de 512k GX normal
  	case &h23  
  		swap_ = 1 ' ROM de 256k SX normal
  	case else  
  		swap_ = 2 ' ROM de 1mb de la 48G descomprimida, que ya viene en "nibbles"
  End Select

  ungetc(c, fich) 

  if (swap_=0) Then 
    for ii=0 To s-1 Step 2         
      c = fgetc(fich)
      rom[ii] = (c And &hf) 
      rom[ii+1] = ((c Shr 4) And &hf)  
    Next
  ElseIf (swap_=1) then
    for ii=0 To s-1 Step 2      
      c = fgetc(fich) 
      rom[ii] = ((c Shr 4) And &hf) 
      rom[ii+1] = (c And &hf) 
    Next
  Else
    for ii=0 To (s/2)-1     
      c = fgetc(fich) 
      rom[ii] = c
    next
  End If
  fclose(fich) 
  dato(5) = rom


	'For ii=0 To 10:Print ii,Hex(rom[ii],2):Next:sleep



 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 '''''''''''''''  RAM
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  ram = malloc(262144) 

  if (load_state) Then 
  	
	  fich = fopen("ram.bin", "rb") 
	  if (fich<>NULL) Then 
	    
	    c = fgetc(fich) 
	    Select Case  (c)  
	    	case &h3F  
	    		swap_ = 0 ' 128k de RAM, por defecto
	    	case &hF3  
	    		swap_ = 1 ' 256k
	    	case else 
	    		swap_ = 0
	    End Select
	
	    ungetc(c, fich) 
	    if (swap_=0) Then 
	       for ii=0 To 262144-1 Step 2     
	        c = fgetc(fich)
	        ram[ii] = (c And &hf) 
	        ram[ii+1] = ((c Shr 4) And &hf) 
	       Next
	    else
	      for ii=0 To 262144-1 Step 2      
	        c = fgetc(fich) 
	        ram[ii] = ((c Shr 4) And &hf) 
	        ram[ii+1] = (c And &hf) 
	      Next
	    End If
	    fclose(fich) 
	  
	  End If
  Else
  	' caso contrario, RAM a "0"
  	for ii=0 To 262144-1:ram[ii]=0:Next 
  End If
  dato(1) = ram 



  readport1() 
  
  
  /' CARDSTATUS: P2W P1W P2C P1C '/
  fich = fopen("port2.bin", "rb") 
  if (fich<>NULL) Then 
     fseek(fich, 0, SEEK_END) 
     s = ftell(fich) * 2 
     fseek(fich, 0, SEEK_SET) 
     port2 = malloc(262144L) 
     
     if (port2<>NULL) Then 
			for ii=0 To s-1 Step 2         
           c = fgetc(fich) 
           port2[ii] = (c And &hf) 
           port2[ii+1] = ((c Shr 4) And &hf)
			Next
			dato(4) = port2 
			CARDSTATUS Or= &h5 
     Else
         Print "Not enough memory for port2":Sleep:end
     End If
     fclose(fich) 
  End If
 
 
End Sub

Sub save()
  Dim As FILE Ptr salida
  Dim As Long ii 

  'salida = fopen("ram.bin", "wb") 
  'if (salida=NULL) Then Exit Sub 
  'for  ii=0 To 262144-1 Step 2  
  '	fputc(ram[ii] Or (ram[ii+1] Shl 4), salida)
  'Next 

  fclose(salida) 

  'if (CARDSTATUS And 2) Then bank_save(port1,PORT1,bank1) 

  'if (CARDSTATUS And 1) Then bank_save(port2,"port2.bin",bank2) 

  'salida = fopen("saturn.bin", "wb") 
  'fwrite(A, 16, 1, salida) 
  'fwrite(B, 16, 1, salida) 
  'fwrite(C, 16, 1, salida) 
  'fwrite(D, 16, 1, salida) 
  'fwrite(R0, 16, 1, salida) 
  'fwrite(R1, 16, 1, salida) 
  'fwrite(R2, 16, 1, salida) 
  'fwrite(R3, 16, 1, salida) 
  'fwrite(R4, 16, 1, salida) 
  'fwrite(@pc, 4, 1, salida) 
  'fwrite(@d0, 4, 1, salida) 
  'fwrite(@d1, 4, 1, salida) 
  'fwrite(@OUT_, 4, 1, salida) 
  'fwrite(@IN, 4, 1, salida) 
  'fwrite(ST, 4, 1, salida) 
  'fputc(HST, salida) 
  'fputc(P, salida) 
  'fputc(CARRY, salida) 
  'fputc(MODE, salida) 
  'fputc(INTP, salida) 
  'fputc(INTE, salida) 
  'fputc(INTD, salida) 
  'fputc(SHUTDN, salida) 
  'fwrite(rstk, 32, 1, salida) 
  'fputc(rstkp, salida) 
  
  'for ii=0 To 4         
    'fputc(ucfg(ii), salida) 
    'fwrite(@base_(ii), 4, 1, salida) 
    'fwrite(@size(ii), 4, 1, salida) 
  'Next

  'fwrite(ioram, 64, 1, salida) 
  'fputc(t1, salida) 
  'fwrite(@t2, 4, 1, salida) 
  'fwrite(@crc, 4, 1, salida) 
  'fwrite(@display, sizeof(display_t), 1, salida) 
  'fclose(salida) 

End Sub

Sub bank_save( mem As Byte Ptr ,  bn As Byte Ptr , bank As Integer) 
   Dim As String name_
   Dim As FILE ptr salida 
   Dim As Long ii 

   if (bank) Then 
     'sprintf(name_,"%s%i.bin",bn,bank) 
   Else
     'strcpy(name_, bn)
   End If
 
   'alida = fopen(name_, "rb") 
   if (salida=NULL) Then return 
   fclose(salida) 
   'salida = fopen(name_, "wb") 
   if (salida=NULL) Then 
      Print "Failed to write ",name_
      Exit Sub 
   End If
 
   for ii=0 To 262144-1 Step 2  
   	fputc(mem[ii] Or (mem[ii+1] Shl 4), salida)
   Next

   fclose(salida) 
   return 
End Sub

Sub bank_load( mem As Byte Ptr ,  bn As Byte Ptr , bank As Integer) 
   Dim As String name_ 
   Dim As Byte c 
   Dim As FILE Ptr in 
   Dim As Long ii, s 

   if (bank) Then 
     'sprintf(name_,"%s%i.bin",bn,bank) 
   Else
     'strcpy(name_, bn)
   End If
 
   'in = fopen(name_, "rb") 
   if (in=NULL) Then 
      Print "Failed to read ",name_
      Exit Sub 
   End If
 
   fseek(in, 0, SEEK_END) 
   s = ftell(in) * 2 
   fseek(in, 0, SEEK_SET) 
   for ii=0 To s-1 Step 2        
      c = fgetc(in) 
      mem[ii] = (c And &hf) 
      mem[ii+1] = ((c Shr 4) And &hf) 
   Next

   fclose(in) 
   return 
End Sub

Sub bank_switch(bank As Integer) 

   if (bank<32) Then
      if (bank1 = bank) Then return 
      bank_save(port1,PORT1,bank1) 
      bank1 = bank 
      bank_load(port1,PORT1,bank1) 
   else  
      bank -= 32 
      if (bank2 = bank) Then return 
      'bank_save(port2,"port2.bin",bank2) 
      bank2 = bank 
      'bank_load(port2,"port2.bin",bank2) 
   End If
 
   return 
End Sub

/'******* IO RAM *******'/
Function read_io(d As Long) As Byte 
  Dim As Byte c 

  Select Case  (d)  
  	Case &h04  
  		c = (crc)
  		
  	case &h05  
  		c = (crc Shr 4)
  		
  	case &h06  
  		c = (crc Shr 8)
  		
  	case &h07  
  		c = (crc Shr 12)
  		
  	case &h0F  
  		c = CARDSTATUS
  		
  	case &h14  
  		return ioram(d) 
  		
  	case &h15  
  		ioram(&h11) And=&he
  		return ioram(d) 
  		
  	Case &h16, &h17
  		Return 3 
  		
  	Case &h18, &h19  
  		Print "Nibbles #118/#119 read.":Sleep:end
  		
  	case &h20,&h21,&h22,&h23,&h24,&h25,&h26,&h27
  		return 3 
  		
  	case &h28 
  		c = display.lcounter
  		
  	case &h29 
  		c = (display.lcounter Shr 4) 
  		
   Case &h30,&h31,&h32,&h33,&h34  
  		c = 3
  		
  	case &h37  
  		c = (t1)
  		
  	case &h38  
  		c = (t2)
  		
  	case &h39  
  		c = (t2 Shr 4)
  		
  	case &h3A  
  		c = (t2 Shr 8)
  		
  	case &h3B  
  		c = (t2 Shr 12)
  		
  	case &h3C  
  		c = (t2 Shr 16)
  		
  	case &h3D  
  		c = (t2 Shr 20)
  		
  	case &h3E  
  		c = (t2 Shr 24)
  		
  	case &h3F  
  		c = (t2 Shr 28)
  		
  case else 
    return ioram(d) 
  
 End Select

  return (c And &hf) 
End Function

Sub write_io(d As Long , c As Byte) 

  Select Case  (d)  

    /' 00100 =  NS:DISPIO
     * 00100 @  Display bit offset and DON (DON OFF2 OFF1 OFF0)
     * 00100 @  3 nibs for display offset (scrolling), DON=Display ON
     '/
  case &h00 
    if (display.boffset<>(c And 7)) Then 
      display.touched = 1 
      display.boffset = c And 7 
    End If
    if (display.dispon<>(c Shr 3)) Then 
      display.touched = 1 
      display.dispon = c Shr 3 
    End If

    /' 00101 =  NS:CONTRLSB
     * 00101 @  Contrast Control (CON3 CON2 CON1 CON0)
     * 00101 @  Higher value = darker screen
     '/
  case &h01 
    if ((display.contrast And &hf)<>c) Then 
       display.contrast  And= &h10 
       display.contrast  Or= c 
       display.touched = 1 
    End If

    /' 00102 =  NS:DISPTEST
     * 00102 @  Display test (VDIG LID TRIM CON4 , LRT LRTD LRTC BIN)
     * 00102 @  Normally zeros
     '/
  case &h02 
    if ((display.contrast Shr 4)<>(c And 1)) Then 
       display.contrast  And= &h0f 
       display.contrast  Or= (c Shl 4) And &h10 
       display.touched = 1 
    End If

  case &h03 
    'Print "este caso 3, no hace nada"


    /' 00104 =  HP:CRC
     * 00104 @  16 bit hardware CRC (104-107) (X^16+X^12+X^5+1)
     * 00104 @  crc = ( crc >> 4 ) ^ ( ( ( crc ^ nib ) & 0x000F ) * 0x1081 );
     '/
  case &h04  
  		crc=crc And &hfff0:crc Or=(c)
  		Return 
  		
  case &h05  
  		crc=crc And &hff0f:crc Or=(c Shl 4)
  		Return 
  		
  case &h06  
  		crc=crc And &hf0ff:crc Or=(c Shl 8)
  		Return 
  		
  case &h07  
  		crc=crc And &h0fff:crc Or=(c Shl 12)
  		Return 

    /' 00108 =  NS:POWERSTATUS
     * 00108 @  Low power registers (108-109)
     * 00108 @  (LB2 LB1 LB0 VLBI) (read only)
     * 00108 @  LowBat(2) LowBat(1) LowBat(S) VeryLowBat
     '/
  case &h08 
    return 

    /' 00109 =  NS:POWERCTRL
     * 00109 @  (ELBI EVLBI GRST RST) (read/write)
     '/
  case &h09 
    'reak 

    /' 0010A =  NS:MODE
     * 0010A @  Mode Register (read-only)
     '/
  case &h0A 
    'reak 

    /' 0010B =  HP:ANNCTRL
     * 0010B @  Annunciator control (LA4 LA3 LA2 LA1) = ( alarm alpha -> <- )
     '/
  case &h0B, &h0C 
    ioram(d) = c: display_ann(): Exit Sub 

    /' 0010D =  NS:BAU
     * 0010D @  Serial baud rate (UCK BD2 BD1 BD0) (bit 3 is read-only)
     * 0010D @  3 bits = {1200 1920 2400 3840 4800 7680 9600 15360
     '/
  case &h0D 
    c  And= 7 

    /' 0010E =  NS:CARDCTRL
     * 0010E @  (ECDT RCDT SMP SWINT) (read/write)
     * 0010E @  Enable Card Det., Run Card Det., Set Module Pulled, Software interrupt
     '/
  case &h0E 
    if (c And 1) Then INTERRUPT("SW") 
    if (c And 2) Then 
       ioram(&h19) = 2
       HST Or=MP
       INTERRUPT("MP")  
    End If
 
    if (c And 8) Then 
      if (c And 4) Then ioram(&h0F) = 0
    End If
 

    /' 0010F =  NS:CARDSTATUS
     * 0010F @  (P2W P1W P2C P1C) (read-only) Port 2 writable .. Port 1 inserted
     '/
  case &h0F 
    return 

    /' 00110 =  HP:IOC
     * 00110 @  Serial I/O Control (SON ETBE ERBF ERBZ)
     * 00110 @  Serial On, Interrupt On Recv.Buf.Empty, Full, Buzy
     '/
  case &h10 

    /' 00111 =  HP:RCS
     * 00111 @  Serial Receive Control/Status (RX RER RBZ RBF) (bit 3 is read-only)
     '/
  case &h11 
    c  And= 7 
    c  Or= ioram(&h11) And 8 

    /' 00112 =  HP:TCS
     * 00112 @  Serial Transmit Control/Status (BRK LPB TBZ TBF)
     '/
  case &h12 

    /' 00113 =  HP:CRER
     * 00113 @  Serial Clear RER (writing anything clears RER bit)
     '/
  case &h13 
    ioram(&h11) And=&hB 
    return 

    /' 00114 =  HP:RBR
     * 00114 @  Serial Receive Buffer Register (Reading clears RBF bit)
     * 00114 @  (RX RER RBZ RBF)
     '/
  case &h14 ,&h15 
    return 

    /' 00116 =  HP:TBR
     * 00116 @  Serial Transmit Buffer Register (Writing sets TBF bit)
     '/
  case &h016
  
  case &h017 
    ioram(&h12)  Or= 1 

    /' 00118 =  NS:SRR
     * 00118 @  Service Request Register (read-only)
     * 00118 @  (ISQR TSQR USRQ VSRQ , KDN NINT2 NINT LSRQ)
     '/
  case &h18,&h19 
    return 

    /' 0011A =  HP:IRC
     * 0011A @  IR Control Register (IRI EIRU EIRI IRE) (bit 3 is read-only)
     * 0011A @  IR Input, Enable IR UART mode, Enable IR Interrupt, IR Event
     '/
  case &h1A 
    c And= 7 
    c Or= ioram(&h1A) And 8 

    /' 0011B =  NS:BASENIBOFF
     * 0011B @  Used as addressto get BASENIB from 11F to the 5th nibble
     '/
  case &h1B 
    return 

    /' 0011C =  NS:LCR
     * 0011C @  Led Control Register (LED ELBE LBZ LBF) (Setting LED is draining)
     '/
  case &h1C 

    /' 0011D =  NS:LBR
     * 0011D @  Led Buffer Register (0 0 0 LBO) (bits 1-3 read zero)
     '/
  case &h1D 
    c  And= 1  

    /' 0011E =  NS:SCRATCHPAD
     * 0011E @  Scratch pad (11F is BASEIB, 7 or F for base memory)
     '/
  case &h1E 

    /' 0011F =  NS:BASENIB
     '/
  case &h1F  

    /' 00120 =  NS:DISPADDR
     * 00120 @  Display Start Address (write only)
     * 00120 @  bit 0 is ignored (display must start on byte boundary)
     '/
  case &h20 
    if ((display.start1 And &h0000F)<>c) Then 
      display.start1 = (display.start1 And &hFFFF0) Or (c And &hE) 
      display.touched = 1 
    End If
  
  case &h21 
    if (((display.start1 And &h000F0) Shr 4)<>c) Then 
      display.start1=(display.start1 And &hFFF0F) Or (c Shl 4) 
      display.touched = 1 
    End If
 
  case &h22 
    if (((display.start1 And &h00F00) Shr 8)<>c) Then 
      display.start1=(display.start1 And &hFF0FF) Or (c Shl 8) 
      display.touched = 1 
    End If
 
  case &h23 
    if (((display.start1 And &h0F000) Shr 12)<>c) Then 
      display.start1=(display.start1 And &hF0FFF) Or (c Shl 12) 
      display.touched = 1 
    End If
 
  case &h24 
    if (((display.start1 And &hF0000) Shr 16)<>c) Then 
      display.start1=(display.start1 And &h0FFFF) Or (c Shl 16) 
      display.touched = 1 
    End If


    /' 00125 =  NS:LINEOFFS
     * 00125 @  Display Line offset (write only) (no of bytes skipped after each line)
     * 00125 @  MSG sign extended
     '/
  case &h25  
  		c  And= &he 
  		
  case &h26,&h27 
    ioram(d) = c 
    display.loffset = Npack(@ioram(&h25), 3)
    if (display.loffset And &h800) Then display.loffset = display.loffset - &h1000 
    display.touched = 1 
    return 

    /' 00128 =  NS:LINECOUNT
     * 00128 @  Display Line Counter and miscellaneous (28-29)
     * 00128 @  (LC3 LC2 LC1 LC0 , DA19 M32 LC5 LC4)
     * 00128 @  Line counter 6 bits -> max = 2^6-1 = 63 = disp height
     * 00128 @  Normally has 55 -> Menu starts at display row 56
     '/
  case &h28 
    if ((display.lcntsave And &hf)<>c) Then 
      display.lcntsave=(display.lcntsave And &h30) Or c 
      display.touched = 1 
    End If
 
  case &h29 
    if ((display.lcntsave And &h30)<>((c And 3) Shl 4)) Then 
      display.lcntsave=(display.lcntsave And &h0f) Or ((c And 3) Shl 4) 
      display.touched = 1 
    End If

  case &h2A ,&h2B ,&h2C , &h2D 
    return 

    /' 0012E =  NS:TIMER1CTRL
     * 0012E @  TIMER1 Control (SRQ WKE INT XTRA)
     '/
  case &h2E 
    c  And= &hE 

    /' 0012F =  NS:TIMER2CTRL
     * 0012F @  TIMER2 Control (SRQ WKE INT RUN)
     '/
  case &h2F 

    /' 00130 =  NS:MENUADDR
     * 00130 @  Display Secondary Start Address (write only) (30-34)
     * 00130 @  Menu Display Address, no line offsets
     '/
  case &h30 
    if ((display.start2 And &h0000F)<>c) Then  
      display.start2=(display.start2 And &hFFFF0) Or (c And &hE) 
      display.touched = 1 
    End If
 
  case &h31 
    if (((display.start2 And &h000F0) Shr 4)<>c) Then 
      display.start2=(display.start2 And &hFFF0F) Or (c Shl 4) 
      display.touched = 1 
    End If
 
  case &h32 
    if (((display.start2 And &h00F00) Shr 8)<>c) Then 
      display.start2=(display.start2 And &hFF0FF) Or (c Shl 8) 
      display.touched = 1 
    End If
 
  case &h33 
    if (((display.start2 And &h0F000) Shr 12)<>c) Then 
      display.start2=(display.start2 And &hF0FFF) Or (c Shl 12) 
      display.touched = 1 
    End If
 
  case &h34 
    if (((display.start2 And &hF0000) Shr 16)<>c) Then 
      display.start2=(display.start2 And &h0FFFF) Or (c Shl 16) 
      display.touched = 1 
    End If
 
  case &h35, &h36 
    return 

    /' 00137 =  HP:TIMER1
     * 00137 @  Decremented 16 times/s
     '/
  case &h37 
    t1 = c 

    /' 00138 =  HP:TIMER2
     * 00138 @  hardware timer (38-3F), decremented 8192 times/s
     '/
  	case &h38  
  		t2=(t2 And &hFFFFFFF0) Or c
  		
  	case &h39  
  		t2=(t2 And &hFFFFFF0F) Or (c Shl 4) 
  		
  	case &h3A  
  		t2=(t2 And &hFFFFF0FF) Or (c Shl 8) 
  		
  	case &h3B  
  		t2=(t2 And &hFFFF0FFF) Or (c Shl 12) 
  		
  	case &h3C  
  		t2=(t2 And &hFFF0FFFF) Or (c Shl 16) 
  		
  	case &h3D  
  		t2=(t2 And &hFF0FFFFF) Or (c Shl 20) 
  		
  	case &h3E  
  		t2=(t2 And &hF0FFFFFF) Or (c Shl 24) 
  		
  	case &h3F  
  		t2=(t2 And &h0FFFFFFF) Or (c Shl 28) 
  		
  	Case Else  
  		return 
  End Select
  
  ioram(d) = c 
End Sub
