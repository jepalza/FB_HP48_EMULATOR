Select Case(I[0])
	
' 0000000000000000000000000000000
	Case &h0
	   Select Case(I[1])  
	   	case &h0
	       goto o00
	   	case &h1
	       goto o01
	   	case &h2
	       goto o02
	   	case &h3
	       goto o03
	   	case &h4
	       goto o04
	   	case &h5
	       goto o05
	   	case &h6
	       goto o06
	   	case &h7
	       goto o07
	   	case &h8
	       goto o08
	   	Case &h9
	       goto o09
	   	case &hA
	       goto o0A
	   	case &hB
	       goto o0B
	   	case &hC
	       goto o0C
	   	case &hD
	       goto o0D
	   	Case &hE
		    	Select Case(I[3])  
		         case &h0
		           goto o0Ef0
		         case &h1
		           goto o0Ef1
		         case &h2
		           goto o0Ef2
		         case &h3
		           goto o0Ef3
		         case &h4
		           goto o0Ef4
		         case &h5
		           goto o0Ef5
		         case &h6
		           goto o0Ef6
		         case &h7
		           goto o0Ef7
		         case &h8
		           goto o0Ef8
		         case &h9
		           goto o0Ef9
		         case &hA
		           goto o0EfA
		         case &hB
		           goto o0EfB
		         case &hC
		           goto o0EfC
		         case &hD
		           goto o0EfD
		         case &hE
		           goto o0EfE
		         case &hF
		           goto o0EfF 
		    	End Select
	 			GoTo o_invalid
	   	Case &hF
	       goto o0F 
	   End Select
	 	GoTo o_invalid
 	
' 11111111111111111111111111111111	
	Case &h1
	   Select Case(I[1])  
	   	Case &h0
		    	Select Case(I[2])  
		         case &h0
		           goto o100
		         case &h1
		           goto o101
		         case &h2
		           goto o102
		         case &h3
		           goto o103
		         case &h4
		           goto o104
		         case &h8
		           goto o108
		         case &h9
		           goto o109
		         case &hA
		           goto o10A
		         case &hB
		           goto o10B
		         case &hC
		           goto o10C 
		    	End Select
		 		GoTo o_invalid3
	 	
	   	case &h1
			    Select Case(I[2])  
			         case &h0
			           goto o110
			         case &h1
			           goto o111
			         case &h2
			           goto o112
			         case &h3
			           goto o113
			         case &h4
			           goto o114
			         case &h8
			           goto o118
			         case &h9
			           goto o119
			         case &hA
			           goto o11A
			         case &hB
			           goto o11B
			         case &hC
			           goto o11C 
			    End Select
			 	goto o_invalid3
		 	
	   	case &h2
		    	Select Case(I[2])  
		         case &h0
		           goto o120
		         case &h1
		           goto o121
		         case &h2
		           goto o122
		         case &h3
		           goto o123
		         case &h4
		           goto o124
		         case &h8
		           goto o128
		         case &h9
		           goto o129
		         case &hA
		           goto o12A
		         case &hB
		           goto o12B
		         case &hC
		           goto o12C 
		    	End Select
		 		GoTo o_invalid3
	 	
	   	case &h3
		    	Select Case(I[2])  
		         case &h0
		           goto o130
		         case &h1
		           goto o131
		         case &h2
		           goto o132
		         case &h3
		           goto o133
		         case &h4
		           goto o134
		         case &h5
		           goto o135
		         case &h6
		           goto o136
		         case &h7
		           goto o137
		         case &h8
		           goto o138
		         case &h9
		           goto o139
		         case &hA
		           goto o13A
		         case &hB
		           goto o13B
		         case &hC
		           goto o13C
		         case &hD
		           goto o13D
		         case &hE
		           goto o13E
		         case &hF
		           goto o13F 
		    	End Select
		 		GoTo o_invalid
		 		
	   	Case &h4
		    	Select Case(I[2])  
		         case &h0
		           goto o140
		         case &h1
		           goto o141
		         case &h2
		           goto o142
		         case &h3
		           goto o143
		         case &h4
		           goto o144
		         case &h5
		           goto o145
		         case &h6
		           goto o146
		         case &h7
		           goto o147
		         case &h8
		           goto o148
		         case &h9
		           goto o149
		         case &hA
		           goto o14A
		         case &hB
		           goto o14B
		         case &hC
		           goto o14C
		         case &hD
		           goto o14D
		         case &hE
		           goto o14E
		         case &hF
		           goto o14F 
		    	End Select
		 		GoTo o_invalid
	 		
	   	Case &h5
		    	Select Case(I[2])  
		         case &h0
		           goto o150a
		         case &h1
		           goto o151a
		         case &h2
		           goto o152a
		         case &h3
		           goto o153a
		         case &h4
		           goto o154a
		         case &h5
		           goto o155a
		         case &h6
		           goto o156a
		         case &h7
		           goto o157a
		         case &h8
		           goto o158x
		         case &h9
		           goto o159x
		         case &hA
		           goto o15Ax
		         case &hB
		           goto o15Bx
		         case &hC
		           goto o15Cx
		         case &hD
		           goto o15Dx
		         case &hE
		           goto o15Ex
		         case &hF
		           goto o15Fx 
		    	End Select
		 		goto o_invalid
	 		
	   	case &h6
	       goto o16x
	       
	   	case &h7
	       goto o17x
	       
	   	case &h8
	       goto o18x
	       
	   	case &h9
	       goto o19d2
	       
	   	case &hA
	       goto o1Ad4
	       
	   	case &hB
	       goto o1Bd5
	       
	   	case &hC
	       goto o1Cx
	       
	   	case &hD
	       goto o1Dd2
	       
	   	case &hE
	       goto o1Ed4
	       
	   	case &hF
	       goto o1Fd5 
	       
	   End Select
		goto o_invalid
	
