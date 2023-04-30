Function INV(a As Integer) As Integer
	Return Not(a)
End Function

Sub memset(a As Byte Ptr, b As Byte,ByVal s As Integer)
  while s 
  	s-=1
  	a[s]=b
  Wend  
End Sub

Sub memcpy(a As Byte Ptr, b As Byte Ptr,byval s As Integer)
  while s 
  	s-=1
  	a[s]=b[s]
  Wend  
End Sub
'
'Sub memswap(a As Byte Ptr, b As Byte Ptr, s As Integer)
'  Dim As Byte t 
'  while s 
'  	s-=1
'  	t=a[s]
'  	a[s]=b[s]
'  	b[s]=t  
'  Wend  
'End Sub




Function Npack( a As Byte Ptr , s As Integer) As Long 
  Dim As Long r = 0 

  while s
  	s-=1 
  	r = (r Shl 4) Or a[s]
  Wend
     
  return r 
End Function

Sub Nunpack( a As Byte Ptr , b As Long , s As Integer) 
  Dim As Integer ii 

  for ii=0 To s-1
  	a[ii] = cbyte(b And &hf)
  	b Shr=4  
  Next

End Sub

Sub Ncopy( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 

  memcpy(a,b,s)

End Sub

Sub Nxchg( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 

  Dim As Byte tmp(15) 

  memcpy(@tmp(0), b, s)
  memcpy(b, a, s)
  memcpy(a, @tmp(0), s)

End Sub

Sub Ninc( a As Byte Ptr , s As Integer) 
  Dim As Integer ii 

  for ii=0 To s-1        
    a[ii]+=1  
    if (a[ii]<MODE) Then CARRY = 0: Exit Sub  
    a[ii]-=cbyte(MODE)
  Next

  CARRY = 1 
End Sub

Sub Ndec( a As Byte Ptr , s As Integer) 
  Dim As Integer ii

  for ii=0 To s-1        
    if a[ii] Then  a[ii]-=1 : CARRY = 0: Exit Sub  
    a[ii] = cbyte(MODE)-1 
  Next

  CARRY = 1 
End Sub

Sub Nadd( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 
  Dim As Byte CARRY2 = 0 
  Dim As Integer ii 

  For ii=0 To s-1         
    a[ii]+=cbyte(b[ii]+CARRY2)
    if (a[ii]< MODE) Then
      CARRY2 = 0 
    Else
      a[ii] -= cbyte(MODE)
      CARRY2 = 1  
    End If
  Next

  CARRY = CARRY2 
End Sub

Sub Nsub( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 
  Dim As Byte CARRY2 = 0 
  Dim As Integer ii 

  for ii=0 To s-1         
    a[ii]-=cbyte(b[ii]+CARRY2)
    if (a[ii] <0) Then
      a[ii]+=cbyte(MODE)
      CARRY2 = 1   
    Else 
      CARRY2 = 0
    End If
  Next

  CARRY = CARRY2 
End Sub

Sub Nrsub( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 
  Dim As Byte CARRY2 = 0 
  Dim As Integer ii 

  for ii=0 To s-1         
    a[ii]=CByte(b[ii]-(a[ii]+CARRY2)) 
    if (a[ii] <0) Then
      a[ii]+=cbyte(MODE)
      CARRY2 = 1   
    Else
      CARRY2 = 0
    End If
  Next

  CARRY = CARRY2 
End Sub

Sub Nand( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 

  while s 
  	s-=1 
  	a[s] And=b[s]
  Wend
     
End Sub

Sub Nor( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 

  While s
  	s-=1 
  	a[s] Or=b[s]  		
  Wend
     
End Sub

Sub Nzero( a As Byte Ptr , s As Integer) 
  memset(a, 0, s)
End Sub

Sub Nnot( a As Byte Ptr , s As Integer) 
  Dim As Byte c = cbyte(MODE)-1 

  While s
   s-=1
   a[s]=cbyte(c-a[s])
  Wend
     
  CARRY = 0 
End Sub

Sub Nneg( a As Byte Ptr , s As Integer) 
  Dim As Byte c = cbyte(MODE)-1 
  Dim As Integer ii,gg 

  for ii=0 To s-1        
  	If a[ii] Then exit For
  Next

  if (ii=s) Then CARRY=0: Exit Sub  

  CARRY=1 
  a[ii] = CByte(MODE)-a[ii] 
  ii+=1
  for gg=ii To s-1  
  	a[gg]=CByte(c-a[gg])
  Next

End Sub

Sub Nsl( a As Byte Ptr , s As Integer) 

  if a[s-1] Then HST Or=SB

  ' --s
  s-=1
  while s
  	a[s]=a[s-1]
  	s-=1
  Wend
     
  *a=0 
End Sub

Sub Nsr( a As Byte Ptr , s As Integer) 

  if *a Then HST Or=SB 

  ' --s
  s-=1
  while s
  	*a=a[1]
  	a+=1   
  	s-=1
  Wend

   
  *a=0 
End Sub

Sub Nbit0( a As Byte Ptr , b As Byte) 

  a[b Shr 2] And= INV((1 Shl (b And 3))) 

End Sub

Sub Nbit1( a As Byte Ptr , b As Byte) 

  a[b Shr 2] Or=1 Shl (b And 3) 

End Sub

Sub Nslc( a As Byte Ptr , s As Integer) 
  Dim As Byte c 

  c = a[s-1]
  
  ' --s
  s-=1
  while s
  	a[s] = a[s-1]
  	s-=1
  Wend

     
  *a = c 
End Sub

Sub Nsrc( a As Byte Ptr , s As Integer) 
  Dim As Byte c = *a

  ' --s
  s-=1
  while s
  	*a=a[1]
  	a+=1  
  	s-=1 
  Wend
  
  *a = c 
End Sub

Sub Nsrb( a As Byte Ptr , s As Integer) 

  if (*a And 1) Then HST Or=SB 
  
  ' --s
  s-=1
  while s
    *a Shr =1 
    if (a[1] And 1) Then *a Or=8 
    a+=1  
    s-=1
  Wend

  
  *a Shr=1 
End Sub

Sub Ndbl( a As Byte Ptr , s As Integer) 

  Dim As Byte b(15) 
  memcpy(@b(0), a, s)
  Nadd(a, @b(0), s)
  
End Sub

Sub Tbit0( a As Byte Ptr , b As Byte) 

  if (a[b Shr 2] And (1 Shl (b And 3))) Then
    CARRY = 0 
  Else
    CARRY = 1
  End If
 
End Sub

Sub Tbit1( a As Byte Ptr , b As Byte) 

  if (a[b Shr 2] And (1 Shl (b And 3))) Then
    CARRY = 1 
  Else 
    CARRY = 0
  End If

End Sub

Sub Te( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 

  while s
  	s-=1 
  	if (a[s]<>b[s]) then CARRY=0:Exit Sub
  Wend
  CARRY = 1 
  
End Sub

Sub Tne( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 

  while s
  	s-=1 
  	if (a[s]<>b[s]) then CARRY=1:Exit Sub
  Wend
  CARRY = 0 

End Sub

Sub Tz( a As Byte Ptr , s As Integer) 

  while s
  	s-=1 
  	if (a[s]<>0) then CARRY=0:Exit Sub
  Wend
  CARRY = 1

End Sub

Sub Tnz( a As Byte Ptr , s As Integer) 

  while s
  	s-=1 
  	if (a[s]<>0) then CARRY=1:Exit Sub
  Wend
  CARRY = 0 

End Sub

Sub Ta( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 

  ' --s
  s-=1
  while s
  	If (a[s]<>b[s]) Then Exit While
  	s-=1
  Wend

  CARRY = iif(a[s]>b[s],1,0)
  'CARRY =(a[s]>b[s])
End Sub

Sub Tb( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 

  ' --s
  s-=1
  while s
  	If (a[s]<>b[s]) Then Exit While
  	s-=1
  Wend

  CARRY = IIf(a[s]<b[s],1,0)
  'CARRY = (a[s]<b[s])
End Sub

Sub Tae( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 

  ' --s
  s-=1
  while s
  	If (a[s]<>b[s]) Then Exit While
  	s-=1
  Wend
     
  CARRY = IIf(a[s]>=b[s],1,0) 
  'CARRY = (a[s]>=b[s]) 
End Sub

Sub Tbe( a As Byte Ptr ,  b As Byte Ptr , s As Integer) 

  ' --s
  s-=1
  while s
  	If (a[s]<>b[s]) Then Exit While
  	s-=1
  Wend
     
  CARRY = iif(a[s]<=b[s],1,0)
  'CARRY = (a[s]<=b[s])
End Sub

Function read_nibble(d As Long) As Byte 

  if (ISMODULE(1, d)) Then return dato(1)[d-base_(1)]
  if (CARDSTATUS And 2) Then if (ISMODULE(3, d)) Then return dato(3)[d-base_(3)]
  if (CARDSTATUS And 1) Then if (ISMODULE(4, d)) Then return dato(4)[d-base_(4)] 
  return rom[d]
End Function

Function nibble_ptr(d As Long) As Byte ptr

  if (ISMODULE(1, d)) Then return dato(1)+d-base_(1) 
  if (CARDSTATUS And 2) Then if (ISMODULE(3, d)) Then return dato(3)+d-base_(3) 
  if (CARDSTATUS And 1) Then if (ISMODULE(4, d)) Then return dato(4)+d-base_(4) 
  return rom+d 
End Function

Function read_nibble_crc(d As Long) As Byte 
  Dim As Byte n 

  if (ISMODULE(0, d)) Then return read_io(d-base_(0)) 
  if (ISMODULE(1, d)) Then 
    n=dato(1)[d-base_(1)]:CRC_(n):return n 
  End If
 
  if (ISMODULE(2, d)) Then 
    bank_switch(((d-base_(2))/2)):return 7 
  End If
 
  if (CARDSTATUS And 2) Then 
   if (ISMODULE(3, d)) Then n=dato(3)[d-base_(3)]:CRC_(n):return n 
  End If
 
  if (CARDSTATUS And 1) Then 
   if (ISMODULE(4, d)) Then n=dato(4)[d-base_(4)]:CRC_(n):return n 
  End If
 
  n=rom[d] 
  CRC_(n) 
  return n 
End Function

Sub write_nibble(d As Long , c As Byte) 

  if (ISMODULE(1, d)) Then 
    
    if (display.dispon) Then 
      
	  if ((d>=display.start12) And (d<display.end1)) Then display_plot1(d, c) 
	  if ((d>=display.start2)  And (d<display.end2)) Then display_plot2(d, c) 
    
    End If
 
    dato(1)[d-base_(1)]=c 
    return 
  
  End If
 
  if (ISMODULE(0, d)) Then 
     write_io(d-&h100, c): Exit Sub  
  End If

  if (CARDSTATUS And 2) Then 
   if (ISMODULE(3, d)) Then dato(3)[d-base_(3)]=c: Exit Sub  
  End If
 
  if (CARDSTATUS And 1) Then 
   if (ISMODULE(4, d)) Then dato(4)[d-base_(4)]=c: Exit Sub  
  End If
 
End Sub

Sub config() 
  Dim As Integer ii
  Dim As Long d 

  for ii=0 To 4      
    if ucfg(ii) Then Exit For
  Next

  if (ii=5) Then Exit Sub

  d = Npack(@CC(0), 5) 
  Select Case ii
  	case 0 
	    dato(0) = @ioram(0)
	    base_(0) = d 
	    size(0) = &h40 
	    ucfg(0) = 0 
		 Exit Sub
		
  	case 1,2,3,4
	    if (ucfg(ii)=2) Then
	      base_(ii) = d 
	      ucfg(ii) = 0 
	      Exit Sub
	    End If
	    size(ii) = &h100000 - Npack(@CC(0), 5) 
	    ucfg(ii) = 2 
  End Select

End Sub

Sub unconfig() 
  Dim As Integer ii
  Dim As Long d 

  d = Npack(@CC(0), 5) 
  for ii=0 To 4      
    if d=base_(ii) Then Exit For
  Next

  if (ii=5) Then Exit sub
 
  ucfg(ii) = 1 
  base_(ii) = 0 
  size(ii) = 0 
End Sub

Sub reset_() 
  Dim As Integer ii

  for ii=0 To 3      
    ucfg(ii) = 1
  Next

End Sub


Sub c_eq_id() 
  Dim As Integer ii
  Dim As Long id 

  for ii=0 To 4       
    if ucfg(ii) Then Exit For
  Next

  id = chip_id(IIf((ucfg(ii)=2),(ii+6),ii))
 
  Nunpack(@CC(0), id, 3) 

End Sub

Function rstkpop() As Long 
  Dim As Long r 
  Dim As Integer t 

  t = rstkp 
  t-=1  
  t And=7 
  rstkp = t 
  r = rstk(t) 
  rstk(t) = 0 
  return r 
End Function

Sub rstkpush(d As Long) 
  Dim As Integer t 

  t = rstkp 
  rstk(t) = d 
  t+=1  
  t And= 7 
  rstkp = t 

End Sub

Sub Nread( a As Byte Ptr , b As Long , s As Integer) 
  Dim As Integer ii

  for ii=0 To s-1
  	a[ii]=read_nibble(b+ii)
  Next

End Sub

Sub NCread( a As Byte Ptr , b As Long , s As Integer) 
  Dim As Integer ii 

  for ii=0 To s-1
  	a[ii]=read_nibble_crc(b+ii)
  Next

End Sub

Sub Nwrite( a As Byte Ptr , b As Long , s As Integer) 
  Dim As Integer ii 

  for ii=0 To s-1 
  	write_nibble(b+ii, a[ii])
  Next

End Sub


' creados por mi
Sub NFunpack(a As Byte ptr, b As long, f As integer) : Nunpack(a+F_s(f),b,F_l(f)) : End Sub
Sub NCFread (a As Byte ptr, b As long, f As integer) : NCread (a+F_s(f),b,F_l(f)) : End Sub
Sub NFwrite (a As Byte ptr, b As long, f As integer) : Nwrite (a+F_s(f),b,F_l(f)) : End Sub

Sub NFcopy(a As Byte Ptr, b As Byte Ptr, f As Integer) : Ncopy(a+F_s(f),b+F_s(f),F_l(f)) : End Sub
Sub NFxchg(a As Byte Ptr, b As Byte Ptr, f As Integer) : Nxchg(a+F_s(f),b+F_s(f),F_l(f)) : End Sub
Sub NFadd (a As Byte Ptr, b As Byte Ptr, f As Integer) : Nadd (a+F_s(f),b+F_s(f),F_l(f)) : End Sub
Sub NFsub (a As Byte Ptr, b As Byte Ptr, f As Integer) : Nsub (a+F_s(f),b+F_s(f),F_l(f)) : End Sub
Sub NFrsub(a As Byte Ptr, b As Byte Ptr, f As Integer) : Nrsub(a+F_s(f),b+F_s(f),F_l(f)) : End Sub
Sub NFand (a As Byte Ptr, b As Byte Ptr, f As Integer) : Nand (a+F_s(f),b+F_s(f),F_l(f)) : End Sub
Sub NFor  (a As Byte Ptr, b As Byte Ptr, f As Integer) : Nor  (a+F_s(f),b+F_s(f),F_l(f)) : End Sub

Sub NFinc (a As Byte Ptr, f As Integer) : Ninc (a+F_s(f),F_l(f)) : End Sub
Sub NFdec (a As Byte Ptr, f As Integer) : Ndec (a+F_s(f),F_l(f)) : End Sub
Sub NFzero(a As Byte Ptr, f As Integer) : Nzero(a+F_s(f),F_l(f)) : End Sub
Sub NFnot (a As Byte Ptr, f As Integer) : Nnot (a+F_s(f),F_l(f)) : End Sub
Sub NFneg (a As Byte Ptr, f As Integer) : Nneg (a+F_s(f),F_l(f)) : End Sub
Sub NFsr  (a As Byte Ptr, f As Integer) : Nsr  (a+F_s(f),F_l(f)) : End Sub
Sub NFsl  (a As Byte Ptr, f As Integer) : Nsl  (a+F_s(f),F_l(f)) : End Sub
Sub NFsrb (a As Byte Ptr, f As Integer) : Nsrb (a+F_s(f),F_l(f)) : End Sub
Sub NFdbl (a As Byte Ptr, f As Integer) : Ndbl (a+F_s(f),F_l(f)) : End Sub

Sub TFe (a As Byte Ptr, b As Byte Ptr, f As Integer) : Te (a+F_s(f),b+F_s(f),F_l(f)) : End Sub
Sub TFne(a As Byte Ptr, b As Byte Ptr, f As Integer) : Tne(a+F_s(f),b+F_s(f),F_l(f)) : End Sub
Sub TFa (a As Byte Ptr, b As Byte Ptr, f As Integer) : Ta (a+F_s(f),b+F_s(f),F_l(f)) : End Sub
Sub TFae(a As Byte Ptr, b As Byte Ptr, f As Integer) : Tae(a+F_s(f),b+F_s(f),F_l(f)) : End Sub
Sub TFb (a As Byte Ptr, b As Byte Ptr, f As Integer) : Tb (a+F_s(f),b+F_s(f),F_l(f)) : End Sub
Sub TFbe(a As Byte Ptr, b As Byte Ptr, f As Integer) : Tbe(a+F_s(f),b+F_s(f),F_l(f)) : End Sub

Sub TFz (a As Byte Ptr, f As Integer) : Tz (a+F_s(f),F_l(f)) : End Sub
Sub TFnz(a As Byte Ptr, f As Integer) : Tnz(a+F_s(f),F_l(f)) : End Sub

