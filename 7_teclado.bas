'' This file contains the constants used with multiKey()
#include once "fbgfx.bi"

'' A simple class to help us deal with the keyboard
type keyboard
   public:
      declare function hold( byval as long ) as boolean
      declare function pressed( byval as long ) as boolean
      declare function released( byval as long ) as boolean
      
   private:
      '' These will store the states of the keys
      m_oldKey( 0 to 127 )   as boolean
      m_newKey( 0 to 127 )   as boolean
end type

function keyboard.hold( byval index as long ) as boolean
   '' Returns whether a key is being held
   return( cbool( multiKey( index ) ) )
end function

function keyboard.pressed( byval index as long ) as boolean
   '' Returns whether a key was pressed
   m_oldKey( index ) = m_newKey( index )
   m_newKey( index ) = cbool( multiKey( index ) )
   
   return( m_oldKey( index ) = false andAlso m_newKey( index ) = true )
end function

function keyboard.released( byval index as long ) as boolean
   '' Returns whether a key was released
   m_oldKey( index ) = m_newKey( index )
   m_newKey( index ) = cbool( multiKey( index ) )
   
   return( m_oldKey( index ) = true andAlso m_newKey( index ) = false )
end function


   'if( key.released( SC_UP ) = TRUE ) Then  
   'if( key.hold(  ) = TRUE ) Then
   'if( key.pressed( fb.sc_left ) = TRUE ) Then
   'if( key.hold( fb.sc_right ) = TRUE ) Then
	'key.pressed( SC_ESCAPE ) = TRUE )




Sub kbd_invert(x As Integer , y As Integer )

  'HDC hDC 

  'hDC = GetDC(hWindow) 
  'PatBlt(hDC, 1+KBD_LEFT+34*x, 1+KBD_UP+22*y, 33, 21, DSTINVERT) 
  ''ReleaseDC(hWindow, hDC);
  'return 
End Sub 


Sub kbd_invert2(x As Integer , y As Integer )

  'HDC hDC 

  'hDC = GetDC(hWindow) 
  'PatBlt(hDC, 1+KBD_LEFT+34*x, 1+KBD_UP+22*y, 67, 21, DSTINVERT) 
  ''ReleaseDC(hWindow, hDC);
  'return 
End Sub 


