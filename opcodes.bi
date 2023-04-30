
'     Copyright (C) 1995 Sebastien Carlier (sebc@cybera.anet.fr)

o00: ticks-=60: HST Or=XM: pc = rstkpop() : goto o_done
o01: ticks-=60: pc = rstkpop() : goto o_done
o02: ticks-=60: CARRY=1: pc = rstkpop() : goto o_done
o03: ticks-=60: CARRY=0: pc = rstkpop() : goto o_done
o04: ticks-=24: pc+=2: MODE=16: goto o_done
o05: ticks-=24: pc+=2: MODE=10: goto o_done
o06: ticks-=44: pc+=2: rstkpush(Npack(@CC(0),5)) : goto o_done
o07: ticks-=44: pc+=2: Nunpack(@CC(0), rstkpop(), 5) : goto o_done
o08: ticks-=32: pc+=2: Nzero(@ST(0),4) : goto o_done
o09: ticks-=32: pc+=2: Ncopy(@CC(0), @ST(0), 4) : goto o_done
o0A: ticks-=32: pc+=2: Ncopy(@ST(0), @CC(0), 4) : goto o_done
o0B: ticks-=32: pc+=2: Nxchg(@CC(0), @ST(0), 4) : goto o_done

o0C: 
	ticks-=24
	pc+=2
	P+=1
	if (P>15) Then P=0 : CARRY=1 Else CARRY=0
	PCHANGED 
	GoTo o_done
	
o0D: 
	ticks-=24
	pc+=2
	P-=1
	if (P< 0) Then P=15: CARRY=1 Else CARRY=0
	PCHANGED 
	GoTo o_done

o0Ef0: ticks-=40+F04(CInt(I[2])) : pc+=4: NFand(@AA(0),@BB(0),I[2]) : goto o_done
o0Ef1: ticks-=40+F04(CInt(I[2])) : pc+=4: NFand(@BB(0),@CC(0),I[2]) : goto o_done
o0Ef2: ticks-=40+F04(CInt(I[2])) : pc+=4: NFand(@CC(0),@AA(0),I[2]) : goto o_done
o0Ef3: ticks-=40+F04(CInt(I[2])) : pc+=4: NFand(@DD(0),@CC(0),I[2]) : goto o_done
o0Ef4: ticks-=40+F04(CInt(I[2])) : pc+=4: NFand(@BB(0),@AA(0),I[2]) : goto o_done
o0Ef5: ticks-=40+F04(CInt(I[2])) : pc+=4: NFand(@CC(0),@BB(0),I[2]) : goto o_done
o0Ef6: ticks-=40+F04(CInt(I[2])) : pc+=4: NFand(@AA(0),@CC(0),I[2]) : goto o_done
o0Ef7: ticks-=40+F04(CInt(I[2])) : pc+=4: NFand(@CC(0),@DD(0),I[2]) : goto o_done

o0Ef8: ticks-=40+F04(CInt(I[2])) : pc+=4: NFor(@AA(0),@BB(0),I[2]) : goto o_done
o0Ef9: ticks-=40+F04(CInt(I[2])) : pc+=4: NFor(@BB(0),@CC(0),I[2]) : goto o_done
o0EfA: ticks-=40+F04(CInt(I[2])) : pc+=4: NFor(@CC(0),@AA(0),I[2]) : goto o_done
o0EfB: ticks-=40+F04(CInt(I[2])) : pc+=4: NFor(@DD(0),@CC(0),I[2]) : goto o_done
o0EfC: ticks-=40+F04(CInt(I[2])) : pc+=4: NFor(@BB(0),@AA(0),I[2]) : goto o_done
o0EfD: ticks-=40+F04(CInt(I[2])) : pc+=4: NFor(@CC(0),@BB(0),I[2]) : goto o_done
o0EfE: ticks-=40+F04(CInt(I[2])) : pc+=4: NFor(@AA(0),@CC(0),I[2]) : goto o_done
o0EfF: ticks-=40+F04(CInt(I[2])) : pc+=4: NFor(@CC(0),@DD(0),I[2]) : goto o_done

o0F: ticks-=60: if (INTD And INTE) Then INTD=0 : pc=&hf : GoTo o_done else INTP=0 : pc=rstkpop() : GoTo o_done

o100: ticks-=93: pc+=3: Ncopy(@R0(0), @AA(0), 16) : goto o_done
o101: ticks-=93: pc+=3: Ncopy(@R1(0), @AA(0), 16) : goto o_done
o102: ticks-=93: pc+=3: Ncopy(@R2(0), @AA(0), 16) : goto o_done
o103: ticks-=93: pc+=3: Ncopy(@R3(0), @AA(0), 16) : goto o_done
o104: ticks-=93: pc+=3: Ncopy(@R4(0), @AA(0), 16) : goto o_done
o108: ticks-=93: pc+=3: Ncopy(@R0(0), @CC(0), 16) : goto o_done
o109: ticks-=93: pc+=3: Ncopy(@R1(0), @CC(0), 16) : goto o_done
o10A: ticks-=93: pc+=3: Ncopy(@R2(0), @CC(0), 16) : goto o_done
o10B: ticks-=93: pc+=3: Ncopy(@R3(0), @CC(0), 16) : goto o_done
o10C: ticks-=93: pc+=3: Ncopy(@R4(0), @CC(0), 16) : goto o_done
o110: ticks-=93: pc+=3: Ncopy(@AA(0), @R0(0), 16) : goto o_done
o111: ticks-=93: pc+=3: Ncopy(@AA(0), @R1(0), 16) : goto o_done
o112: ticks-=93: pc+=3: Ncopy(@AA(0), @R2(0), 16) : goto o_done
o113: ticks-=93: pc+=3: Ncopy(@AA(0), @R3(0), 16) : goto o_done
o114: ticks-=93: pc+=3: Ncopy(@AA(0), @R4(0), 16) : goto o_done
o118: ticks-=93: pc+=3: Ncopy(@CC(0), @R0(0), 16) : goto o_done
o119: ticks-=93: pc+=3: Ncopy(@CC(0), @R1(0), 16) : goto o_done
o11A: ticks-=93: pc+=3: Ncopy(@CC(0), @R2(0), 16) : goto o_done
o11B: ticks-=93: pc+=3: Ncopy(@CC(0), @R3(0), 16) : goto o_done
o11C: ticks-=93: pc+=3: Ncopy(@CC(0), @R4(0), 16) : goto o_done
o120: ticks-=93: pc+=3: Nxchg(@AA(0), @R0(0), 16) : goto o_done
o121: ticks-=93: pc+=3: Nxchg(@AA(0), @R1(0), 16) : goto o_done
o122: ticks-=93: pc+=3: Nxchg(@AA(0), @R2(0), 16) : goto o_done
o123: ticks-=93: pc+=3: Nxchg(@AA(0), @R3(0), 16) : goto o_done
o124: ticks-=93: pc+=3: Nxchg(@AA(0), @R4(0), 16) : goto o_done
o128: ticks-=93: pc+=3: Nxchg(@CC(0), @R0(0), 16) : goto o_done
o129: ticks-=93: pc+=3: Nxchg(@CC(0), @R1(0), 16) : goto o_done
o12A: ticks-=93: pc+=3: Nxchg(@CC(0), @R2(0), 16) : goto o_done
o12B: ticks-=93: pc+=3: Nxchg(@CC(0), @R3(0), 16) : goto o_done
o12C: ticks-=93: pc+=3: Nxchg(@CC(0), @R4(0), 16) : goto o_done

