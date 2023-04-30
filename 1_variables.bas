Dim Shared As Integer a,b,c,e,f,g,h


#define XM 1
#define SB 2
#define SR 4
#define MP 8

#define CRC_(nib)     crc=(crc Shr 4) Xor (((crc Xor (nib)) And &hf)*&h1081)
#define ISMODULE(n,d) ((ucfg(n)=0) And (d>=base_(n)) And (d<(base_(n)+size(n))))
#define INTERRUPT(t)  INTP=1:rstkpush(pc):pc=&hf: 'print "INTERRUPT:";t
#define PCHANGED      F_s(0)=P : F_l(1)=P+1

Dim Shared As Byte AA(15) 
Dim Shared As Byte BB(15) 
Dim Shared As Byte CC(15) 
Dim Shared As Byte DD(15) 
Dim Shared As Byte R0(15) 
Dim Shared As Byte R1(15) 
Dim Shared As Byte R2(15) 
Dim Shared As Byte R3(15) 
Dim Shared As Byte R4(15) 
Dim Shared As Byte ST(3) 

Dim Shared As Integer F_s(15) = {0,0,2,0,15,3,0,0,0,0,0,0,0,0,0,0} 
Dim Shared As Integer F_l(15) = {1,0,1,3,1,12,2,16,0,0,0,0,0,0,0,5} 

Dim Shared As Byte ioram(63) = {_
  &h0,&h0,&h0,&h0, &h0,&h0,&h0,&h0, &h0,&h0,&h0,&h0, &h0,&h0,&hC,&h0,_
  &h0,&h0,&h0,&h0, &h0,&h0,&h0,&h0, &h0,&h0,&h0,&h0, &h0,&h0,&h0,&h0,_
  &h0,&h0,&h0,&h0, &h0,&h0,&h0,&h0, &h0,&h0,&h0,&h0, &h0,&h0,&h0,&h0,_
  &h0,&h0,&h0,&h0, &h0,&h0,&h0,&hf, &hf,&hf,&hf,&hf, &hf,&hf,&hf,&hf _
}  

Dim Shared As Integer chip_id(11) = { _
  &h00019, &h00003, &h00005, &h00007, &h00001, &h00000, _
  &h00019, &h000F4, &h000F6, &h000F8, &h000F2, &h00000 } 

Dim Shared As Byte HST=0, P=0
Dim Shared As integer  OUT_ = 0, IN_ = 0
Dim Shared As Integer  SHUTDN=0, INTP=0, INTE=0, INTD=0, rstkp = 0, MODE = 16, CARRY=0
Dim Shared As Long rstk(7) = {0,0,0,0,0,0,0,0}

Dim Shared As Long pc=0, d0=0, d1=0

Dim Shared As byte CARDSTATUS = 0


Dim Shared As Byte Ptr eprom
Dim Shared As Byte Ptr rom = NULL, ram, port1, port2
Dim Shared As Byte Ptr Dato(5)={NULL,NULL,NULL,NULL,NULL,NULL}
Dim Shared As Integer ucfg(5)={1,1,1,1,1,0}, bank1, bank2
Dim Shared As Long base_(5)={&h00100,&h80000,&h7F000,&h7E000,&h7E000,&h000000}
Dim Shared As Long size(5) ={&h00040,&h40000,&h01000,&h01000,&h01000,&h100000}
Dim Shared As UShort crc
Dim Shared As ULong t1=&hf, t2=&hffffffff
Dim Shared As ULong saturn_speed = 90000
Dim Shared As Integer quit = 0
Dim Shared As integer load_state = 0


Type display_t 
  As Integer line_
  As Long start1 
  As Long start12 
  As Long end1 
  As Long start2 
  As Long end2 
  As Integer loffset 
  As Integer boffset 
  As Integer lcntsave 
  As Integer lcounter 
  As Integer dispon 
  As Integer contrast 
  As Integer noscan 
  As Byte Ptr Pointer_ 
  As Integer disoffs 
  As Integer touched 
End Type 

Dim Shared As display_t display 
'Dim Shared As Integer font(256) 
Dim Shared As Integer KDN, KDN_rising_edge 
Dim Shared As Integer IR15X 
'Dim Shared As Byte Buf(80) 

Dim Shared As byte kbd_row(8)= {0, 0, 0, 0, 0, 0, 0, 0, 0}
Dim Shared As integer thread_suspended = 0
Dim Shared As integer keyprocessed = 0
Dim Shared As integer keypressed = 0
Dim Shared As integer tecla_leida = 0


