2nd poroject of data converter (Design Switch Capacitor Circuit )

*************************************** Switch Capacitor Circuit Design ****************************

************************************** <<  Nima Dehghan 99123027 >>  *******************************

----------------------------------------------------------------------------------------------------

.lib './TSMC_90nm.l' tt
.temp 25

*----------------------------------------------------------------------------------------------------
*OTA (Operational Transmission Amplifier)

Gm	out-	out+	inop+	inop-	10m
Rout	out+	out-	1meg

*----------------------------------------------------------------------------------------------------
*Capacitors [(Cs1 & cs2 =1pF)  , (CL1 & CL2 = 1pF) , (Cp1 & Cp2 = 0.2pF)]

CL1	out+	0	1P
CL2	out-	0	1P
CS1	dsw1	inop-	1p
CS2	dsw2	inop+	1p
CP1	inop-	0	0.2p
CP2	inop+	0	0.2p
Cbst+	d3+	s2+	0.2p
Cbst-	d3-	s2-	0.2p

*-----------------------------------------------------------------------------------------------------
*Switche Models 

*MX     (Drain) (Gate)  (Sourse)  (Bulk)  (Channel Type)   (W)      (L)     (M)

Msw1	 dsw1	  B+	  in+	    0	        nch	  W=2.3u   L=0.1u   M=1
Msw2	 dsw2	  B-	  in-	    0	        nch	  W=2.3u   L=0.1u   M=1
M3	 inop-	 ph1a	  cmi	    0	        nch	  W=3.2u   L=0.1u   M=1
M4	 inop+	 ph1a	  cmi	    0	        nch	  W=3.2u   L=0.1u   M=1
M5	 out+	 ph2	  dsw1	    0	        nch	  W=3.1u   L=0.1u   M=1
M6	 dsw1	 ph2b	  out+	   dd	        pch	  W=3.1u   L=0.1u   M=4
M7	 out-	 ph2	  dsw2	    0    	nch	  W=3.1u   L=0.1u   M=1
M8	 dsw2	 ph2b	  out-	   dd	        pch	  W=3.1u   L=0.1u   M=4
M9	 out+	 ph1	  cmo	    0	        nch	  W=6.9u   L=0.1u   M=1
M1O	 out-	 ph1	  cmo	    0	        nch	  W=6.9u   L=0.1u   M=1

*------------------------------------------------------------------------------------------------------
*Clock Bootstrapping(+)

MN1+	dn1+	ph1d	   0	   0	        nch   	  W=0.2u   L=0.1u   M=1
MN2+	dn2+	ph1d	  d3+	   0	        nch	  W=0.2u   L=0.1u   M=1
MP1+	dn1+	ph1d	  dd	   dd	        pch	  W=0.4u   L=0.1u   M=1
MP2+	dn2+	ph1d	  dd	   dd	        pch	  W=0.4u   L=0.1u   M=1
M1+	in+	B+	  d3+	   0	        nch	  W=0.2u   L=0.1u   M=1
M2+	B+	dn2+	  s2+	  s2+	        pch	  W=0.8u   L=0.1u   M=1
M3+	d3+	dn1+	   0	   0	        nch	  W=0.2u   L=0.1u   M=1
M4+	dd	B+	  s2+	  s2+	        pch	  W=0.8u   L=0.1u   M=1
M5+	d5+	dn1+	   0	   0	        nch	  W=0.4u   L=0.1u   M=1
MT5+	B+	dd	  d5+	   0	        nch	  W=0.4u   L=0.1u   M=1

*------------------------------------------------------------------------------------------------------
*Clock Bootstrapping(-)

MN1-	dn1-	ph1d	  0	  0	        nch	  W=0.2u   L=0.1u   M=1
MN2-	dn2-	ph1d	  d3-	  0	        nch	  W=0.2u   L=0.1u   M=1
MP1-	dn1-	ph1d	  dd	  dd	        pch	  W=0.4u   L=0.1u   M=1
MP2-	dn2-	ph1d	  dd	  dd	        pch	  W=0.4u   L=0.1u   M=1
M1-	in-	B-	  d3-	  0	        nch	  W=0.2u   L=0.1u   M=1
M2-	B-	dn2-	  s2-	  s2-         	pch	  W=0.8u   L=0.1u   M=1
M3-	d3-	dn1-	  0	  0	        nch	  W=0.2u   L=0.1u   M=1
M4-	dd	B-	  s2-	  s2-	        pch	  W=0.8u   L=0.1u   M=1
M5-	d5-	dn1-	  0	  0	        nch	  W=0.4u   L=0.1u   M=1
MT5-	B-	dd	  d5-	  0	        nch	  W=0.4u   L=0.1u   M=1

*------------------------------------------------------------------------------------------------------
*Sources [(Vdd=1V)  , (Vcmi=0.2) , (Vcmo=0.5)]

Vdd	dd	0        dc=1           
Vcmi	cmi	0	dc=0.2	
Vcmo	cmo	0	dc=0.5
Vcm	cm	0	dc=0.5

*------------------------------------------------------------------------------------------------------
*Sinusoidal input source 
 
*Vx     node+   node-   sin[(Vdc) (Amplitude)  (Frequency)   (Td:"delay") (a)    (Phase)]
  
Vin+	in+	cm	sin( 0	     0.25     1.599121094meg	   0	   0	    0 )
Vin-	in-	cm	sin( 0	     0.25     1.599121094meg	   0	   0	   180)
 
*------------------------------------------------------------------------------------------------------
*VPhi  node+  node-     pulse[(V1)  (V2)  (Td:"delay") (Tr:"rise") (Tf:"fall") (Width) (Period)]

 VPH1	ph1	0	pulse( 0     1	      0.3n 	  0.1n        0.1n	4.6n	 10n)	

 VPH1a	ph1a	0	pulse( 0     1	      0.3n	  0.1n	      0.1n	4.4n	 10n) 

 VPH1d	ph1d	0	pulse( 0     1	      0.2n 	  0.1n	      0.1n	4.6n	 10n)
	
 VPH2	ph2	0	pulse( 1     0	      0 	  0.1n	      0.1n	5.2n	 10n)

 VPH2b	ph2b	0	pulse( 0     1	      0 	  0.1n	      0.1n	5.2n	 10n)
    
*------------------------------------------------------------------------------------------------------
*Simulation

.tran	10n	81920n
.probe tran V(out+,out-) V(in+,in-)
.print tran V(out+,out-) V(in+,in-)
.option accurate=1
.option ingold=2
.option nomod
.option post
.protect
.op

.end