' 2222222222222222222222222222222222222
	Case &h2
   	GoTo o2n

' 333333333333333333333333333333333333   
	Case &h3
   	GoTo o3X

' 444444444444444444444444444444444444  
	Case &h4
   	GoTo o4d2

' 555555555555555555555555555555555555   
	Case &h5
   	GoTo o5d2

' 666666666666666666666666666666666666  
	Case &h6
   	GoTo o6d3

' 77777777777777777777777777777777777   
	Case &h7
   	GoTo o7d3
   	
' 88888888888888888888888888888888888  	
	Case &h8
   	Select Case(I[1])  
   		Case &h0
	    		Select Case(I[2])  
		    		case &h0
		           goto o800
		    		case &h1
		           goto o801
		    		case &h2
		           goto o802
		    		case &h3
		           goto o803
		    		case &h4
		           goto o804
		    		case &h5
		           goto o805
		         case &h6
		           goto o806
		         case &h7
		           goto o807
		         case &h8
	     				Select Case(I[3])  
		             case &h0
		               goto o8080
		             case &h1
		               if (I[4]) then goto o_invalid5 else goto o80810
		             case &h2
		               goto o8082X
		             case &h3
		               goto o8083
		             case &h4
		               goto o8084n
		             case &h5
		               goto o8085n
		             case &h6
		               goto o8086n
		             case &h7
		               goto o8087n
		             case &h8
		               goto o8088n
		             case &h9
		               goto o8089n
		             case &hA
		               goto o808An
		             case &hB
		               goto o808Bn
		             case &hC
		               goto o808C
		             case &hD
		               goto o808D
		             case &hE
		               goto o808E
		             case &hF
		               goto o808F 
	     				End Select
	 					goto o_invalid
	 					
	    			Case &h9
	          	 	GoTo o809
	    			case &hA
	           		GoTo o80A
	    			case &hB
	           		GoTo o80B
	    			case &hC
	           		GoTo o80Cn
	    			case &hD
	           		GoTo o80Dn
	    			case &hE
	           		GoTo o80E
	    			case &hF
	           		GoTo o80Fn 
	    		End Select
	 			GoTo o_invalid
 			
   		Case &h1
		    	Select Case(I[2])  
		    		Case &h0
		           goto o810
		         case &h1
		           goto o811
		         case &h2
		           goto o812
		         case &h3
		           goto o813
		         case &h4
		           goto o814
		         case &h5
		           goto o815
		         case &h6
		           goto o816
		         case &h7
		           goto o817
		         case &h8
		     			Select Case(I[4])  
		     				Case &h0
		               	GoTo o818f0x
		     				Case &h1
		               	GoTo o818f1x
		     				Case &h2
		               	goto o818f2x
		     				Case &h3
		               	goto o818f3x
		     				Case &h8
		               	GoTo o818f8x
		     				Case &h9
		               	GoTo o818f9x
		     				Case &hA
		               	GoTo o818fAx
		     				Case &hB
		               	GoTo o818fBx 
						End Select
		 				GoTo o_invalid6
		 				
		         case &h9
		     			Select Case(I[4])  
		     				Case &h0
		               	GoTo o819f0
		     				case &h1
		           	    	GoTo o819f1
		     				Case &h2
		               	GoTo o819f2
		     				Case &h3
		               	GoTo o819f3 
		     			End Select
		 				GoTo o_invalid5
		 				
		         case &hA
		     			Select Case(I[4])  
		             case &h0
		      			Select Case(I[5])  
		                 case &h0
		                   goto o81Af00
		                 case &h1
		                   goto o81Af01
		                 case &h2
		                   goto o81Af02
		                 case &h3
		                   goto o81Af03
		                 case &h4
		                   goto o81Af04
		                 case &h8
		                   goto o81Af08
		                 case &h9
		                   goto o81Af09
		                 case &hA
		                   goto o81Af0A
		                 case &hB
		                   goto o81Af0B
		                 case &hC
		                   goto o81Af0C 
		      			End Select
		 					GoTo o_invalid6
		 					
		             case &h1
		      			Select Case(I[5])  
		                 case &h0
		                   goto o81Af10
		                 case &h1
		                   goto o81Af11
		                 case &h2
		                   goto o81Af12
		                 case &h3
		                   goto o81Af13
		                 case &h4
		                   goto o81Af14
		                 case &h8
		                   goto o81Af18
		                 case &h9
		                   goto o81Af19
		                 case &hA
		                   goto o81Af1A
		                 case &hB
		                   goto o81Af1B
		                 case &hC
		                   goto o81Af1C 
		      			End Select
		 					GoTo o_invalid6
		 					
		             case &h2
		      			Select Case(I[5])  
		                 case &h0
		                   goto o81Af20
		                 case &h1
		                   goto o81Af21
		                 case &h2
		                   goto o81Af22
		                 case &h3
		                   goto o81Af23
		                 case &h4
		                   goto o81Af24
		                 case &h8
		                   goto o81Af28
		                 case &h9
		                   goto o81Af29
		                 case &hA
		                   goto o81Af2A
		                 case &hB
		                   goto o81Af2B
		                 case &hC
		                   goto o81Af2C 
		      			End Select
		 					GoTo o_invalid6 
		 					
		     			End Select
		 				GoTo o_invalid5
		 				
		    		Case &hB
		     				Select Case(I[3])  
		                case &h2
		                  goto o81B2
		                case &h3
		                  goto o81B3
		                case &h4
		                  goto o81B4
		                case &h5
		                  goto o81B5
		                case &h6
		                  goto o81B6
		                case &h7
		                  goto o81B7 
		     				End Select
		 					goto o_invalid4
		 					
		    		case &hC
		              goto o81C
		    		case &hD
		              goto o81D
		    		case &hE
		              goto o81E
		    		case &hF
		              goto o81F 
		    	End Select
		 		GoTo o_invalid
 		
   		Case &h2
          goto o82n
          
   		case &h3
          goto o83n
          
   		case &h4
          goto o84n
          
   		case &h5
          goto o85n
          
   		Case &h6
          goto o86n
          
   		Case &h7
          goto o87n
          
   		Case &h8
          goto o88n
          
   		Case &h9
          goto o89n
          
   		Case &hA
	    		Select Case(I[2])  
	            case &h0
	              goto o8A0
	            case &h1
	              goto o8A1
	            case &h2
	              goto o8A2
	            case &h3
	              goto o8A3
	            case &h4
	              goto o8A4
	            case &h5
	              goto o8A5
	            case &h6
	              goto o8A6
	            case &h7
	              goto o8A7
	            case &h8
	              goto o8A8
	            case &h9
	              goto o8A9
	            case &hA
	              goto o8AA
	            case &hB
	              goto o8AB
	            case &hC
	              goto o8AC
	            case &hD
	              goto o8AD
	            case &hE
	              goto o8AE
	            case &hF
	              goto o8AF
	    		End Select
 				GoTo o_invalid
 				
   		Case &hB
	    		Select Case(I[2])  
	            case &h0
	              goto o8B0
	            case &h1
	              goto o8B1
	            case &h2
	              goto o8B2
	            case &h3
	              goto o8B3
	            case &h4
	              goto o8B4
	            case &h5
	              goto o8B5
	            case &h6
	              goto o8B6
	            case &h7
	              goto o8B7
	            case &h8
	              goto o8B8
	            case &h9
	              goto o8B9
	            case &hA
	              goto o8BA
	            case &hB
	              goto o8BB
	            case &hC
	              goto o8BC
	            case &hD
	              goto o8BD
	            case &hE
	              goto o8BE
	            case &hF
	              goto o8BF 
	    		End Select
	 			GoTo o_invalid
 			
   		case &hC
          goto o8Cd4
          
   		case &hD
          goto o8Dd5
          
   		case &hE
          goto o8Ed4
          
   		case &hF
          goto o8Fd5 
          
   	End Select
 		goto o_invalid