Sub kbd_handler(scancode As Integer , press As Integer )

  Dim As Integer mask, row

	If tecla_leida=0 Then Exit sub

	' ENCENDER/APAGAR/CONTINUAR
  if (scancode = &h81)  Then
    if (press) Then
      if (IR15X=0) Then kbd_invert(scancode And &hf, scancode Shr 4): IR15X = &h8000
    Else
      if (IR15X  ) then kbd_invert(scancode And &hf, scancode Shr 4): IR15X = &h0000
    End If
  End If

  if ( (ioram(&h2f) And 1) = 0) Then Exit Sub 

  Select Case (scancode) 
  	case &h00 		
  		row = 1: mask = &h0010 ' F1:A
  	case &h01 		
  		row = 8: mask = &h0010 ' F2:B
  	case &h02 		
  		row = 8: mask = &h0008 ' F3:C
  	case &h03 		
  		row = 8: mask = &h0004 ' F4:D
  	case &h04 		
  		row = 8: mask = &h0002 ' F5:E
  	case &h05 		
  		row = 8: mask = &h0001 ' F6:F
  		
  		
  	case &h10 		
  		row = 2: mask = &h0010 ' G
  	case &h11 		
  		row = 7: mask = &h0010 ' H
  	case &h12 		
  		row = 7: mask = &h0008 ' I
  	case &h13 		
  		row = 7: mask = &h0004 ' J
  	case &h14 		
  		row = 7: mask = &h0002 ' K
  	case &h15 		
  		row = 7: mask = &h0001 ' L
  		
  		
  	case &h20 		
  		row = 0: mask = &h0010 ' M
  	case &h21 		
  		row = 6: mask = &h0010 ' N
  	case &h22 		
  		row = 6: mask = &h0008 ' O
  	case &h23 		
  		row = 6: mask = &h0004 ' P
  	case &h24 		
  		row = 6: mask = &h0002 ' Q
  	case &h25 		
  		row = 6: mask = &h0001 ' R
  		
  		
  	case &h30 		
  		row = 3: mask = &h0010 ' S
  	case &h31 		
  		row = 5: mask = &h0010 ' T
  	case &h32 		
  		row = 5: mask = &h0008 ' U
  	case &h33 		
  		row = 5: mask = &h0004 ' V
  	case &h34 		
  		row = 5: mask = &h0002 ' W
  	case &h35 		
  		row = 5: mask = &h0001 ' X
  		
  		
  	case &h40 		
  		row = 4: mask = &h0010 ' enter 1
  	case &h41 		
  		row = 4: mask = &h0010 ' enter 2
  	case &h42 		
  		row = 4: mask = &h0008 ' Y
  	case &h43 		
  		row = 4: mask = &h0004 ' Z
  	case &h44 		
  		row = 4: mask = &h0002 ' DELETE
  	case &h45 		
  		row = 4: mask = &h0001 ' BACKSPACE
  		
  		
  	case &h51 		
  		row = 3: mask = &h0020 ' alpha
  	case &h52 		
  		row = 3: mask = &h0008 ' 7
  	case &h53 		
  		row = 3: mask = &h0004 ' 8
  	case &h54 		
  		row = 3: mask = &h0002 ' 9
  	case &h55 		
  		row = 3: mask = &h0001 ' dividir
  		
  		
  	case &h61 		
  		row = 2: mask = &h0020 ' rojo
  	case &h62 		
  		row = 2: mask = &h0008 ' 4
  	case &h63 		
  		row = 2: mask = &h0004 ' 5
  	case &h64 		
  		row = 2: mask = &h0002 ' 6
  	case &h65 		
  		row = 2: mask = &h0001 ' multiplicar
  		
  		
  	case &h71 		
  		row = 1: mask = &h0020 ' azul
  	case &h72 		
  		row = 1: mask = &h0008 ' 1
  	case &h73 		
  		row = 1: mask = &h0004 ' 2
  	case &h74 		
  		row = 1: mask = &h0002 ' 3
  	case &h75 		
  		row = 1: mask = &h0001 ' restar
  		
  		
  	case &h82 		
  		row = 0: mask = &h0008 ' 0
  	case &h83 		
  		row = 0: mask = &h0004 ' punto
  	case &h84 		
  		row = 0: mask = &h0002 ' espacio
  	case &h85 		
  		row = 0: mask = &h0001 ' sumar


	' PAUSAR
   case &h50 
     kbd_invert(scancode And &hf, scancode Shr 4) 
     if (press) Then
	   'HDC hDC 
      'SuspendThread(hThreadEmulate) 
	   'thread_suspended = 1 
	   'hDC = GetDC(hWindow) 
	   'SelectObject(hMemoryDC, hIdle) 
	   'BitBlt(hDC, 0, 0, 262, 128, hMemoryDC, 0, 0, SRCCOPY) 
      'ReleaseDC(hWindow, hDC) 
	   'SelectObject(hMemoryDC, hPix4) 
     End If
     Exit Sub 
	
	
	' PLAY
   case &h60 
     kbd_invert(scancode And &hf, scancode Shr 4) 
     if (press) Then
      'thread_suspended = 0 
      'ResumeThread(hThreadEmulate) 
	   display_redraw() 
	   display_ann() 
     End If
	  Exit Sub 
	
	' VACIO???
   case &h70 
	  kbd_invert(scancode And &hf, scancode Shr 4) 
     Exit Sub 
	
	' VACIO??
   case &h80 
     kbd_invert(scancode And &hf, scancode Shr 4) 
     Exit Sub 
	
  	Case Else  
  		Exit Sub 
  End Select