o130: ticks-=49: pc+=3: d0 = Npack(@AA(0), 5) : goto o_done
o131: ticks-=49: pc+=3: d1 = Npack(@AA(0), 5) : goto o_done
o132: ticks-=49: pc+=3: d = d0: d0=Npack(@AA(0), 5) : Nunpack(@AA(0), d, 5) : goto o_done
o133: ticks-=49: pc+=3: d = d1: d1=Npack(@AA(0), 5) : Nunpack(@AA(0), d, 5) : goto o_done
o134: ticks-=49: pc+=3: d0 = Npack(@CC(0), 5) : goto o_done
o135: ticks-=49: pc+=3: d1 = Npack(@CC(0), 5) : goto o_done
o136: ticks-=49: pc+=3: d = d0: d0=Npack(@CC(0), 5) : Nunpack(@CC(0), d, 5) : goto o_done
o137: ticks-=49: pc+=3: d = d1: d1=Npack(@CC(0), 5) : Nunpack(@CC(0), d, 5) : goto o_done
o138: ticks-=45: pc+=3: d0 and=&hf0000: d0 or=Npack(@AA(0), 4) : goto o_done
o139: ticks-=45: pc+=3: d1 and=&hf0000: d1 or=Npack(@AA(0), 4) : goto o_done
o13A: ticks-=45: pc+=3: d = d0: d0 and=&hf0000: d0 or=Npack(@AA(0), 4) : Nunpack(@AA(0), d, 4) : goto o_done
o13B: ticks-=45: pc+=3: d = d1: d1 and=&hf0000: d1 or=Npack(@AA(0), 4) : Nunpack(@AA(0), d, 4) : goto o_done
o13C: ticks-=45: pc+=3: d0 and=&hf0000: d0 or=Npack(@CC(0), 4) : goto o_done
o13D: ticks-=45: pc+=3: d1 and=&hf0000: d1 or=Npack(@CC(0), 4) : goto o_done
o13E: ticks-=45: pc+=3: d = d0: d0 and=&hf0000: d0 or=Npack(@CC(0), 4) : Nunpack(@CC(0), d, 4) : goto o_done
o13F: ticks-=45: pc+=3: d = d1: d1 and=&hf0000: d1 or=Npack(@CC(0), 4) : Nunpack(@CC(0), d, 4) : goto o_done

o140: ticks-=148: pc+=3: Nwrite(@AA(0), d0, 5) : goto o_done
o141: ticks-=148: pc+=3: Nwrite(@AA(0), d1, 5) : goto o_done
o142: ticks-=138: pc+=3: NCread(@AA(0), d0, 5) : goto o_done
o143: ticks-=138: pc+=3: NCread(@AA(0), d1, 5) : goto o_done
o144: ticks-=148: pc+=3: Nwrite(@CC(0), d0, 5) : goto o_done
o145: ticks-=148: pc+=3: Nwrite(@CC(0), d1, 5) : goto o_done
o146: ticks-=138: pc+=3: NCread(@CC(0), d0, 5) : goto o_done
o147: ticks-=138: pc+=3: NCread(@CC(0), d1, 5) : goto o_done
o148: ticks-=98:  pc+=3: Nwrite(@AA(0), d0, 2) : goto o_done
o149: ticks-=98:  pc+=3: Nwrite(@AA(0), d1, 2) : goto o_done
o14A: ticks-=114: pc+=3: NCread(@AA(0), d0, 2) : goto o_done
o14B: ticks-=114: pc+=3: NCread(@AA(0), d1, 2) : goto o_done
o14C: ticks-=98:  pc+=3: Nwrite(@CC(0), d0, 2) : goto o_done
o14D: ticks-=98:  pc+=3: Nwrite(@CC(0), d1, 2) : goto o_done
o14E: ticks-=114: pc+=3: NCread(@CC(0), d0, 2) : goto o_done
o14F: ticks-=114: pc+=3: NCread(@CC(0), d1, 2) : goto o_done

o150a: ticks-=FWR(I[3]) : pc+=4: NFwrite(@AA(0), d0, I[3]) : goto o_done
o151a: ticks-=FWR(I[3]) : pc+=4: NFwrite(@AA(0), d1, I[3]) : goto o_done
o152a: ticks-=FRD(I[3]) : pc+=4: NCFread(@AA(0), d0, I[3]) : goto o_done
o153a: ticks-=FRD(I[3]) : pc+=4: NCFread(@AA(0), d1, I[3]) : goto o_done
o154a: ticks-=FWR(I[3]) : pc+=4: NFwrite(@CC(0), d0, I[3]) : goto o_done
o155a: ticks-=FWR(I[3]) : pc+=4: NFwrite(@CC(0), d1, I[3]) : goto o_done
o156a: ticks-=FRD(I[3]) : pc+=4: NCFread(@CC(0), d0, I[3]) : goto o_done
o157a: ticks-=FRD(I[3]) : pc+=4: NCFread(@CC(0), d1, I[3]) : goto o_done

o158x: ticks-=NWR(I[3]) : pc+=4: Nwrite(@AA(0), d0, I[3]+1) : goto o_done
o159x: ticks-=NWR(I[3]) : pc+=4: Nwrite(@AA(0), d1, I[3]+1) : goto o_done
o15Ax: ticks-=NRD(I[3]) : pc+=4: NCread(@AA(0), d0, I[3]+1) : goto o_done
o15Bx: ticks-=NRD(I[3]) : pc+=4: NCread(@AA(0), d1, I[3]+1) : goto o_done
o15Cx: ticks-=NWR(I[3]) : pc+=4: Nwrite(@CC(0), d0, I[3]+1) : goto o_done
o15Dx: ticks-=NWR(I[3]) : pc+=4: Nwrite(@CC(0), d1, I[3]+1) : goto o_done
o15Ex: ticks-=NRD(I[3]) : pc+=4: NCread(@CC(0), d0, I[3]+1) : goto o_done
o15Fx: ticks-=NRD(I[3]) : pc+=4: NCread(@CC(0), d1, I[3]+1) : goto o_done