' 999999999999999999999999999999999999999999
	Case &h9
	   if (I[1]<8) Then 
		   Select Case(I[2]) 
		   	case &h0
		          goto o9a0
		   	case &h1
		          goto o9a1
		   	case &h2
		          goto o9a2
		   	case &h3
		          goto o9a3
		   	case &h4
		          goto o9a4
		   	case &h5
		          goto o9a5
		   	case &h6
		          goto o9a6
		   	case &h7
		          goto o9a7
		   	case &h8
		          goto o9a8
		   	case &h9
		          goto o9a9
		   	case &hA
		          goto o9aA
		   	case &hB
		          goto o9aB
		   	case &hC
		          goto o9aC
		   	case &hD
		          goto o9aD
		   	case &hE
		          goto o9aE
		   	case &hF
		          goto o9aF 
		   End Select
		   goto o_invalid     
	   Else 
		   Select Case(I[2]) 
		   	case &h0
		       goto o9b0
		   	case &h1
		       goto o9b1
		   	case &h2
		       goto o9b2
		   	case &h3
		       goto o9b3
		   	case &h4
		       goto o9b4
		   	case &h5
		       goto o9b5
		   	case &h6
		       goto o9b6
		   	case &h7
		       goto o9b7
		   	case &h8
		       goto o9b8
		   	case &h9
		       goto o9b9
		   	case &hA
		       goto o9bA
		   	case &hB
		       goto o9bB
		   	case &hC
		       goto o9bC
		   	case &hD
		       goto o9bD
		   	case &hE
		       goto o9bE
		   	case &hF
		       goto o9bF 
		   End Select 
		   GoTo o_invalid   
	   End If
   
' AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  
	Case &hA
	   if (I[1]<8) Then 
		   Select Case(I[2]) 
		   	case &h0
		       goto oAa0
		   	case &h1
		       goto oAa1
		   	case &h2
		       goto oAa2
		   	case &h3
		       goto oAa3
		   	case &h4
		       goto oAa4
		   	case &h5
		       goto oAa5
		   	case &h6
		       goto oAa6
		   	case &h7
		       goto oAa7
		   	case &h8
		       goto oAa8
		   	case &h9
		       goto oAa9
		   	case &hA
		       goto oAaA
		   	case &hB
		       goto oAaB
		   	case &hC
		       goto oAaC
		   	case &hD
		       goto oAaD
		   	case &hE
		       goto oAaE
		   	case &hF
		       goto oAaF 
		   End Select
		   goto o_invalid
	   Else 
		  Select Case (I[2]) 
		  	case &h0
		    goto oAb0
		  	case &h1
		    goto oAb1
		  	case &h2
		    goto oAb2
		  	case &h3
		    goto oAb3
		  	case &h4
		    goto oAb4
		  	case &h5
		    goto oAb5
		  	case &h6
		    goto oAb6
		  	case &h7
		    goto oAb7
		  	case &h8
		    goto oAb8
		  	case &h9
		    goto oAb9
		  	case &hA
		    goto oAbA
		  	case &hB
		    goto oAbB
		  	case &hC
		    goto oAbC
		  	case &hD
		    goto oAbD
		  	case &hE
		    goto oAbE
		  	case &hF
		    goto oAbF 
		  End Select
		  goto o_invalid
	   End If
   
   
' BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  
	Case &hB
	   if (I[1]<8) Then 
		   Select Case(I[2])
		   	case &h0
		       goto oBa0
		   	case &h1
		       goto oBa1
		   	case &h2
		       goto oBa2
		   	case &h3
		       goto oBa3
		   	case &h4
		       goto oBa4
		   	case &h5
		       goto oBa5
		   	case &h6
		       goto oBa6
		   	case &h7
		       goto oBa7
		   	case &h8
		       goto oBa8
		   	case &h9
		       goto oBa9
		   	case &hA
		       goto oBaA
		   	case &hB
		       goto oBaB
		   	case &hC
		       goto oBaC
		   	case &hD
		       goto oBaD
		   	case &hE
		       goto oBaE
		   	case &hF
		       goto oBaF 
		   End Select
		   GoTo o_invalid
	   Else 
		  Select Case(I[2])
		  	case &h0
		    goto oBb0
		  	case &h1
		    goto oBb1
		  	case &h2
		    goto oBb2
		  	case &h3
		    goto oBb3
		  	case &h4
		    goto oBb4
		  	case &h5
		    goto oBb5
		  	case &h6
		    goto oBb6
		  	case &h7
		    goto oBb7
		  	case &h8
		    goto oBb8
		  	case &h9
		    goto oBb9
		  	case &hA
		    goto oBbA
		  	case &hB
		    goto oBbB
		  	case &hC
		    goto oBbC
		  	case &hD
		    goto oBbD
		  	case &hE
		    goto oBbE
		  	case &hF
		    goto oBbF 
		    End Select 
		    GoTo o_invalid
	   End If
   
' CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
	Case &hC
	   Select Case(I[1])  
	     case &h0
	       goto oC0
	     case &h1
	       goto oC1
	     case &h2
	       goto oC2
	     case &h3
	       goto oC3
	     case &h4
	       goto oC4
	     case &h5
	       goto oC5
	     case &h6
	       goto oC6
	     case &h7
	       goto oC7
	     case &h8
	       goto oC8
	     case &h9
	       goto oC9
	     case &hA
	       goto oCA
	     case &hB
	       goto oCB
	     case &hC
	       goto oCC
	     case &hD
	       goto oCD
	     case &hE
	       goto oCE
	     case &hF
	       goto oCF 
	   End Select
	 	GoTo o_invalid
 	
' DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
	Case &hD
	   Select Case(I[1])  
	     case &h0
	       goto oD0
	     case &h1
	       goto oD1
	     case &h2
	       goto oD2
	     case &h3
	       goto oD3
	     case &h4
	       goto oD4
	     case &h5
	       goto oD5
	     case &h6
	       goto oD6
	     case &h7
	       goto oD7
	     case &h8
	       goto oD8
	     case &h9
	       goto oD9
	     case &hA
	       goto oDA
	     case &hB
	       goto oDB
	     case &hC
	       goto oDC
	     case &hD
	       goto oDD
	     case &hE
	       goto oDE
	     case &hF
	       goto oDF 
	   End Select
	 	GoTo o_invalid
 	
' EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
	Case &hE
	   Select Case(I[1])  
	     case &h0
	       goto oE0
	     case &h1
	       goto oE1
	     case &h2
	       goto oE2
	     case &h3
	       goto oE3
	     case &h4
	       goto oE4
	     case &h5
	       goto oE5
	     case &h6
	       goto oE6
	     case &h7
	       goto oE7
	     case &h8
	       goto oE8
	     case &h9
	       goto oE9
	     case &hA
	       goto oEA
	     case &hB
	       goto oEB
	     case &hC
	       goto oEC
	     case &hD
	       goto oED
	     case &hE
	       goto oEE
	     case &hF
	       goto oEF 
	   End Select
	 	GoTo o_invalid
 	
' FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	Case &hF
	   Select Case(I[1])  
	     case &h0
	       goto oF0
	     case &h1
	       goto oF1
	     case &h2
	       goto oF2
	     case &h3
	       goto oF3
	     case &h4
	       goto oF4
	     case &h5
	       goto oF5
	     case &h6
	       goto oF6
	     case &h7
	       goto oF7
	     case &h8
	       goto oF8
	     case &h9
	       goto oF9
	     case &hA
	       goto oFA
	     case &hB
	       goto oFB
	     case &hC
	       goto oFC
	     case &hD
	       goto oFD
	     case &hE
	       goto oFE
	     case &hF
	       goto oFF 
	   End Select 
	   GoTo o_invalid 
   
End select 
GoTo o_invalid