If tecla_leida=2 Then press=0
'If tecla_leida=2 Then tecla_leida=3

  if (press) Then
    if ((kbd_row(row) And mask)=0) Then
      KDN_rising_edge = 1 
      KDN +=1 
	   If ((scancode=&h40) Or (scancode=&h41)) Then
	    kbd_invert2(0, 4) 
	   Else
	    kbd_invert(scancode And &hf, scancode Shr 4)
      End If
      kbd_row(row) Or= mask
    End If
  else 
    if (kbd_row(row) And mask) Then
      KDN -=1 
	   If ((scancode=&h40) Or (scancode=&h41)) Then
	    kbd_invert2(0, 4) 
	   Else
	    kbd_invert(scancode And &hf, scancode Shr 4)
      End If 
      kbd_row(row) And=INV( mask )
      'For ii As integer=0 To 8:kbd_row(ii)=0:Next
      tecla_leida=0
    End If

    'Print "borrada":sleep
  End If

End Sub 

Sub presskeys(asckey As string , codekey As Integer, keypressed As Integer)

    Static As Integer scancode 
    Dim As Integer state=0 
    
	 Dim As Integer row 
	 Dim As Integer col 
	 
	 Dim As Integer ii=0


	Dim As Integer xmouse,ymouse,bmouse
	GetMouse(xmouse,ymouse,,bmouse)
	'Locate 1,1:

	xmouse=xmouse-70
	ymouse=ymouse-267
	a=Fix(CSng(xmouse/68))
	b=Fix(CSng(ymouse/44))
	'Locate 1,1:Print a,b,xmouse;ymouse;"    "',bmouse 
	'Locate 1,1:Print (b Shl 4) Or a;"    "',bmouse 
	c=(b Shl 4) Or a
	If bmouse Then 
		tecla_leida=0
		ii=1
		' fila 1
		If c=0 Then codekey=SC_F1
		If c=1 Then codekey=SC_F2
		If c=2 Then codekey=SC_F3
		If c=3 Then codekey=SC_F4
		If c=4 Then codekey=SC_F5
		If c=5 Then codekey=SC_F6
		' fila 2
		If c=16 Then codekey=SC_G
		If c=17 Then codekey=SC_H
		If c=18 Then codekey=SC_I
		If c=19 Then codekey=SC_J
		If c=20 Then codekey=SC_UP 'K
		If c=21 Then codekey=SC_L
		' fila 3
		If c=32 Then codekey=SC_M
		If c=33 Then codekey=SC_N
		If c=34 Then codekey=SC_O
		If c=35 Then codekey=SC_LEFT 'P
		If c=36 Then codekey=SC_DOWN 'Q
		If c=37 Then codekey=SC_RIGHT 'R
		' fila 4
		If c=48 Then codekey=SC_S
		If c=49 Then codekey=SC_T
		If c=50 Then codekey=SC_U
		If c=51 Then codekey=SC_V
		If c=52 Then codekey=SC_W
		If c=53 Then codekey=SC_X
		' fila 5
		If c=64 Then codekey=SC_ENTER ' ZONA BOTON1
		If c=65 Then codekey=SC_ENTER ' ZONA BOTON2
		If c=66 Then codekey=SC_Y
		If c=67 Then codekey=SC_Z
		If c=68 Then codekey=SC_DELETE
		If c=69 Then codekey=SC_BACKSPACE
		' fila 6
		If c=80 Then codekey=SC_TAB ' PAUSA
		If c=81 Then codekey=0 ' ALPHA
		If c=82 Then codekey=SC_7
		If c=83 Then codekey=SC_8
		If c=84 Then codekey=SC_9
		If c=85 Then codekey=SC_BACKSLASH ' DIVIDIR
		' fila 7
		If c=96 Then codekey=SC_CONTROL ' PLAY
		If c=97 Then codekey=0 ' ROJO
		If c=98 Then codekey=SC_4
		If c=99 Then codekey=SC_5
		If c=100 Then codekey=SC_6
		If c=101 Then codekey=SC_MULTIPLY ' MULTIPLICAR
		' fila 8
		If c=112 Then codekey=0 ' VACIO
		If c=113 Then codekey=0 ' AZUL
		If c=114 Then codekey=SC_1
		If c=115 Then codekey=SC_2
		If c=116 Then codekey=SC_3
		If c=117 Then codekey=SC_MINUS ' RESTAR
		' fila 9
		If c=128 Then codekey=0 ' VACIO 
		If c=129 Then codekey=SC_PAGEUP ' ON/OFF/CONT
		If c=130 Then codekey=SC_0
		If c=131 Then codekey=SC_PERIOD
		If c=132 Then codekey=SC_SPACE
		If c=133 Then codekey=SC_PLUS ' SUMAR
	EndIf
	





	  While InKey<>"":Wend
	  'If InKey=Chr(27) Or InKey=Chr(255)+"k"  Then End
	  If MultiKey(SC_ESCAPE) Then end
	 