o16x:  ticks-=45: pc+=3: d0+=I[2]+1: if (d0>&hfffff) Then d0 and=&hfffff: CARRY=1: goto o_done else CARRY=0: goto o_done
o17x:  ticks-=45: pc+=3: d1+=I[2]+1: if (d1>&hfffff) Then d1 and=&hfffff: CARRY=1: goto o_done else CARRY=0: goto o_done

o18x:  ticks-=45: pc+=3: d0-=I[2]+1: if (d0<0      ) Then d0 and=&hfffff: CARRY=1: goto o_done else CARRY=0: goto o_done
o1Cx:  ticks-=45: pc+=3: d1-=I[2]+1: if (d1<0      ) Then d1 and=&hfffff: CARRY=1: goto o_done else CARRY=0: goto o_done

o19d2: ticks-=40: pc+=4: d0 and=&hfff00: d0 or=Npack(@I[2], 2) : goto o_done
o1Ad4: ticks-=60: pc+=6: d0 and=&hf0000: d0 or=Npack(@I[2], 4) : goto o_done

o1Bd5: ticks-=70: pc+=7: d0=Npack(@I[2], 5) : goto o_done

o1Dd2: ticks-=40: pc+=4: d1 and=&hfff00: d1 or=Npack(@I[2], 2) : goto o_done
o1Ed4: ticks-=60: pc+=6: d1 and=&hf0000: d1 or=Npack(@I[2], 4) : goto o_done

o1Fd5: ticks-=70: pc+=7: d1=Npack(@I[2], 5) : goto o_done

o2n:   ticks-=20: pc+=2: P=I[1] : PCHANGED: goto o_done



'''''''''''''''''''
o3X: 
	ticks-=30+D10(I[1])
	n=I[1]+1
	pc+=(2+n)
	if (P+n)<=16 Then 
		Ncopy(@CC(P), I+2, n)
	Else
		Ncopy(@CC(P), I+2, 16-P) 
		Ncopy(@CC(0), I+2+(16-P), n-(16-P)) 
	EndIf
	GoTo o_done


''''''''''''''''''''
o4d2:
	ticks-=30
	if (CARRY) Then  
		d=Npack(@I[1],2)
		if (d) Then 
			ticks-=40
			if (d and &h80) then 
				pc-=(d xor &hff)
			else 
				pc+=d+1 
			EndIf
		Else 
			pc=rstkpop()
		End If
	Else 
		pc+=3
	EndIf
	GoTo o_done
''''''''''''''''''''
o5d2:
	ticks-=30
	if (CARRY=0) Then  
		d=Npack(@I[1],2)
		if (d) Then 
			ticks-=40
			if (d and &h80) then 
				pc-=(d xor &hff)
			else 
				pc+=d+1 
			EndIf
		Else 
			pc=rstkpop()
		End If
	Else 
		pc+=3
	EndIf
	GoTo o_done
''''''''''''''''''''

o6d3: ticks-=80:                  d=Npack(@I[1],3) : If (d and &h800) Then pc-=(d xor &hfff)  : goto o_done Else pc+=d+1: goto o_done
o7d3: ticks-=82: rstkpush(pc+4) : d=Npack(@I[1],3) : if (d and &h800) Then pc-=(d xor &hfff)-3: goto o_done else pc+=d+4: goto o_done

o800: ticks-=33: pc+=3: OUT_ and=&hff0: OUT_ or=CC(0) : goto o_done ' ojo CC(0) como puntero o como dato??
o801: ticks-=41: pc+=3: OUT_ = Npack(@CC(0), 3) : goto o_done

o802: ticks-=70: pc+=3: update_in() : Nunpack(@AA(0), IN_, 4) : goto o_done
o803: ticks-=70: pc+=3: update_in() : Nunpack(@CC(0), IN_, 4) : goto o_done

o804: ticks-=73: pc+=3: unconfig() : goto o_done
o805: ticks-=73: pc+=3: config()   : goto o_done

o806: ticks-=73: pc+=3: c_eq_id()  : goto o_done
o807: ticks-=60: pc+=3: SHUTDN = 1 : goto o_done

o8080: 
	ticks-=42
	pc+=4
	INTE=1
	If (INTD and (INTP=0)) Then INTD=0:INTERRUPT("DL") 
	goto o_done


'''''''
o80810: 
	ticks-=53
	pc+=5
	if (IN_) Then 
		If (INTP=0) Then INTERRUPT("RS") Else INTD=1
	End If
	GoTo o_done


