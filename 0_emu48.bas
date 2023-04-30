
Enum modelosHP
	GX=1,
	SX=2
End Enum
Dim Shared As Integer modelo


' para el empleo de MULTIKEY
#include "fbgfx.bi"
#if __FB_LANG__ = "fb"
Using FB 
#endif

' varios opcionales, usados tipicamente en "C"
#include "crt\math.bi" ' ceil(), floor(), M_PI, pow(), fabs(), sqrt(), etc
#Include "crt\stdio.bi" ' printf(), scanf(), fopen(), etc
#Include "crt\stdlib.bi" ' malloc(),calloc(), etc

' rutinas
'#Include "pch.bi"
#Include "1_variables.bas"
#Include "2_declaraciones.bas"
#Include "4_instr.bas"
#Include "3_saturn.bas"
#Include "5_hardware.bas"
#Include "6_memoria.bas"
#Include "7_teclado.bas"


  f=525:g=670
  Screenres f,g,32
  
  ' cargo la imagen del teclado, la amplio y la pongo en su sitio final
	Dim bmp_keyb As Any Ptr = ImageCreate( 210, 200 )
	bmp_keyb = BLoad ( "teclado.bmp" )
   Put (0, 0), bmp_keyb
   ImageDestroy( bmp_keyb )
   For a=0 To 210
   	For b=0 To 200
   		c=Point(a,b)
   		d=(a*2)+62
   		e=(b*2)+(g-405)
   		PSet (d+0,e+0),c
   		PSet (d+1,e+1),c
   		PSet (d+1,e+0),c
   		PSet (d+0,e+1),c
   	Next
   Next

  
  load_state=0 ' 0 para empezar desde "0"
  modelo=GX
  
  load()
  

  emulate()

sleep