If tecla_leida=1 Then Exit Sub
	 

If tecla_leida=2 Then 
	kbd_handler(scancode, 0)
	'tecla_leida=0
	'For ii=0 To 8:kbd_row(ii)=0:next
EndIf

	      Dim e AS EVENT	 	 	 
  	 	   IF (SCREENEVENT(@e)) Then
		    SELECT CASE AS CONST e.type
		    	Case EVENT_KEY_PRESS', EVENT_KEY_REPEAT
		      	keypressed=e.scancode
		    	   ii=1
		    END SELECT
  	 	   END If 	 
	 
	 If ii=0 Then Exit Sub


    state   = IIf((MultiKey(SC_LSHIFT) ) , &h100 , 0 )
    state Or= IIf((MultiKey(SC_RSHIFT) ) , &h200 , 0 )
    state Or= IIf((MultiKey(SC_CONTROL)) , &h400 , 0 )
    state Or= IIf((MultiKey(SC_MENU)   ) , &h800 , 0 )

    asckey = UCase(asckey) 



	If scancode=SC_A Then asckey="A"
	If scancode=SC_B Then asckey="B"
	If scancode=SC_C Then asckey="C"
	If scancode=SC_D Then asckey="D"
	If scancode=SC_E Then asckey="E"
	If scancode=SC_F Then asckey="F"
	If scancode=SC_G Then asckey="G"
	If scancode=SC_H Then asckey="H"
	If scancode=SC_J Then asckey="I"
	If scancode=SC_I Then asckey="J"
	If scancode=SC_K Then asckey="K"
	If scancode=SC_L Then asckey="L"
	If scancode=SC_M Then asckey="M"
	If scancode=SC_N Then asckey="N"
	If scancode=SC_O Then asckey="O"
	If scancode=SC_P Then asckey="P"
	If scancode=SC_Q Then asckey="Q"
	If scancode=SC_R Then asckey="R"
	If scancode=SC_S Then asckey="S"
	If scancode=SC_T Then asckey="T"
	If scancode=SC_U Then asckey="U"
	If scancode=SC_V Then asckey="V"
	If scancode=SC_W Then asckey="W"
	If scancode=SC_X Then asckey="X"



    if (asckey >= "A" And asckey <= "X") Then

       row = (Asc(asckey) - Asc("A")) / 6 
       col = (Asc(asckey) - asc("A")) Mod 6 
       scancode = row * &h10 + col 

    Else
        Select Case (codekey)
        	case SC_ESCAPE ' ???? 
        		scancode = &h41
        	case SC_0   
        		scancode = &h82
        	case SC_1  
        		scancode = &h72
        	case SC_2  
        		scancode = &h73
        	case SC_3   
        		scancode = &h74
        	case SC_4  
        		scancode = &h62
        	case SC_5  
        		scancode = &h63
        	case SC_6  
        		scancode = &h64
        	case SC_7  
        		scancode = &h52
        	case SC_8  
        		scancode = &h53
        	case SC_9 
        		scancode = &h54
        	case SC_PERIOD
        		scancode = &h83
        	case SC_SPACE 
        		scancode = &h84
        	case SC_PLUS  
        		scancode = &h85
        	case SC_MINUS 
        		scancode = &h75
        	case SC_MULTIPLY
        		scancode = &h65
        	case SC_SLASH   
        		scancode = &h55
        	case SC_Y  
        		scancode = &h42
        	case SC_BACKSLASH  
        		scancode = &h20
        	case SC_Z   
        		scancode = &h43
        	case SC_ESCAPE 
        		scancode = &h81
        	case SC_DELETE 
        		scancode = &h45
        	case SC_TAB 
        		scancode = &h15
        	case SC_ENTER    
       		scancode = &h41
        	case SC_LEFT     
       		scancode = &h23
        	case SC_UP       
       		scancode = &h14
        	case SC_RIGHT   
       		scancode = &h25
        	case SC_DOWN    
       		scancode = &h24
        	case SC_CONTROL  
       		scancode = &h51
       	case SC_BACKSPACE       
       		if ((state And &h300)=0) Then scancode = &h61
        	case SC_RSHIFT   
       		if ((state And &h300)=0) Then scancode = &h71
        	case SC_F1 , SC_A    
       		scancode = &h00
        	case SC_F2 , SC_B      
       		scancode = &h014
        	case SC_F3 , SC_C      
       		scancode = &h02
        	case SC_F4 , SC_D      
       		scancode = &h03
        	case SC_F5 , SC_E     
       		scancode = &h04
       	case SC_F6 , SC_F     
       		scancode = &h05
      End Select
	 End If


    if (scancode <> -1) Then 
    	'Print "pulsada":sleep
       'If tecla_leida=0 Then 
       	tecla_leida=1 : kbd_handler(scancode, 1)
       'EndIf
       'Sleep(100) 
       'If tecla_leida=2 Then 
       '	Print "BORRADO"
       '	kbd_handler(scancode, 0)
       '	tecla_leida=0
       '	For ii=0 To 8:kbd_row(ii)=0:next
       'EndIf
    End If
    