''''''''''
o8082X: 
	ticks-=60+D10(I[1]) 
	n=I[4]+1
	pc+=(5+n)
	if (P+n)<=16 Then 
		Ncopy(@AA(P), I+5, n)
	Else
		Ncopy(@AA(P), I+5, 16-P)
		Ncopy(@AA(0), I+5+(16-P), n-(16-P))
	EndIf
	GoTo o_done

o8083: ticks-=73: pc+=4: goto o_done
o8084n: ticks-=53:  pc+=5: Nbit0(@AA(0), I[4]) : goto o_done
o8085n: ticks-=53:  pc+=5: Nbit1(@AA(0), I[4]) : goto o_done
o8086n: ticks-=117: pc+=5: Tbit0(@AA(0), I[4]) : goyes(5)
o8087n: ticks-=117: pc+=5: Tbit1(@AA(0), I[4]) : goyes(5)
o8088n: ticks-=53:  pc+=5: Nbit0(@CC(0), I[4]) : goto o_done
o8089n: ticks-=53:  pc+=5: Nbit1(@CC(0), I[4]) : goto o_done
o808An: ticks-=117: pc+=5: Tbit0(@CC(0), I[4]) : goyes(5)
o808Bn: ticks-=117: pc+=5: Tbit1(@CC(0), I[4]) : goyes(5)
o808C: ticks-=230: pc = Npack(nibble_ptr(Npack(@AA(0),5)), 5) : goto o_done
o808D: ticks-=73: pc+=4: goto o_done
o808E: ticks-=230: pc = Npack(nibble_ptr(Npack(@CC(0),5)), 5) : goto o_done
o808F: ticks-=42: pc+=4: INTE = 0: goto o_done

o809: 
	ticks-=49
	pc+=3
	d=Npack(@CC(0), 5)
	d+=P+1
	if (d>&hfffff) Then 
		d and=&hfffff
		CARRY=1
	Else
		CARRY=0
	End If
	Nunpack(@CC(0), d, 5)
	goto o_done


o80A: ticks-=73: pc+=3: reset_() : goto o_done
o80B: ticks-=73: pc+=3: goto o_done
o80Cn: ticks-=48: pc+=4: CC(I[3]) = P: goto o_done
o80Dn: ticks-=48: pc+=4: P = CC(I[3]) : PCHANGED: goto o_done
o80E: ticks-=58: pc+=3: CC(0)=0: goto o_done
o80Fn: ticks-=48: pc+=4: n = P: P = CC(I[3]) : CC(I[3]) = n: PCHANGED : GoTo o_done

o810: ticks-=101: pc+=3: Nslc(@AA(0), 16) : goto o_done
o811: ticks-=101: pc+=3: Nslc(@BB(0), 16) : goto o_done
o812: ticks-=101: pc+=3: Nslc(@CC(0), 16) : goto o_done
o813: ticks-=101: pc+=3: Nslc(@DD(0), 16) : goto o_done
o814: ticks-=101: pc+=3: Nsrc(@AA(0), 16) : goto o_done
o815: ticks-=101: pc+=3: Nsrc(@BB(0), 16) : goto o_done
o816: ticks-=101: pc+=3: Nsrc(@CC(0), 16) : goto o_done
o817: ticks-=101: pc+=3: Nsrc(@DD(0), 16) : goto o_done

o818f0x: ticks-=S00(I[3]) : pc+=6: NFunpack(@X(0),I[5]+1,I[3]) : NFadd(@AA(0), @X(0), I[3]) : goto o_done
o818f1x: ticks-=S00(I[3]) : pc+=6: NFunpack(@X(0),I[5]+1,I[3]) : NFadd(@BB(0), @X(0), I[3]) : goto o_done
o818f2x: ticks-=S00(I[3]) : pc+=6: NFunpack(@X(0),I[5]+1,I[3]) : NFadd(@CC(0), @X(0), I[3]) : goto o_done
o818f3x: ticks-=S00(I[3]) : pc+=6: NFunpack(@X(0),I[5]+1,I[3]) : NFadd(@DD(0), @X(0), I[3]) : goto o_done
o818f8x: ticks-=S00(I[3]) : pc+=6: NFunpack(@X(0),I[5]+1,I[3]) : NFsub(@AA(0), @X(0), I[3]) : goto o_done
o818f9x: ticks-=S00(I[3]) : pc+=6: NFunpack(@X(0),I[5]+1,I[3]) : NFsub(@BB(0), @X(0), I[3]) : goto o_done
o818fAx: ticks-=S00(I[3]) : pc+=6: NFunpack(@X(0),I[5]+1,I[3]) : NFsub(@CC(0), @X(0), I[3]) : goto o_done
o818fBx: ticks-=S00(I[3]) : pc+=6: NFunpack(@X(0),I[5]+1,I[3]) : NFsub(@DD(0), @X(0), I[3]) : goto o_done

o819f0: ticks-=53+F04(I[3]) : pc+=5: NFsrb(@AA(0), I[3]) : goto o_done
o819f1: ticks-=53+F04(I[3]) : pc+=5: NFsrb(@BB(0), I[3]) : goto o_done
o819f2: ticks-=53+F04(I[3]) : pc+=5: NFsrb(@CC(0), I[3]) : goto o_done
o819f3: ticks-=53+F04(I[3]) : pc+=5: NFsrb(@DD(0), I[3]) : goto o_done

o81Af00: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@R0(0), @AA(0), I[3]) : goto o_done
o81Af01: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@R1(0), @AA(0), I[3]) : goto o_done
o81Af02: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@R2(0), @AA(0), I[3]) : goto o_done
o81Af03: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@R3(0), @AA(0), I[3]) : goto o_done
o81Af04: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@R4(0), @AA(0), I[3]) : goto o_done
o81Af08: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@R0(0), @CC(0), I[3]) : goto o_done
o81Af09: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@R1(0), @CC(0), I[3]) : goto o_done
o81Af0A: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@R2(0), @CC(0), I[3]) : goto o_done
o81Af0B: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@R3(0), @CC(0), I[3]) : goto o_done
o81Af0C: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@R4(0), @CC(0), I[3]) : goto o_done
o81Af10: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@AA(0), @R0(0), I[3]) : goto o_done
o81Af11: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@AA(0), @R1(0), I[3]) : goto o_done
o81Af12: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@AA(0), @R2(0), I[3]) : goto o_done
o81Af13: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@AA(0), @R3(0), I[3]) : goto o_done
o81Af14: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@AA(0), @R4(0), I[3]) : goto o_done
o81Af18: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@CC(0), @R0(0), I[3]) : goto o_done
o81Af19: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@CC(0), @R1(0), I[3]) : goto o_done
o81Af1A: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@CC(0), @R2(0), I[3]) : goto o_done
o81Af1B: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@CC(0), @R3(0), I[3]) : goto o_done
o81Af1C: ticks-=60+F04(I[3]) : pc+=6: NFcopy(@CC(0), @R4(0), I[3]) : goto o_done
o81Af20: ticks-=60+F04(I[3]) : pc+=6: NFxchg(@AA(0), @R0(0), I[3]) : goto o_done
o81Af21: ticks-=60+F04(I[3]) : pc+=6: NFxchg(@AA(0), @R1(0), I[3]) : goto o_done
o81Af22: ticks-=60+F04(I[3]) : pc+=6: NFxchg(@AA(0), @R2(0), I[3]) : goto o_done
o81Af23: ticks-=60+F04(I[3]) : pc+=6: NFxchg(@AA(0), @R3(0), I[3]) : goto o_done
o81Af24: ticks-=60+F04(I[3]) : pc+=6: NFxchg(@AA(0), @R4(0), I[3]) : goto o_done
o81Af28: ticks-=60+F04(I[3]) : pc+=6: NFxchg(@CC(0), @R0(0), I[3]) : goto o_done
o81Af29: ticks-=60+F04(I[3]) : pc+=6: NFxchg(@CC(0), @R1(0), I[3]) : goto o_done
o81Af2A: ticks-=60+F04(I[3]) : pc+=6: NFxchg(@CC(0), @R2(0), I[3]) : goto o_done
o81Af2B: ticks-=60+F04(I[3]) : pc+=6: NFxchg(@CC(0), @R3(0), I[3]) : goto o_done
o81Af2C: ticks-=60+F04(I[3]) : pc+=6: NFxchg(@CC(0), @R4(0), I[3]) : goto o_done

o81B2: ticks-=100: pc = Npack(@AA(0), 5) : goto o_done
o81B3: ticks-=100: pc = Npack(@CC(0), 5) : goto o_done

o81B4: ticks-=60: pc+=4: Nunpack(@AA(0), pc, 5) : goto o_done
o81B5: ticks-=60: pc+=4: Nunpack(@CC(0), pc, 5) : goto o_done

o81B6: ticks-=100: d = pc+4: pc = Npack(@AA(0), 5) : Nunpack(@AA(0), d, 5) : goto o_done
o81B7: ticks-=100: d = pc+4: pc = Npack(@CC(0), 5) : Nunpack(@CC(0), d, 5) : goto o_done

o81C: ticks-=97: pc+=3: Nsrb(@AA(0), 16) : goto o_done
o81D: ticks-=97: pc+=3: Nsrb(@BB(0), 16) : goto o_done
o81E: ticks-=97: pc+=3: Nsrb(@CC(0), 16) : goto o_done
o81F: ticks-=97: pc+=3: Nsrb(@DD(0), 16) : goto o_done

o82n: ticks-=30: pc+=3: HST and=INV(I[2]) : goto o_done
o83n: ticks-=53: pc+=3: CARRY=IIf((HST and I[2]),0,1): goyes(3) 

o84n: ticks-=33: pc+=3: Nbit0(@ST(0), I[2]) : goto o_done
o85n: ticks-=33: pc+=3: Nbit1(@ST(0), I[2]) : goto o_done
o86n: ticks-=57: pc+=3: Tbit0(@ST(0), I[2]) : goyes(3) 
o87n: ticks-=57: pc+=3: Tbit1(@ST(0), I[2]) : goyes(3) 

o88n: ticks-=53: pc+=3: if (P<>I[2]) Then CARRY=1: goyes(3) Else CARRY=0: goyes(3)
o89n: ticks-=53: pc+=3: if (P =I[2]) Then CARRY=1: goyes(3) Else CARRY=0: goyes(3)

o8A0: ticks-=73: pc+=3: Te(@AA(0), @BB(0), 5) : goyes(3) 
o8A1: ticks-=73: pc+=3: Te(@BB(0), @CC(0), 5) : goyes(3) 
o8A2: ticks-=73: pc+=3: Te(@CC(0), @AA(0), 5) : goyes(3) 
o8A3: ticks-=73: pc+=3: Te(@DD(0), @CC(0), 5) : goyes(3) 
o8A4: ticks-=73: pc+=3: Tne(@AA(0), @BB(0), 5) : goyes(3) 
o8A5: ticks-=73: pc+=3: Tne(@BB(0), @CC(0), 5) : goyes(3) 
o8A6: ticks-=73: pc+=3: Tne(@CC(0), @AA(0), 5) : goyes(3) 
o8A7: ticks-=73: pc+=3: Tne(@DD(0), @CC(0), 5) : goyes(3) 

o8A8: ticks-=73: pc+=3: Tz(@AA(0), 5) : goyes(3) 
o8A9: ticks-=73: pc+=3: Tz(@BB(0), 5) : goyes(3) 
o8AA: ticks-=73: pc+=3: Tz(@CC(0), 5) : goyes(3) 
o8AB: ticks-=73: pc+=3: Tz(@DD(0), 5) : goyes(3) 
o8AC: ticks-=73: pc+=3: Tnz(@AA(0), 5) : goyes(3) 
o8AD: ticks-=73: pc+=3: Tnz(@BB(0), 5) : goyes(3) 
o8AE: ticks-=73: pc+=3: Tnz(@CC(0), 5) : goyes(3) 
o8AF: ticks-=73: pc+=3: Tnz(@DD(0), 5) : goyes(3) 

o8B0: ticks-=73: pc+=3: Ta(@AA(0), @BB(0), 5) : goyes(3) 
o8B1: ticks-=73: pc+=3: Ta(@BB(0), @CC(0), 5) : goyes(3) 
o8B2: ticks-=73: pc+=3: Ta(@CC(0), @AA(0), 5) : goyes(3) 
o8B3: ticks-=73: pc+=3: Ta(@DD(0), @CC(0), 5) : goyes(3) 
o8B4: ticks-=73: pc+=3: Tb(@AA(0), @BB(0), 5) : goyes(3) 
o8B5: ticks-=73: pc+=3: Tb(@BB(0), @CC(0), 5) : goyes(3) 
o8B6: ticks-=73: pc+=3: Tb(@CC(0), @AA(0), 5) : goyes(3) 
o8B7: ticks-=73: pc+=3: Tb(@DD(0), @CC(0), 5) : goyes(3) 
o8B8: ticks-=73: pc+=3: Tae(@AA(0), @BB(0), 5) : goyes(3) 
o8B9: ticks-=73: pc+=3: Tae(@BB(0), @CC(0), 5) : goyes(3) 
o8BA: ticks-=73: pc+=3: Tae(@CC(0), @AA(0), 5) : goyes(3) 
o8BB: ticks-=73: pc+=3: Tae(@DD(0), @CC(0), 5) : goyes(3) 
o8BC: ticks-=73: pc+=3: Tbe(@AA(0), @BB(0), 5) : goyes(3) 
o8BD: ticks-=73: pc+=3: Tbe(@BB(0), @CC(0), 5) : goyes(3) 
o8BE: ticks-=73: pc+=3: Tbe(@CC(0), @AA(0), 5) : goyes(3) 
o8BF: ticks-=73: pc+=3: Tbe(@DD(0), @CC(0), 5) : goyes(3) 

o8Cd4: ticks-=100:  d=Npack(@I[2],4) : if (d and &h8000) Then pc-=(d xor &hffff)-1: goto o_done Else pc+=d+2: goto o_done
o8Dd5: ticks-=109: pc=Npack(@I[2],5) : goto o_done

o8Ed4: ticks-=104: rstkpush(pc+6) :  d=Npack(@I[2],4) : if (d And &h8000) Then pc-=(d Xor &hffff)-5: GoTo o_done else pc+=d+6: goto o_done
o8Fd5: ticks-=113: rstkpush(pc+7) : pc=Npack(@I[2],5) : goto o_done

o9a0: ticks-=53+F04(I[1]) : pc+=3: TFe(@AA(0), @BB(0), I[1]) : goyes(3) 
o9a1: ticks-=53+F04(I[1]) : pc+=3: TFe(@BB(0), @CC(0), I[1]) : goyes(3) 
o9a2: ticks-=53+F04(I[1]) : pc+=3: TFe(@CC(0), @AA(0), I[1]) : goyes(3) 
o9a3: ticks-=53+F04(I[1]) : pc+=3: TFe(@DD(0), @CC(0), I[1]) : goyes(3) 
o9a4: ticks-=53+F04(I[1]) : pc+=3: TFne(@AA(0), @BB(0), I[1]) : goyes(3) 
o9a5: ticks-=53+F04(I[1]) : pc+=3: TFne(@BB(0), @CC(0), I[1]) : goyes(3) 
o9a6: ticks-=53+F04(I[1]) : pc+=3: TFne(@CC(0), @AA(0), I[1]) : goyes(3) 
o9a7: ticks-=53+F04(I[1]) : pc+=3: TFne(@DD(0), @CC(0), I[1]) : goyes(3) 

o9a8: ticks-=53+F04(I[1]) : pc+=3: TFz(@AA(0), I[1]) : goyes(3) 
o9a9: ticks-=53+F04(I[1]) : pc+=3: TFz(@BB(0), I[1]) : goyes(3) 
o9aA: ticks-=53+F04(I[1]) : pc+=3: TFz(@CC(0), I[1]) : goyes(3) 
o9aB: ticks-=53+F04(I[1]) : pc+=3: TFz(@DD(0), I[1]) : goyes(3) 
o9aC: ticks-=53+F04(I[1]) : pc+=3: TFnz(@AA(0), I[1]) : goyes(3) 
o9aD: ticks-=53+F04(I[1]) : pc+=3: TFnz(@BB(0), I[1]) : goyes(3) 
o9aE: ticks-=53+F04(I[1]) : pc+=3: TFnz(@CC(0), I[1]) : goyes(3) 
o9aF: ticks-=53+F04(I[1]) : pc+=3: TFnz(@DD(0), I[1]) : goyes(3) 

o9b0: ticks-=53+F04(I[1]) : pc+=3: TFa(@AA(0), @BB(0), I[1] and 7) : goyes(3) 
o9b1: ticks-=53+F04(I[1]) : pc+=3: TFa(@BB(0), @CC(0), I[1] and 7) : goyes(3) 
o9b2: ticks-=53+F04(I[1]) : pc+=3: TFa(@CC(0), @AA(0), I[1] and 7) : goyes(3) 
o9b3: ticks-=53+F04(I[1]) : pc+=3: TFa(@DD(0), @CC(0), I[1] and 7) : goyes(3) 
o9b4: ticks-=53+F04(I[1]) : pc+=3: TFb(@AA(0), @BB(0), I[1] and 7) : goyes(3) 
o9b5: ticks-=53+F04(I[1]) : pc+=3: TFb(@BB(0), @CC(0), I[1] and 7) : goyes(3) 
o9b6: ticks-=53+F04(I[1]) : pc+=3: TFb(@CC(0), @AA(0), I[1] and 7) : goyes(3) 
o9b7: ticks-=53+F04(I[1]) : pc+=3: TFb(@DD(0), @CC(0), I[1] and 7) : goyes(3) 
o9b8: ticks-=53+F04(I[1]) : pc+=3: TFae(@AA(0), @BB(0), I[1] and 7) : goyes(3) 
o9b9: ticks-=53+F04(I[1]) : pc+=3: TFae(@BB(0), @CC(0), I[1] and 7) : goyes(3) 
o9bA: ticks-=53+F04(I[1]) : pc+=3: TFae(@CC(0), @AA(0), I[1] and 7) : goyes(3) 
o9bB: ticks-=53+F04(I[1]) : pc+=3: TFae(@DD(0), @CC(0), I[1] and 7) : goyes(3) 
o9bC: ticks-=53+F04(I[1]) : pc+=3: TFbe(@AA(0), @BB(0), I[1] and 7) : goyes(3) 
o9bD: ticks-=53+F04(I[1]) : pc+=3: TFbe(@BB(0), @CC(0), I[1] and 7) : goyes(3) 
o9bE: ticks-=53+F04(I[1]) : pc+=3: TFbe(@CC(0), @AA(0), I[1] and 7) : goyes(3) 
o9bF: ticks-=53+F04(I[1]) : pc+=3: TFbe(@DD(0), @CC(0), I[1] and 7) : goyes(3) 

oAa0: ticks-=33+F04(I[1]) : pc+=3: NFadd(@AA(0), @BB(0), I[1]) : goto o_done
oAa1: ticks-=33+F04(I[1]) : pc+=3: NFadd(@BB(0), @CC(0), I[1]) : goto o_done
oAa2: ticks-=33+F04(I[1]) : pc+=3: NFadd(@CC(0), @AA(0), I[1]) : goto o_done
oAa3: ticks-=33+F04(I[1]) : pc+=3: NFadd(@DD(0), @CC(0), I[1]) : goto o_done

oAa4: ticks-=33+F04(I[1]) : pc+=3: NFdbl(@AA(0), I[1]) : goto o_done
oAa5: ticks-=33+F04(I[1]) : pc+=3: NFdbl(@BB(0), I[1]) : goto o_done
oAa6: ticks-=33+F04(I[1]) : pc+=3: NFdbl(@CC(0), I[1]) : goto o_done
oAa7: ticks-=33+F04(I[1]) : pc+=3: NFdbl(@DD(0), I[1]) : goto o_done

oAa8: ticks-=33+F04(I[1]) : pc+=3: NFadd(@BB(0), @AA(0), I[1]) : goto o_done
oAa9: ticks-=33+F04(I[1]) : pc+=3: NFadd(@CC(0), @BB(0), I[1]) : goto o_done
oAaA: ticks-=33+F04(I[1]) : pc+=3: NFadd(@AA(0), @CC(0), I[1]) : goto o_done
oAaB: ticks-=33+F04(I[1]) : pc+=3: NFadd(@CC(0), @DD(0), I[1]) : goto o_done

oAaC: ticks-=33+F04(I[1]) : pc+=3: NFdec(@AA(0), I[1]) : goto o_done
oAaD: ticks-=33+F04(I[1]) : pc+=3: NFdec(@BB(0), I[1]) : goto o_done
oAaE: ticks-=33+F04(I[1]) : pc+=3: NFdec(@CC(0), I[1]) : goto o_done
oAaF: ticks-=33+F04(I[1]) : pc+=3: NFdec(@DD(0), I[1]) : goto o_done

oAb0: ticks-=33+F04(I[1]) : pc+=3: NFzero(@AA(0), I[1] and 7) : goto o_done
oAb1: ticks-=33+F04(I[1]) : pc+=3: NFzero(@BB(0), I[1] and 7) : goto o_done
oAb2: ticks-=33+F04(I[1]) : pc+=3: NFzero(@CC(0), I[1] and 7) : goto o_done
oAb3: ticks-=33+F04(I[1]) : pc+=3: NFzero(@DD(0), I[1] and 7) : goto o_done

oAb4: ticks-=33+F04(I[1]) : pc+=3: NFcopy(@AA(0), @BB(0), I[1] and 7) : goto o_done
oAb5: ticks-=33+F04(I[1]) : pc+=3: NFcopy(@BB(0), @CC(0), I[1] and 7) : goto o_done
oAb6: ticks-=33+F04(I[1]) : pc+=3: NFcopy(@CC(0), @AA(0), I[1] and 7) : goto o_done
oAb7: ticks-=33+F04(I[1]) : pc+=3: NFcopy(@DD(0), @CC(0), I[1] and 7) : goto o_done
oAb8: ticks-=33+F04(I[1]) : pc+=3: NFcopy(@BB(0), @AA(0), I[1] and 7) : goto o_done
oAb9: ticks-=33+F04(I[1]) : pc+=3: NFcopy(@CC(0), @BB(0), I[1] and 7) : goto o_done
oAbA: ticks-=33+F04(I[1]) : pc+=3: NFcopy(@AA(0), @CC(0), I[1] and 7) : goto o_done
oAbB: ticks-=33+F04(I[1]) : pc+=3: NFcopy(@CC(0), @DD(0), I[1] and 7) : goto o_done
oAbC: ticks-=33+F04(I[1]) : pc+=3: NFxchg(@AA(0), @BB(0), I[1] and 7) : goto o_done
oAbD: ticks-=33+F04(I[1]) : pc+=3: NFxchg(@BB(0), @CC(0), I[1] and 7) : goto o_done
oAbE: ticks-=33+F04(I[1]) : pc+=3: NFxchg(@CC(0), @AA(0), I[1] and 7) : goto o_done
oAbF: ticks-=33+F04(I[1]) : pc+=3: NFxchg(@DD(0), @CC(0), I[1] and 7) : goto o_done

oBa0: ticks-=33+F04(I[1]) : pc+=3: NFsub(@AA(0), @BB(0), I[1]) : goto o_done
oBa1: ticks-=33+F04(I[1]) : pc+=3: NFsub(@BB(0), @CC(0), I[1]) : goto o_done
oBa2: ticks-=33+F04(I[1]) : pc+=3: NFsub(@CC(0), @AA(0), I[1]) : goto o_done
oBa3: ticks-=33+F04(I[1]) : pc+=3: NFsub(@DD(0), @CC(0), I[1]) : goto o_done

oBa4: ticks-=33+F04(I[1]) : pc+=3: NFinc(@AA(0), I[1]) : goto o_done
oBa5: ticks-=33+F04(I[1]) : pc+=3: NFinc(@BB(0), I[1]) : goto o_done
oBa6: ticks-=33+F04(I[1]) : pc+=3: NFinc(@CC(0), I[1]) : goto o_done
oBa7: ticks-=33+F04(I[1]) : pc+=3: NFinc(@DD(0), I[1]) : goto o_done

oBa8: ticks-=33+F04(I[1]) : pc+=3: NFsub(@BB(0), @AA(0), I[1]) : goto o_done
oBa9: ticks-=33+F04(I[1]) : pc+=3: NFsub(@CC(0), @BB(0), I[1]) : goto o_done
oBaA: ticks-=33+F04(I[1]) : pc+=3: NFsub(@AA(0), @CC(0), I[1]) : goto o_done
oBaB: ticks-=33+F04(I[1]) : pc+=3: NFsub(@CC(0), @DD(0), I[1]) : goto o_done
oBaC: ticks-=33+F04(I[1]) : pc+=3: NFrsub(@AA(0), @BB(0), I[1]) : goto o_done
oBaD: ticks-=33+F04(I[1]) : pc+=3: NFrsub(@BB(0), @CC(0), I[1]) : goto o_done
oBaE: ticks-=33+F04(I[1]) : pc+=3: NFrsub(@CC(0), @AA(0), I[1]) : goto o_done
oBaF: ticks-=33+F04(I[1]) : pc+=3: NFrsub(@DD(0), @CC(0), I[1]) : goto o_done

oBb0: ticks-=33+F04(I[1]) : pc+=3: NFsl(@AA(0), I[1] and 7) : GoTo o_done
oBb1: ticks-=33+F04(I[1]) : pc+=3: NFsl(@BB(0), I[1] and 7) : goto o_done
oBb2: ticks-=33+F04(I[1]) : pc+=3: NFsl(@CC(0), I[1] and 7) : goto o_done
oBb3: ticks-=33+F04(I[1]) : pc+=3: NFsl(@DD(0), I[1] and 7) : goto o_done
oBb4: ticks-=33+F04(I[1]) : pc+=3: NFsr(@AA(0), I[1] and 7) : goto o_done
oBb5: ticks-=33+F04(I[1]) : pc+=3: NFsr(@BB(0), I[1] and 7) : goto o_done
oBb6: ticks-=33+F04(I[1]) : pc+=3: NFsr(@CC(0), I[1] and 7) : goto o_done
oBb7: ticks-=33+F04(I[1]) : pc+=3: NFsr(@DD(0), I[1] and 7) : goto o_done
oBb8: ticks-=33+F04(I[1]) : pc+=3: NFneg(@AA(0), I[1] and 7) : goto o_done
oBb9: ticks-=33+F04(I[1]) : pc+=3: NFneg(@BB(0), I[1] and 7) : goto o_done
oBbA: ticks-=33+F04(I[1]) : pc+=3: NFneg(@CC(0), I[1] and 7) : goto o_done
oBbB: ticks-=33+F04(I[1]) : pc+=3: NFneg(@DD(0), I[1] and 7) : goto o_done
oBbC: ticks-=33+F04(I[1]) : pc+=3: NFnot(@AA(0), I[1] and 7) : goto o_done
oBbD: ticks-=33+F04(I[1]) : pc+=3: NFnot(@BB(0), I[1] and 7) : goto o_done
oBbE: ticks-=33+F04(I[1]) : pc+=3: NFnot(@CC(0), I[1] and 7) : goto o_done
oBbF: ticks-=33+F04(I[1]) : pc+=3: NFnot(@DD(0), I[1] And 7) : goto o_done

oC0: ticks-=40: pc+=2: Nadd(@AA(0), @BB(0), 5) : goto o_done
oC1: ticks-=40: pc+=2: Nadd(@BB(0), @CC(0), 5) : goto o_done
oC2: ticks-=40: pc+=2: Nadd(@CC(0), @AA(0), 5) : goto o_done
oC3: ticks-=40: pc+=2: Nadd(@DD(0), @CC(0), 5) : goto o_done

oC4: ticks-=40: pc+=2: Ndbl(@AA(0), 5) : goto o_done
oC5: ticks-=40: pc+=2: Ndbl(@BB(0), 5) : goto o_done
oC6: ticks-=40: pc+=2: Ndbl(@CC(0), 5) : goto o_done
oC7: ticks-=40: pc+=2: Ndbl(@DD(0), 5) : goto o_done

oC8: ticks-=40: pc+=2: Nadd(@BB(0), @AA(0), 5) : goto o_done
oC9: ticks-=40: pc+=2: Nadd(@CC(0), @BB(0), 5) : goto o_done
oCA: ticks-=40: pc+=2: Nadd(@AA(0), @CC(0), 5) : goto o_done
oCB: ticks-=40: pc+=2: Nadd(@CC(0), @DD(0), 5) : goto o_done

oCC: ticks-=40: pc+=2: Ndec(@AA(0), 5) : goto o_done
oCD: ticks-=40: pc+=2: Ndec(@BB(0), 5) : goto o_done
oCE: ticks-=40: pc+=2: Ndec(@CC(0), 5) : goto o_done
oCF: ticks-=40: pc+=2: Ndec(@DD(0), 5) : goto o_done
oD0: ticks-=40: pc+=2: Nzero(@AA(0), 5) : goto o_done
oD1: ticks-=40: pc+=2: Nzero(@BB(0), 5) : goto o_done
oD2: ticks-=40: pc+=2: Nzero(@CC(0), 5) : goto o_done
oD3: ticks-=40: pc+=2: Nzero(@DD(0), 5) : goto o_done

oD4: ticks-=40: pc+=2: Ncopy(@AA(0), @BB(0), 5) : goto o_done
oD5: ticks-=40: pc+=2: Ncopy(@BB(0), @CC(0), 5) : goto o_done
oD6: ticks-=40: pc+=2: Ncopy(@CC(0), @AA(0), 5) : goto o_done
oD7: ticks-=40: pc+=2: Ncopy(@DD(0), @CC(0), 5) : goto o_done
oD8: ticks-=40: pc+=2: Ncopy(@BB(0), @AA(0), 5) : goto o_done
oD9: ticks-=40: pc+=2: Ncopy(@CC(0), @BB(0), 5) : goto o_done
oDA: ticks-=40: pc+=2: Ncopy(@AA(0), @CC(0), 5) : goto o_done
oDB: ticks-=40: pc+=2: Ncopy(@CC(0), @DD(0), 5) : goto o_done
oDC: ticks-=40: pc+=2: Nxchg(@AA(0), @BB(0), 5) : goto o_done
oDD: ticks-=40: pc+=2: Nxchg(@BB(0), @CC(0), 5) : goto o_done
oDE: ticks-=40: pc+=2: Nxchg(@CC(0), @AA(0), 5) : goto o_done
oDF: ticks-=40: pc+=2: Nxchg(@DD(0), @CC(0), 5) : goto o_done
oE0: ticks-=40: pc+=2: Nsub(@AA(0), @BB(0), 5) : goto o_done
oE1: ticks-=40: pc+=2: Nsub(@BB(0), @CC(0), 5) : goto o_done
oE2: ticks-=40: pc+=2: Nsub(@CC(0), @AA(0), 5) : goto o_done
oE3: ticks-=40: pc+=2: Nsub(@DD(0), @CC(0), 5) : goto o_done

oE4: ticks-=40: pc+=2: Ninc(@AA(0), 5) : goto o_done
oE5: ticks-=40: pc+=2: Ninc(@BB(0), 5) : goto o_done
oE6: ticks-=40: pc+=2: Ninc(@CC(0), 5) : goto o_done
oE7: ticks-=40: pc+=2: Ninc(@DD(0), 5) : goto o_done

oE8: ticks-=40: pc+=2: Nsub(@BB(0), @AA(0), 5) : goto o_done
oE9: ticks-=40: pc+=2: Nsub(@CC(0), @BB(0), 5) : goto o_done
oEA: ticks-=40: pc+=2: Nsub(@AA(0), @CC(0), 5) : goto o_done
oEB: ticks-=40: pc+=2: Nsub(@CC(0), @DD(0), 5) : goto o_done
oEC: ticks-=40: pc+=2: Nrsub(@AA(0), @BB(0), 5) : goto o_done
oED: ticks-=40: pc+=2: Nrsub(@BB(0), @CC(0), 5) : goto o_done
oEE: ticks-=40: pc+=2: Nrsub(@CC(0), @AA(0), 5) : goto o_done
oEF: ticks-=40: pc+=2: Nrsub(@DD(0), @CC(0), 5) : goto o_done

oF0: ticks-=44: pc+=2: Nsl(@AA(0), 5) : goto o_done
oF1: ticks-=44: pc+=2: Nsl(@BB(0), 5) : goto o_done
oF2: ticks-=44: pc+=2: Nsl(@CC(0), 5) : goto o_done
oF3: ticks-=44: pc+=2: Nsl(@DD(0), 5) : goto o_done
oF4: ticks-=44: pc+=2: Nsr(@AA(0), 5) : goto o_done
oF5: ticks-=44: pc+=2: Nsr(@BB(0), 5) : goto o_done
oF6: ticks-=44: pc+=2: Nsr(@CC(0), 5) : goto o_done
oF7: ticks-=44: pc+=2: Nsr(@DD(0), 5) : goto o_done
oF8: ticks-=40: pc+=2: Nneg(@AA(0), 5) : goto o_done
oF9: ticks-=40: pc+=2: Nneg(@BB(0), 5) : goto o_done
oFA: ticks-=40: pc+=2: Nneg(@CC(0), 5) : goto o_done
oFB: ticks-=40: pc+=2: Nneg(@DD(0), 5) : goto o_done
oFC: ticks-=40: pc+=2: Nnot(@AA(0), 5) : goto o_done
oFD: ticks-=40: pc+=2: Nnot(@BB(0), 5) : goto o_done
oFE: ticks-=40: pc+=2: Nnot(@CC(0), 5) : goto o_done
oFF: ticks-=40: pc+=2: Nnot(@DD(0), 5) : goto o_done
