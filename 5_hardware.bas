

 Sub init_lcd() 
 	display.pointer_ = rom
 End Sub

 Sub display_next() 

  display.line_+=1
  if (display.line_ >= 64) Then ' new refresh cycle
    display.line_     = 0
    display.lcounter = display.lcntsave
    display.pointer_  = nibble_ptr(display.start1)
    display.disoffs  = 0
    Exit Sub
  End If
  if (display.disoffs) Then
    display.pointer_ += 34
    Exit Sub
  End If
  if (display.lcounter) Then
    display.lcounter-=1
    display.pointer_ += (34 + display.loffset)
    if (display.boffset And 4) Then display.pointer_+=1
    Exit Sub
  End If
  display.pointer_ = nibble_ptr(display.start2)
  display.disoffs = 1
  
 End Sub

 
Sub display_redraw( ) 
   Dim As Integer yy 

   display.line_     = 0 
   display.lcounter = display.lcntsave 
   display.pointer_  = nibble_ptr(display.start1) 
   display.disoffs  = 0 
   if (display.dispon) Then 
     for yy=0 To 63      
     	 display_line()
     Next
   else
     display_clear()
   End If
 
   if (display.boffset And 4) Then 
     display.end1 = display.start1 + (display.lcntsave+1)*(display.loffset+36) 
   Else
     display.end1 = display.start1 + (display.lcntsave+1)*(display.loffset+34)
   End If
 
   if (display.end1 < display.start1) Then 
      display.start12 = display.end1 
      display.end1 = display.start1 
   Else
      display.start12 = display.start1
   End If
 
   display.end2 = display.start2 + (63 - display.lcntsave)*34 
   display.touched = 0 
    
End Sub


Sub BitBlt_(HDC As Integer,byval xx As Integer,ByVal yy As Integer, ancho As Integer, alto As Integer, Color_ As Integer, addr As Byte)
	dim As Integer esc=2
	'xx+=0:yy+=0
		Line((xx+0)*esc,yy*esc)-Step(esc*2,esc*2),IIf(addr And 1,RGB(255,255,255),RGB(50,50,50)),bf
		Line((xx+2)*esc,yy*esc)-Step(esc*2,esc*2),IIf(addr And 2,RGB(255,255,255),RGB(50,50,50)),bf
		Line((xx+4)*esc,yy*esc)-Step(esc*2,esc*2),IIf(addr And 4,RGB(255,255,255),RGB(50,50,50)),bf
		Line((xx+6)*esc,yy*esc)-Step(esc*2,esc*2),IIf(addr And 8,RGB(255,255,255),RGB(50,50,50)),bf
End Sub
#define SET4PIXELS(xx,yy,mm) BitBlt_(hDC, 2*(xx), (yy), 8, 2 ,0, (mm)*1)
Sub display_line( ) 
  Dim As integer  HDC 
  Dim As Byte Ptr ptr_ 
  Dim As Integer xx, yy 

  ' display apagado, sale
  if ( display.dispon=0) Then Exit Sub 

  yy = 2*display.line_ 
  hDC = 0 'GetDC(hWindow)
  if (display.disoffs) Then 
    
     ptr_ = display.pointer_ 
     for xx=0 To 127 Step 4       
        SET4PIXELS(xx,yy,*ptr_) : ptr_+=1
     Next
	  SET4PIXELS(xx,yy,*ptr_ And 7) 
	  
   else
           
     if (display.boffset And 4) Then display.pointer_+=1  
     ptr_ = display.pointer_ 
     Select Case  (display.boffset And 3)  
      case 0 
        for xx=0 To 127 Step 4 
	      SET4PIXELS(xx,yy,*ptr_) : ptr_+=1
        Next
	     SET4PIXELS(xx,yy,*ptr_ And 7) 

      case 1 
	    SET4PIXELS(0,yy, *Ptr_ Shr 1) : ptr_+=1
        for xx=3 To 126 Step 4       
	     	SET4PIXELS(xx,yy,*ptr_) : ptr_+=1
        Next
		  SET4PIXELS(xx,yy,*ptr_) 

      case 2 
	    SET4PIXELS(0,yy, *ptr_ Shr 2) : ptr_+=1
        for xx=2 To 129 Step 4       
	      SET4PIXELS(xx,yy,*ptr_) : ptr_+=1
        Next
	     SET4PIXELS(xx,yy,*ptr_ And 1) 

      case 3 
	    SET4PIXELS(0,yy, *ptr_ Shr 3) : ptr_+=1
        for xx=1 To 128 Step 4        
          SET4PIXELS(xx,yy,*ptr_) : ptr_+=1
        Next
	     SET4PIXELS(xx,yy,*ptr_ And 3) 
     
    End Select

  
  End If
 
  'ReleaseDC(hWindow, hDC) 

  display_next() 
   
End Sub


Sub display_plot1(d As Long , m As Byte) 
   Dim As Integer xx, yy, w 
   Dim As integer HDC 

   d -= display.start12 
   w = 34 + display.loffset 
   if (display.boffset And 4) Then w+=2 
   if (w=0) Then Exit sub 
   if (w<0) Then 
     yy = d / w + display.lcntsave + 1 
   Else
     yy = d / w
   End If
 
   if (yy<0) Then Exit Sub 
   if (yy>display.lcntsave) Then Exit Sub 
   xx = (d mod w) * 4 
   if (display.boffset) Then 
      xx -= display.boffset 
      if (xx<0) Then Exit Sub 
   End If
 
   if (xx>130) Then Exit Sub 
   hDC = 0'GetDC(hWindow) 
   'SET4PIXELS(xx,yy*2,m)
   'ReleaseDC(hWindow, hDC) 
    
End Sub


Sub display_plot2(d As Long , m As Byte) 
   Dim As Integer xx, yy 
   Dim As Integer  hDC 

   d -= display.start2 
   yy = display.lcntsave + (d / 34) + 1 
   xx = (d Mod 34) * 4 
   if (xx=128) Then m And=7 
   hDC = 0'GetDC(hWindow) 
   'SET4PIXELS(xx,yy*2,m)
   'ReleaseDC(hWindow, hDC) 
    
End Sub



Sub display_clear( ) 
  Dim As Integer hDC 

  hDC = 0'GetDC(hWindow) 
  'PatBlt(hDC, 0, 0, 262, 128, WHITENESS) 
  'ReleaseDC(hWindow, hDC) 
  'Print "borrar pantalla sin hacer"
  'cls
  return 
End Sub


Sub display_ann( ) 
  Dim As Integer hDC 
  Dim As UShort c 

  hDC = 0'GetDC(hWindow) 
  c = 0'*(ioram+&h0b) ' analizar
  if ((c And &h0800)=0) Then c=0 
  'PatBlt(hDC, 16+32*1, 132, 4, 4, (c And &h001) , WHITENESS , BLACKNESS) 
  'PatBlt(hDC, 16+32*2, 132, 4, 4, (c And &h002) , WHITENESS , BLACKNESS) 
  'PatBlt(hDC, 16+32*3, 132, 4, 4, (c And &h004) , WHITENESS , BLACKNESS) 
  'PatBlt(hDC, 16+32*4, 132, 4, 4, (c And &h008) , WHITENESS , BLACKNESS) 
  'PatBlt(hDC, 16+32*5, 132, 4, 4, (c And &h100) , WHITENESS , BLACKNESS) 
  'PatBlt(hDC, 16+32*6, 132, 4, 4, (c And &h200) , WHITENESS , BLACKNESS) 
  'ReleaseDC(hWindow, hDC) 
   
End Sub