'
'#define KEYFROMASCII(ascii)        (ascii)
'#define KEYFROMSCAN(scan )         ((scan) Or  KEYF_SCAN)
'#define KEYFROMKEYC(scan )         ((keyc) Or  KEYF_KEYC)
'#define KEYFROMCOMMAND(commando)   ((commando)  Or  KEYF_COMMAND)
'
'#define KEYF_COMMAND     &h10000L       '' Cannot be enumerated: compiler bug ?!?
'#define KEYF_UP          &h20000L
'
'enum 
'	KEYFLAGS=&h1000, 
'	KEYF_KEYC=&h2000, 
'	KEYF_FKEY=KEYF_KEYC+100,
'	KEYF_SHIFT=&h100, 
'	KEYF_CTRL=&h400, 
'	KEYF_ALT=&h800 
'End Enum
'
'#define KEYC_BACKSPACE  8
'#define KEYC_BS        KEYC_BACKSPACE
'#define KEYC_TAB        9
'#define KEYC_ENTER     13
'#define KEYC_ESC       27
'#define KEYC_DEL      (KEYF_KEYC+146)
'#define KEYC_DELETE    KEYC_DEL
'#define KEYC_INSERT   (KEYF_KEYC+148)
'#define KEYC_INS       KEYC_INSERT
'#define KEYC_END      (KEYF_KEYC+149)
'#define KEYC_DOWN     (KEYF_KEYC+150)
'#define KEYC_PAGEDOWN (KEYF_KEYC+151)
'#define KEYC_PGDN      KEYC_PAGEDOWN
'#define KEYC_LEFT     (KEYF_KEYC+152)
'#define KEYC_RIGHT    (KEYF_KEYC+154)
'#define KEYC_HOME     (KEYF_KEYC+155)
'#define KEYC_UP       (KEYF_KEYC+156)
'#define KEYC_PAGEUP   (KEYF_KEYC+157)
'#define KEYC_PGUP      KEYC_PAGEUP



'#Include "hardware.bi"
'#include "shellapi.bi"
'#include "commctrl.bi"
'#include "shlobj.bi"
'#include "stdlib.bi"
'#include "malloc.bi"
'#include "stddef.bi"
'#include "ctype.bi"
'#include "stdio.bi"
'#include "direct.bi"
'#include "conio.bi"


'' normally defined in STDLIB.H
'#define __max(a,b)  iif(((a) > (b)) , (a) , (b))
'#define __min(a,b)  IIf(((a) < (b)) , (a) , (b))

'' normally defined in CONIO.H
'Declare Function _inp(a As UShort) As Integer 
'Declare Function _outp(a As UShort, b As Integer ) As Integer 

Dim Shared as Single pipi


#define goyes(n) GOJMP = I+n: GoTo o_goyes

/'                                P  WP*  XS   X   S   M   B   W   P  WP  XS   X   S   M   B   W'/
Dim Shared As Integer F04(15) = {  4, 32,  4, 12,  4, 48,  8, 64,  4,  4,  4, 12,  4, 48,  8, 64} 
Dim Shared As Integer FRD(15) = {132,202,132,152,132,248,142,288,132,202,132,152,132,248,142,288} 
Dim Shared As Integer FWR(15) = {142,212,142,162,142,232,152,272,142,212,142,162,142,232,152,272} 
/'                                P  WP  XS   X   S   M   B   W   -   -   -   -   -   -   -   A'/
Dim Shared As Integer S00(15) = {124,124,124, 68,124,124, 64,120,  0,  0,  0,  0,  0,  0,  0, 76} 
/'                                0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F'/
Dim Shared As Integer D10(15) = {  0, 10, 20, 30, 40, 50, 60, 70, 80, 90,100,110,120,130,140,150} 
Dim Shared As Integer NWR(15) = {142,132,162,152,182,172,202,192,222,212,242,232,262,252,282,272} 
Dim Shared As Integer NRD(15) = {132,148,152,168,172,188,192,208,212,228,232,248,252,268,272,288} 
/'108 874'/
Dim Shared As Byte X(15) 

Dim Shared As FILE ptr wire 
Dim Shared As Long ticks
Dim Shared As Long update_lcd
Dim Shared As Long update_kbd 

Dim Shared As Long d 
Dim Shared As Byte Ptr I
Dim Shared As Byte Ptr GOJMP
Dim Shared As Byte n 
Dim Shared As Byte jmp 

Dim Shared As integer cadaxveces=0