End Sub

Sub update_in( )
  'Locate 39,1:Print kbd_row(0),kbd_row(1),kbd_row(2),kbd_row(3),kbd_row(4),kbd_row(5),kbd_row(6),kbd_row(7)

  If tecla_leida=0 Then Exit Sub
  'If tecla_leida=2 Then Exit sub

  IN_ = IR15X 

  if (OUT_ And &h001) Then IN_ Or= kbd_row(0) : tecla_leida=2
  if (OUT_ And &h002) Then IN_ Or= kbd_row(1) : tecla_leida=2 
  if (OUT_ And &h004) Then IN_ Or= kbd_row(2) : tecla_leida=2 
  if (OUT_ And &h008) Then IN_ Or= kbd_row(3) : tecla_leida=2 
  if (OUT_ And &h010) Then IN_ Or= kbd_row(4) : tecla_leida=2 
  if (OUT_ And &h020) Then IN_ Or= kbd_row(5) : tecla_leida=2 
  if (OUT_ And &h040) Then IN_ Or= kbd_row(6) : tecla_leida=2
  if (OUT_ And &h080) Then IN_ Or= kbd_row(7) : tecla_leida=2 
  if (OUT_ And &h100) Then IN_ Or= kbd_row(8) : tecla_leida=2 
   
End Sub 


#define IGNORE_WM_CHAR &h8000

Function keyevent(key As Long ) As Integer  
	 'Dim As Integer row 
 	 'Dim As Integer col 
    'Dim As Integer scancode = -1
    'Dim As Integer retval = 0 
    'Dim As String chrkey

    'if (key >= Asc("a") And key <= Asc("z")) Then key = key-32 ' asc(A)=64, asc(a)=96

    'if (key >= Asc("A") And key <= Asc("X")) Then
    '   row = (key - Asc("A")) / 6 
    '   col = (key - Asc("A")) Mod 6 
    '   scancode = row * &h10 + col 
    'Else
    '	chrkey=Chr(key)
	'	Select case (chrkey)
    '     case "0"   
    '     	scancode = &h82
    '     case "1"   
    '     	scancode = &h72
    '     case "2"   
    '     	scancode = &h73
    '     case "3"   
    '     	scancode = &h74
    '     case "4"   
    '     	scancode = &h62
    '     case "5"   
    '     	scancode = &h63
    '     case "6"   
    '     	scancode = &h64
    '     case "7"   
    '     	scancode = &h52
    '     case "8"   
    '     	scancode = &h53
    '     case "9"   
    '     	scancode = &h54
    '     case "."   
    '     	scancode = &h83
    '     case " "   
    '     	scancode = &h84
    '     case "+"   
    '     	scancode = &h85
    '     case "-"   
    '     	scancode = &h75
    '     case "*"   
    '     	scancode = &h65
    '     case "/"   
    '     	scancode = &h55
    '     case "Y"   
    '     	scancode = &h42
    '     case "\\"  
    '     	scancode = &h20
    '     case "Z"  
    '     	scancode = &h43
    '     case "`"   
    '     	scancode = &h51
    '     case "\n" 
    '     case "\r"  
    '     	scancode = &h41: retval = 1
    '     case "esc" 
    '     	scancode = &h81: retval = 1
    '     case "\b"  
    '     	scancode = &h45: retval = 1
    '     case "\\" 
    '     case "\t"  
    '     	scancode = &h15: retval = 1
    '     'case KEYC_LEFT       
    '     '	scancode = &h23
    '     'case KEYC_UP         
    '     '	scancode = &h14
    '     'case KEYC_RIGHT      
    '     '	scancode = &h25
    '     'case KEYC_DOWN       
    '     '	scancode = &h24
    '     'case KEYC_DELETE     
    '     '	scancode = &h44
    '     'case KEYC_PGUP       
    '     '	scancode = &h61
    '     'case KEYC_PGDN       
    '     '	scancode = &h71
    '     'case KEYF_FKEY+1 
    '     'case KEYF_FKEY+2 
    '     'case KEYF_FKEY+3 
    '     'case KEYF_FKEY+4 
    '     'case KEYF_FKEY+5 
    '     'case KEYF_FKEY+6 
    '     '   scancode = key-KEYF_FKEY-1: retval = 1
	'	End Select
    'End If

    'if (scancode <> -1) Then
    '   kbd_handler(scancode, 1) 
    '   Sleep(100) 
    '   kbd_handler(scancode, 0) 
    'End If
    '
    Return 0'retval 
End Function 

Function translatekeys( vmsg As string ) As Integer  

   'MSG *msg = (MSG*) vmsg 
   'Dim As Integer MSG
   'Dim As Integer state=0 

   'Select Case (msg->message)
   ' case WM_Dim As Byte 
   '    if (keyprocessed And IGNORE_WM_CHAR) Then
   '    
   '       keyprocessed And= INV( IGNORE_WM_Dim As Byte 
   '       return 1 
   '    
   '    else
   '       return keyevent(KEYFROMASCII(msg->wParam)) 
   '    End If

   ' case WM_SYSKEYDOWN 
   ' case WM_KEYDOWN 
   '    state   = IIf((GetKeyState(VK_SHIFT)   And &h8000) , KEYF_SHIFT , 0 )
   '    state Or= IIf((GetKeyState(VK_CONTROL) And &h8000) , KEYF_CTRL  , 0 )
   '    state Or= iif((GetKeyState(VK_MENU)    And &h8000) , KEYF_ALT   , 0 )
   '    if (msg->wParam >= VK_F1 And msg->wParam <= VK_F12) Then
   '       return keyevent((msg->wParam-(VK_F1-1)+KEYF_FKEY)Or state) 
   '    else
   '    
   '       Dim As Integer i 
   '       Dim As Long k 
   '       Select Case (msg->wParam)
   '       
   '          case VK_PRIOR 
   '          k = (KEYC_PAGEUP Or state)
   '          case VK_NEXT 
   '          k = (KEYC_PAGEDOWN Or state)
   '          case VK_END 
   '          k = (KEYC_END Or state)
   '          case VK_HOME 
   '          k = (KEYC_HOME Or state)
   '          case VK_LEFT 
   '          k = (KEYC_LEFT Or state)
   '          case VK_UP 
   '          k = (KEYC_UP Or state)
   '          case VK_RIGHT 
   '          k = (KEYC_RIGHT Or state)
   '          case VK_DOWN 
   '          k = (KEYC_DOWN Or state)
   '          case VK_INSERT 
   '          k = (KEYC_INSERT Or state)
   '          case VK_DELETE 
   '          k = (KEYC_DELETE Or state)
   '       	Case Else 
   '          k = (KEYFROMSCAN(msg->wParam)Or state)
   '       End Select
   '       i = keyevent(k) 
   '       if (i)
   '          keyprocessed Or= IGNORE_WM_CHAR 
   '       return i 
   '    End If
   'End Select
   return 0 
End Function 

