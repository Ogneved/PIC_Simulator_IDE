; Compiled with: PIC Simulator IDE - Registered Copy v6.97
; Microcontroller model: PIC16F877A
; Clock frequency: 4.0 MHz
;
	R0L EQU 0x020
	R0H EQU 0x021
	R1L EQU 0x022
	R1H EQU 0x023
	R2L EQU 0x024
	R2H EQU 0x025
	R3L EQU 0x026
	R3H EQU 0x027
	R4L EQU 0x028
	R4H EQU 0x029
	R5L EQU 0x02A
	R5H EQU 0x02B
	R0HL EQU 0x020
	R1HL EQU 0x022
	R2HL EQU 0x024
	R3HL EQU 0x026
	R4HL EQU 0x028
	R5HL EQU 0x02A
	R1HL0HL EQU 0x020
	R3HL2HL EQU 0x024
	R5HL4HL EQU 0x028
	LONG_0 EQU 0x02C
	LONG_1 EQU 0x02D
	LONG_2 EQU 0x02E
	LONG_3 EQU 0x02F
	LONG2_0 EQU 0x030
	LONG2_1 EQU 0x031
	LONG2_2 EQU 0x032
	LONG2_3 EQU 0x033
	LONG1 EQU 0x02C
	LONG2 EQU 0x030
	AARGB7 EQU 0x034
	AARGB6 EQU 0x035
	AARGB5 EQU 0x036
	AARGB4 EQU 0x037
	AARGB3 EQU 0x038
	AARGB2 EQU 0x039
	AARGB1 EQU 0x03A
	AARGB0 EQU 0x03B
	AEXP EQU 0x03C
	BARGB3 EQU 0x03D
	BARGB2 EQU 0x03E
	BARGB1 EQU 0x03F
	BARGB0 EQU 0x040
	BEXP EQU 0x041
	TEMPB3 EQU 0x042
	TEMPB2 EQU 0x043
	TEMPB1 EQU 0x044
	TEMPB0 EQU 0x045
	SIGN EQU 0x046
	FPFLAGS EQU 0x047
	LOOPCOUNT EQU 0x048
	CEXP EQU 0x049
	CARGB0 EQU 0x04A
	CARGB1 EQU 0x04B
	CARGB2 EQU 0x04C
	CARGB3 EQU 0x04D
	DEXP EQU 0x04E
	DARGB0 EQU 0x04F
	DARGB1 EQU 0x050
	DARGB2 EQU 0x051
	DARGB3 EQU 0x052
	EEXP EQU 0x053
	EARGB0 EQU 0x054
	EARGB1 EQU 0x055
	EARGB2 EQU 0x056
	EARGB3 EQU 0x057
	ZARGB2 EQU 0x058
	ZARGB3 EQU 0x059
	SO_PORT EQU 0x06B
	SO_BIT EQU 0x06C
	SO_INTL EQU 0x06D
;       The value of 'adc_value_max' (global) is 1024
;       The value of 'operating_voltage' (global) is 5
;       The value of 'rl_board' (global) is 10
;       The value of 'r_zero' (global) is 2233025167
;       The value of 'a' (global) is 2124331090
;       The value of 'b' (global) is 2138423951
;       The address of 'concentration_co2' (single) (global) is 0x06E
;       The address of 'sensor_resistance' (single) (global) is 0x072
;       The address of 'sensor_voltage' (single) (global) is 0x076
;       The address of 'qwe' (single) (global) is 0x07A
;       The address of 'pin_mq135' (long) (global) is 0x0A0
;       The address of 'warning_led' (bit) (global) is 0x005,1
	ORG 0x0000
	BSF PCLATH,3
	BCF PCLATH,4
	GOTO L0003
	ORG 0x0004
	RETFIE
; Waitms Routine
W001:	MOVF R0L,F
	BTFSC STATUS,Z
	GOTO W002
	CALL W003
	DECF R0L,F
	NOP
	NOP
	NOP
	NOP
	NOP
	GOTO W001
W002:	MOVF R0H,F
	BTFSC STATUS,Z
	RETURN
	CALL W003
	DECF R0H,F
	DECF R0L,F
	GOTO W001
W003:	MOVLW 0x0C
	MOVWF R2H
W004:
	DECFSZ R2H,F
	GOTO W004
	NOP
	NOP
	MOVLW 0x12
	MOVWF R1L
W005:
	DECFSZ R1L,F
	GOTO W006
	CALL W007
	CALL W007
	NOP
	NOP
	RETURN
W006:
	CALL W007
	GOTO W005
W007:	MOVLW 0x0D
	MOVWF R2L
W008:
	DECFSZ R2L,F
	GOTO W008
	NOP
	RETURN
; Delay Routine Byte
; minimal routine execution time: 8µs
; routine execution time step: 3µs
; maximal routine execution time: 770µs
DL01:
	DECFSZ R4L,F
	GOTO DL01
	RETURN
; Delay Routine Word
; minimal routine execution time: 15µs
; routine execution time step: 10µs
; maximal routine execution time: 655365µs
DL02:
	MOVLW 0x01
	SUBWF R4L,F
	CLRW
	BTFSS STATUS,C
	ADDLW 0x01
	SUBWF R4H,F
	BTFSS STATUS,C
	RETURN
	GOTO DL02
; Long Addition Routine
LA01:	MOVF R2L,W
	ADDWF R0L,F
	BTFSC STATUS,C
	CALL LA02
	MOVF R2H,W
	ADDWF R0H,F
	BTFSC STATUS,C
	CALL LA03
	MOVF R3L,W
	ADDWF R1L,F
	BTFSC STATUS,C
	CALL LA04
	MOVF R3H,W
	ADDWF R1H,F
	RETURN
LA02:	INCF R0H,F
	BTFSS STATUS,Z
	RETURN
LA03:	INCF R1L,F
	BTFSS STATUS,Z
	RETURN
LA04:	INCF R1H,F
	RETURN
; Long Subtraction Routine
LS01:
	CALL LS02
	CALL LA01
	RETURN
LS02:	COMF R2L,F
	COMF R2H,F
	COMF R3L,F
	COMF R3H,F
	INCF R2L,F
	BTFSS STATUS,Z
	RETURN
	INCF R2H,F
	BTFSS STATUS,Z
	RETURN
	INCF R3L,F
	BTFSS STATUS,Z
	RETURN
	INCF R3H,F
	RETURN
; Long Multiplication Routine
LM01:	CLRF R0L
	CLRF R0H
	CLRF R1L
	CLRF R1H
	BCF STATUS,IRP
	MOVLW LONG_0
	MOVWF FSR
	MOVLW 0x04
	MOVWF R5L
	GOTO LM03
LM02:
	CALL LM04
LM03:
	BTFSC INDF,0
	CALL LA01
	CALL LM04
	BTFSC INDF,1
	CALL LA01
	CALL LM04
	BTFSC INDF,2
	CALL LA01
	CALL LM04
	BTFSC INDF,3
	CALL LA01
	CALL LM04
	BTFSC INDF,4
	CALL LA01
	CALL LM04
	BTFSC INDF,5
	CALL LA01
	CALL LM04
	BTFSC INDF,6
	CALL LA01
	CALL LM04
	BTFSC INDF,7
	CALL LA01
	INCF FSR,F
	DECF R5L,F
	BTFSS STATUS,Z
	GOTO LM02
	RETURN
LM04:	BCF STATUS,C
	RLF R2L,F
	RLF R2H,F
	RLF R3L,F
	RLF R3H,F
	RETURN
; Long Division Routine
LD01:	CLRF LONG_0
	CLRF LONG_1
	CLRF LONG_2
	CLRF LONG_3
	BCF STATUS,IRP
LD02:
	BTFSS R3H,7
	GOTO LD03
	RETURN
LD03:
	CALL LS02
	BTFSC R3H,7
	GOTO LD04
	RETURN
LD04:	CLRF R5H
LD05:
	BTFSS R3H,6
	GOTO LD06
	INCF R5H,F
	CALL LM04
	GOTO LD05
LD06:	MOVF R1H,W
	MOVWF LONG2_3
	MOVF R1L,W
	MOVWF LONG2_2
	MOVF R0H,W
	MOVWF LONG2_1
	MOVF R0L,W
	MOVWF LONG2_0
	CALL LA01
	BTFSS R1H,7
	GOTO LD07
	MOVF LONG2_3,W
	MOVWF R1H
	MOVF LONG2_2,W
	MOVWF R1L
	MOVF LONG2_1,W
	MOVWF R0H
	MOVF LONG2_0,W
	MOVWF R0L
	GOTO LD99
LD07:	MOVF R5H,W
	SUBLW 0x07
	BTFSS STATUS,C
	GOTO LD08
	MOVLW LONG_0
	GOTO LD20
LD08:	MOVF R5H,W
	SUBLW 0x0F
	BTFSS STATUS,C
	GOTO LD09
	MOVLW LONG_1
	GOTO LD20
LD09:	MOVF R5H,W
	SUBLW 0x17
	BTFSS STATUS,C
	GOTO LD10
	MOVLW LONG_2
	GOTO LD20
LD10:	MOVLW LONG_3
LD20:	MOVWF FSR
	MOVF R5H,W
	ANDLW 0x07
	MOVWF R5L
	MOVLW 0x01
	MOVWF R4H
	BTFSC STATUS,Z
	GOTO LD30
LD21:	BCF STATUS,C
	RLF R4H,F
	DECFSZ R5L,F
	GOTO LD21
LD30:	MOVF R4H,W
	IORWF INDF,F
LD99:	BSF STATUS,C
	RRF R3H,F
	RRF R3L,F
	RRF R2H,F
	RRF R2L,F
	DECF R5H,F
	BTFSS R5H,7
	GOTO LD06
	RETURN
; Adcin Routine
A001:	RLF R0L,F
	RLF R0L,F
	RLF R0L,F
	MOVLW 0x38
	ANDWF R0L,F
	MOVLW 0xC1
	IORWF R0L,W
	MOVWF ADCON0
	MOVLW 0x05
	MOVWF R4L
	CALL DL01
	BSF ADCON0,GO
A002:
	BTFSC ADCON0,GO
	GOTO A002
	BCF PIR1,ADIF
	BCF ADCON0,ADON
	RETURN
; Lcdout Routine
LC01:
	BSF PORTD,1
	BCF PORTD,2
	MOVWF PORTB
	CALL LCX1
	MOVLW 0x1F
	MOVWF R4L
	CALL DL01
	RETURN
LCX1:
	BSF PORTD,3
	NOP
	BCF PORTD,3
	NOP
	RETURN
; Lcdcmdout Routine
LC02:
	BCF PORTD,1
	BCF PORTD,2
	MOVWF PORTB
	CALL LCX1
	MOVLW 0xF2
	MOVWF R4L
	MOVLW 0x01
	MOVWF R4H
	CALL DL02
	RETURN
; Lcdout Decimal Conversion Routine
LC21:
	BCF STATUS,IRP
	MOVLW 0x5A
	MOVWF FSR
LC22:
	MOVF INDF,W
	BTFSC STATUS,Z
	RETURN
	INCF FSR,F
	CALL LC01
	GOTO LC22
; Hardware Serial Communication Routines
HS01:
	BTFSC PIR1,TXIF
	GOTO HS02
	GOTO HS01
HS02:	MOVWF TXREG
	RETURN
HS10:
	BTFSC PIR1,RCIF
	GOTO HS11
	GOTO HS10
HS11:	MOVF RCREG,W
	RETURN
; Hserout Decimal Conversion Routine
HS21:
	BCF STATUS,IRP
	MOVLW 0x5A
	MOVWF FSR
HS22:
	MOVF INDF,W
	BTFSC STATUS,Z
	RETURN
	INCF FSR,F
	CALL HS01
	GOTO HS22
; Serout Routine
SO01:	MOVWF R5L
	BCF STATUS,IRP
	MOVLW 0x62
	MOVWF R4L
	MOVLW 0x00
	MOVWF R4H
	CALL DL02
	MOVF SO_PORT,W
	MOVWF FSR
	MOVLW 0x09
	MOVWF R5H
	BCF STATUS,C
SO02:
	CALL SO03
	RRF R5L,F
	DECFSZ R5H,F
	GOTO SO02
	BSF STATUS,C
	CALL SO03
	RETURN
SO03:	MOVF INDF,W
	IORWF SO_BIT,W
	BTFSS STATUS,C
	XORWF SO_BIT,W
	MOVWF INDF
	BSF FSR,7
	COMF INDF,W
	BCF FSR,7
	ANDWF INDF,F
	MOVF SO_INTL,W
	MOVWF R4L
	CALL DL01
	RETURN
; Serout Decimal Conversion Routine
SO21:
	MOVLW 0x5A
	MOVWF R3H
SO22:
	BCF STATUS,IRP
	MOVF R3H,W
	MOVWF FSR
	MOVF INDF,W
	BTFSC STATUS,Z
	RETURN
	INCF R3H,F
	CALL SO01
	GOTO SO22
;crypt_start
;protected:J0^u{gws,hulnuvápä%X|ä~x|i,Nqên/A
;protected:QX\2?A>RÀTZbOu!N81>GA
;protected:◊[SbbH>JTh[
;protected:‘PL]T,kLNY
;protected:‘EaG<UIYV^W:7
;protected:‘MEd)_SWMaH7B
;protected:‘ZWM^_#_BnLH=AA
;protected:◊US`Z"l[\C=??
;protected:»N]Y^#HL^J`3HK
;protected:ŒPdWU.EM]I`:;V
;protected:”O\MQ.MYUNM</d
;protected:…eSIS5KP`KN=.d
;protected:—QdQ_P ^bMlXZ7f
;protected:ÀgO_K&NV\VP58Q
;protected: `]UcN,`TLbak/a
;protected:”UQaG<FG_\L?:J
;protected:‘MUd)bYRZ97
;protected:Y`YK5:=FÀaMnK&aZW_P4
;protected:‘XQtO/QL^TB;:c
;protected:‡EJQ,SaM]YN9H
;protected:“QQJ,[EjJcX7@
;protected:’B_T_k#Z_MWsTH_
;protected:ŒTd^^.R[]OQ;BB
;protected:”Y\VQ.MYUNM=/u
;protected:…iT\d[*POVSM2
;protected:ÊV^fQ,NA]UNJ/^
;protected:”YRtXb%GNgQQ?
;protected:ÃOWTd)PQ]SO2
;protected:”P_^#[PYS`1H8
;protected:ŒZd`U.EM]I`9;g
;protected:”NPF+^OdD[S86
;protected:ÊC_K&]XVPbL8?
;protected: `]Uc^,`TLbak/a
;protected:”SRrP<SU_b=AA6
;protected:‘XQtO/QL^TB<:c
;protected:‡PVacI>B]WMOE
;protected:“RZVR+C_[VR<
;protected:‘OCQ.`]PWM</Q
;protected:…^XL-iO\^F<76
;protected:ÊV^fQ,NA]UNH/^
;protected:”NFd!lHRNiR;A
;protected:ÃNNH>YR\L`U,?
;protected:÷NlIZN,VrBpZY9o
;protected:“V]X[+Tc\?C=
;protected:Z\RXA>K5A”YRtG<YKZeL?:[
;protected:‘^W``U0LQeP7T
;protected:‘ZFM+\FjBpM2@
;protected:›LRT$\NN_]W<?
;protected:‘OTQa_8V[L`Xq-v
;protected:ÕHa[]b.W`LVs\;S
;protected:”S\TZ._]WM`Z6P
;protected:…^HL-h^PbY_7E
;protected:lXa]>>@2LH
;protected:‘ZFM+\FjBpM2@
;protected:›LRT$\NN_]W<?
;protected:‘OTQaO8DH]SEN-S
;protected:ÕM\iY/TMd^KeWBB
;protected:”^YF+OMjJI=8I
;protected:ÊShK&NV\VP58Q
;protected: pUU0LM_GM>8^
;protected:ÀINR#nDhFZUA=
;protected:◊PGR+RaUPdS8A
;protected:»OSO^Va+MHvQHK
;protected:ŒTd^^.R[]OQ;BBL
;protected:‘OCQ.\[OH_T/Q
;protected:…^HL-eM[OXT76
;protected:ÊP^dZ,`E_Taf69
;protected:QXRQ3O7@’bYeZ[,>3I:AG
;protected:”Y\VbT,YH_[
;protected:‘FjSb%YV\X
;protected:◊PGR+RaUPdS8@
;protected:»MQR8SJWMWf-P
;protected:ÕHa[]b.EM]I`9;G
;protected:”S\TZ.ZjP;;?5
;protected:ÊDkRL-VKaUF?7H
;protected:ÊL^]Q,NA]UNJ/M
;protected:”ORkG<FG_\L@:J
;protected:‘NQkO/QL^TB;:R
;protected:‡LUNR#_BnLH@AP
;protected:◊PXR^E>\cQ_a`,e
;protected:÷UfFM+MDpH^72S
;protected:›LcTWO+UrJce^8g
;protected:»T\O^#HL^J`2HK
;protected:ŒOiPbQ$__Cr^b<e
;protected:‘VNNT,YDYRN3JG
;protected:‰GYS5]XUR8B
;protected:PpVC@>>G»NZ^^#[PYS`1
;protected:‰RUc[*POVSM2J`
;protected:◊RNR-PNZMlK3>
;protected:‘EaG<UIYV^W:8
;protected:‘MVd\b0^`NT`a8r
;protected:ÀNZ`R>OkWSAE=A
;protected:÷Q[aH>JPbRN>,b
;protected:÷YgY^Q,D_ScG6
;protected:’bYeT$MLTeKA<b
;protected:‘ZOaeR8DH]SEO
;protected:…iT\S5KP`KN>.u
;protected:—\_acS LO^_E9
;protected:”OOpG<FG_\LB
;protected:÷F_Q"rN\`M<93
;protected:”[[nI'LMUeCL1]
;protected:’WMU.TOWCrQ;C
;protected:”NPF+^OdD[S87
;protected:ÊCpKY`5]cOXa^.x
;protected:—V__[-NZ`YL3:=
;protected:‘PmWb%GNgQQ?0c
;protected:”Om_fV+MNRRP<
;protected:‡PVaR#_BnLH?Aa
;protected:◊[SbbH>JPbRN>
;protected:»NZ^^#HL^J`3
;protected:‰GIS5^T[TN;.Q
;protected:—QcQ,aEX^NH/;
;protected:”YRtG<FG_\L?:[
;protected:‘MEd)_SWMaH7A
;protected:‘ZFM+\FjBpM2A
;protected:›LcTW_+UrJce^8g
;protected:»R]`g#UZ^PR1O7
;protected:ŒZd`U.EM]I`:;g
;protected:”Y\VbT,YDYRN3
;protected:ÊDhWL-VKaUF=
;protected:”DqO/dPY]B;:?
;protected:‡PVaR#_BnLH=Aa
;protected:◊PGR+RaUPdS8@
;protected:»MQR8SJWMWf-P
;protected:ÕHa[]R.W`LVs\;j
;protected:”S\TZ.^]V7>>
;protected:QmSi96@GD◊[SbQ"rN\`M<9W
;protected:”aaZZM+MHvQHK
;protected:ŒOXP/^GXLVf5B
;protected:ÿMOS [QXYWO7@
;protected:À`UbXY-h^PbY_7\
;protected:ÊKcV^_-S_O`mV3N
;protected:‘JmUk%YRiPd\7>
;protected:”DaO/c_MaU^:O
;protected:fRYX@3Q3]?
;protected:ŒOXP/^GXLVf5B
;protected:ÿMOS [QXYWO7@
;protected:À`UbXI-VKaUF<79
;protected:ÊP^dZ,[RX`Z\77>>
;protected:ÀpMb%GNgQQA0R
;protected:”TjO/QL^TB=:R
;protected:‡USQ,D_ScG79[
;protected:“aZJ,LCpPQ@7R
;protected:’BNT,hFSL`KJ4
;protected:‰GIS5ZRZE`S.R
;protected:—SUNR`Z+OQpS3Q
;protected:‘JmUk%T\gWC>7>L
;protected: `LU0[OYA_V8K
;protected:ÀINR#nDhFZUA>
;protected:◊US`Z"qNcV`Z@2
;protected:^S`^XU>>=ÊCoK&SeP[OK_74
;protected:ÊKcV^_-F[TXYJZ7C
;protected:ÀpFpQ]-EÇUT
;protected:ÃYZXj`/@É<>
;protected:»X]boI'LQ[n
;protected:…_QXS5KP`KN;
;protected: aUaV+MNRRP=
;protected:‡FS]R#_BnLH?
;protected:›\[T$_TIl5U
;protected:ÿ]^S LO^_E77R
;protected:ÀpFpQ]-EÇUT
;protected:WQ_Hm_BBE‘OSQ.RhISLSVJ2
;protected:‰GZSh]/TTRWCe\;G
;protected:”^RTWe,H{MQ
;protected:‘PmWh\&=çPU
;protected:÷Q[aYd)PUc\
;protected:’MZdc^#HL^J`1
;protected:‰RUclP/OE^RDO
;protected:—\_acS LO^_E9
;protected:”^Od!oNM[AP
;protected:◊`VR+C_[VR;8S
;protected:»]S`dZ';ÑId
;protected:TaYO\k=A@8F”DqO/V[RYARa8H
;protected:ÀI_RVq!bULYVQb:;
;protected:‘]GrUf0;ÑSF
;protected:”QXjI'LMUeCL
;protected:ÕHa[]b.WURPJ@
;protected:◊]ZbYW+>Ñ^I
;protected:œX[YuG<FG_\L?
;protected:÷Q[aYd)PQ]SO1
;protected:”[[nZM+MDpH^7
;protected:Œ_aP/aMSY.d
;protected:—abQ,NA]UNH/M
;protected:”^HrMs%6Ö[P
;protected:UW\_TIl<AJ”NaF^a,kLNY8:
;protected:ÊC_K&NV\VP48B
;protected: pNc\b,=x;>
;protected:^]V7>>=ÊDhWL-VKaUF<
;protected:”Ej[U0LM_GM?
;protected:‘[OYQ,D_ScG8
;protected:’XVaT$MLTeKB
;protected:ÿNX_F+OQpS
;protected:œ]QWjX<5~=E
;protected:Xa[VZO6N<AJ
;protected:”NPF+^OdD[S86
;protected:ÊC_K&]XVPbL8?
;protected: `]UcN,SPQZM_V3A
;protected:‘ErGoX&NV\VP68;
;protected: eXc_+RVX^WSf69
;protected:”NFd!lHRNiR;A
;protected:ÃNNH>YR\L`U,?
;protected:÷NlIZ^,D_ScG99L
;protected:“V]X[+HgabYRZ@2
;protected:”WZ[I'LMUeCN1L
;protected:’W^UaG,^V_]dc7f
;protected:’IYQR8DH]SEO-b
;protected:ÕHa[]R.W`LVs\;j
;protected:”U[CQ.MYUNM</d
;protected:…^HL-eM[OXT75
;protected:ÊKRV+\PLLbTD7
;protected:œM`IqT<XZNi_b:^
;protected:‘RQrX/VTd`IR\?J
;protected:ÀY]R#_BnLH=AP
;protected:◊`VR+C_[VR<8S
;protected:»]`R8DH]SEP-b
;protected:ÕO[XP/OId[.d
;protected:—QSQ,]CWO``/:
;protected:”NFd!lHRNiR;B
;protected:ÃN_HqL/c_MaU^:f
;protected:‡JV_[#qFpKUcH<
;protected:◊PGR+RaUPdS8@
;protected:»MQR8SJWMWf-P
;protected:ÕM\iY/TMd^KeWBB
;protected:F,`iyux}#W}qfátÖtt-gyÑÇmzp"axÅu+>
;protected:VN_A>J7A”YRtG<FKee6f
;protected:÷F`QUa)bdL`bS7h
;protected:‘jH[Wc#NyL5
;protected:ŒZd`U.EM]I`9;g
;protected:”Y\VbT,kLNY
;protected:‘EqG<FG_\L?:;
;protected:‘XQtUf0<>D+=A
;protected:‘kXIbR#_FtU2S
;protected:›LRT$\NN_]W<>
;protected:‘OCQ.\[OH_T/R
;protected:…^YL`h*PS\\79
;protected:ÊP^dZ,`E_W[n69=@
;protected:ÀaPiK&NZb_:J
;protected:‘TPaO/QPd],Q
;protected:÷YgYSb,;
;protected:ÊTqG]S5KTfT8b
;protected: `LU0[OYA_V8K
;protected:ÀINR#nDhFZUA>
;protected:◊PXR^U>\cQ_a`,N
;protected:÷SgWV+`VfJbY9?G>
;protected:◊[SbbH>JTh[
;protected:‘_LQ.MYUNM>/d
;protected:…iT\S5KP`KN<.u
;protected:—\_acS LO^_E9
;protected:”YRtG<FG_\L?:[
;protected:‘XQt`U0LM_GM?
;protected:‘[OYQ,D_ScG6
;protected:’bYeZ[,C
;protected: q^QgQ,NEc^8o
;protected:ÀINR#nDhFZUA=
;protected:◊PGR+RaUPdS8A
;protected:»MbRkV'^`DrVo1I
;protected:’\Yc]$`^JgOcC=>A
;protected:»X]boI'LQ[n
;protected:…nQL-VKaUF>7H
;protected:ÊV^fQ,NA]UNI/^
;protected:”YRtXb%GNgQQ@
;protected:ÃOWTd)PQ]SO1
;protected:”[[nO^+D
;protected:ÀqV^\L-VOg^0c
;protected:”DaO/`NXNTS:?
;protected:‡EJQ,SaM]YN9I
;protected:“QbJ_^"q]Pd`_9C
;protected:”U[lR'__KgGp88?I
;protected:“\]ZcQ"_Ng`
;protected:”^YF+OMjJI=8I
;protected:ÊDhWL-VKaUF>
;protected:”Om_U0LQeP7e
;protected:‘ZWM^_#qU]Y[`Ad
;protected:◊PGR+UrJce^8P
;protected:»MQR8SJWMWf-O
;protected:ÕHP[*_QPM_JJ=
;protected:◊WZ`\ ^VU^W:=>7mL
;protected:pXNV[^B@6@E kXeV+MRX[:c
;protected:‡EJQ,SaM]YN9H
;protected:“QQJ,[EjJcX7@
;protected:’B_T_[#Z_MWsTH_
;protected:ŒTd^^.WTTHr<AB?[X
;protected:SSWRl69=@=ÊC_K&`iKccW8N
;protected: p[U0LM_GM>8^
;protected:ÀY]R#_BnLH>AP
;protected:◊`VR+C_[VR=8S
;protected:»MQR8SJWMWf-O
;protected:ÕHP[*_QPM_JJ=
;protected:◊TPOSSe.M][W7R
;protected:ÀePpT&`]SUb7>=6
;protected:qQXV_??2?]WR
;protected:ÀINR#nDhFZUA=
;protected:◊PGR+RaUPdS8A
;protected:»MbRkF'Q\IjBcX2C
;protected:›LcTW_+C_[VR=8=
;protected:»R]`g#PY`6P3PTQ
;protected:’WMU.TOWCrQ;C
;protected:”NPF+^OdD[S87
;protected:ÊCpKY`5]cOXa^.a
;protected:—V__[-IYb?J5;ZW
;protected:ÀgO_K&NV\VP68Q
;protected: `]UcN,`TLbak/a
;protected:”UQaG<FG_\L@:J
;protected:‘MVd\R0^`NT`a8r
;protected:ÀPYOI>B]WMOE6U
;protected:÷FOQ"nL[Q_T93
;protected:”PO^#WNXDrIH9
;protected:ŒOiPbQ$MLTeK?<B
;protected:‘TO_],kH[T[YQ3N9
;protected:O[i=A@8[V<ÊKcV^_-STUZD:
;protected:œ]QWjX<5~=E
;protected:“R]QR+C_[VR;8S
;protected:»N]Y^#HL^J`2HK
;protected:ŒPdWU.EM]I`;;V
;protected:”U[CQ.MYUNM>/d
;protected:…^YL`X*bbE``UJc
;protected:◊YYOS LO^_E87R
;protected:À`UbXI-h^PbY_7\
;protected:ÊR]SQ,NA]UNH/M
;protected:”^HrMs%6ÖE:
;protected:X`I_;5P;CJ”OYRQ.MYUNM<
;protected:ÀaMnK&NV\VP5
;protected:‘NNpO/QL^TB=
;protected:÷^]WSb,3ñ1L
;protected:NTaH<B@>‘NNpO/QL^TB>
;protected:÷YgYM+MHvQH\
;protected:ŒOiPbQ$__Cr^b<e
;protected:‘_E_Zc83;<
;protected:ÀkPrK&NV\VP48b
;protected: kXegQ,`IR\
;protected:‘ZVM+MDpH^52D
;protected:›W^dPc+3P@:C<
;protected:‘`UMeR8DLc\/d
;protected:…^HL-eM[OXT75
;protected:ÊKRV+\PLLbTD7
;protected:œM`IqT<FKee6F
;protected:÷K[_Q>\TdT[c3=
;protected:÷OgPM+MHvQHK
;protected:ŒVcMU.EQcRJO
;protected:◊]ZbYW+F
;protected:‘kXIbR#_FtU2d
;protected:›LRT$\NN_]W<>
;protected:‘OCQ.\[OH_T/R
;protected:…^YL`h*bbE``UJL
;protected:◊WZ`\ _aTaI[>>6P
;protected:…iT\d[*PS\\
;protected:”TjO/QL^TB>:R
;protected:‡PVaR#_BnLH?Aa
;protected:◊[SbbH>JPbRN@
;protected:»X]b^#HL^J`2H\
;protected:ŒZd`fT$MLTeKA
;protected:ÿX[cF+OMjJI;8Z
;protected:ÊNk[]S5KP`KN<
;protected: aUaV+MNRRP<
;protected:‡PVaXZ>9
;protected:‰X[OlP/OId[.u
;protected:—QSQ,]CWO``/:
;protected:”NFd!lHRNiR;B
;protected:ÃN_Hq\/c_MaU^:O
;protected:‡JV_[#rTdNLaH<B@
;protected:ÃYZXuO/QPd]
;protected:»]ZR8DH]SEQ-b
;protected:ÕS\kP/OE^RDP5f
;protected:ÿX[cWQ.MYUNM?
;protected:ÀkPrK&NV\VP58b
;protected: kXegQ,NA]UNJ
;protected:ÀJW^I>B]WMOF
;protected:“\]ZXb"V
;protected:—beMcS LSdh/^
;protected:”NFd!lHRNiR;A
;protected:ÃNNH>YR\L`U,?
;protected:÷NlIZ^,VrBpZY9X
;protected:“V]X[+VqQXV_??3=
;protected:÷YgY^Q,DcYl
;protected:ÕXY[*POVSM5JO
;protected:◊]ZbS LO^_E97c
;protected:ÀkPr\L-VKaUF?
;protected:”Ej[U0LM_GM@
;protected:‘eR]Wc#V
;protected:…oZHd[*PS\\7Y
;protected:ÊKRV+\PLLbTD6
;protected:œMOI>Q_QGa]6C
;protected:÷F`QUq)bdL`bS7Q
;protected:‘_R[Z,WqIeKZ@G=A
;protected:÷Q[aYd)PUc\
;protected:’RWT,YDYRN6JG
;protected:‰HR_[*POVSM5
;protected:ÊV^fQ,NEc^8o
;protected:ÀI_RVq!oYGaj];h
;protected:ÃNNH>\cQ_a`,N
;protected:÷N[I'[OO_Ud19
;protected:’WMU.TOWCrQ;D
;protected:”S\TZ._`LM_?5Q3kP
;protected:Z`]SUb7>>4X—\_aR-APf\DZ
;protected:œMOI>Q_QGa]6B
;protected:÷FOQ"nL[Q_T94
;protected:”P`^VJ+_W_UqX2g
;protected:›Q^bS,^JgOcC=??OV
;protected:aTaI[>>6P;‰GIS5]cOXa^.a
;protected:—abQ,NA]UNH/M
;protected:”^Ud!]FXTW;;T
;protected:Ã^]H>JPbRN?,Q
;protected:÷^jI'LMUeCO1L
;protected:’WMU.TOWCrQ;C
;protected:”NPF+^OdD[S87
;protected:ÊEaHL`o*PS\\7H
;protected:ÊP^dZ,`HTT`K5:=
;protected:_KgGp88@GYZH
;protected:ÃNNH>YR\L`U,>
;protected:÷N[I'[OO_Ud1:
;protected:’W^UaG,QRdUPW^8C
;protected:»MbRkV'LMUeCO16
;protected:’\Yc]$UYVQ;BBZW
;protected:’BNT,hFSL`KJ4
;protected:‰GIS5ZRZE`S.R
;protected:—QdQ_` ^bMlXZ7O
;protected:ÀePpT&Vc^B@7>ZM
;protected:ÊR]SQ,NA]UNK/M
;protected:”NWdT_%YaV^da0f
;protected:”KlLU0LM_GM@8^
;protected:ÀI_RVa!oYGaj];h
;protected:ÃUYEd)PQ]SO17T
;protected:‘ZWM^O#qU]Y[`Ad
;protected:◊WROQ"_JaWM<9F
;protected:”PO^#WNXDrIH8
;protected:ŒOXP/^GXLVf5C
;protected:ÿM`SSN.MYUNM</U
;protected:…cTZ\5]TbM[a5P;C
;protected:YY`@2>@[c=œM`IqT<XOTc6F
;protected:÷VQ_Nu)?à;<
;protected:’CZ[R8DH]SEN-b
;protected:ÕI\bP/OE^RDO5U
;protected:ÿN[ZF+OMjJI=8I
;protected:ÊDkRL-VKaUF?7H
;protected:ÊR]SQ,NA]UNK/M
;protected:”NWdT_%YaV^da0f
;protected:”KlLU0LM_GM@8^
;protected:ÀI_RVa!oYGaj];h
;protected:ÃUYEd)PQ]SO17T
;protected:‘ZWM^O#qU]Y[`Ad
;protected:◊WROQ"_JaWM<9F
;protected:”`QlO^+<{N1
;protected:eWK`E=AHÃOWTd)PQ]SO0
;protected:”QXjI'LMUeCM
;protected:ÕIYgP/OE^RDP
;protected:—R\]R-AL`SZ6
;protected:œ]QWjX<5~=E
;protected:]TbM[a5PC◊R^R-F[TXYJZ7<
;protected:À`UbXY-[ZUZES^.U
;protected:—aU_Xd ;ÜR^
;protected:ÀJW^I>B]WMOE
;protected:“QbJ_^"qRV^7C
;protected:’MZdXo#7ÉRI
;protected:ÊNk[]S5KP`KN;
;protected: kXegQ,NA]UNI
;protected:ÀTZbZd!]FXTW<
;protected:◊[SbbH>JPbRN@
;protected:»]ZR8VPRZ/d
;protected:…nWL-VKaUF<7H
;protected:Ê[TdWc-0ÉTR
;protected:S#Ztzjäf<UxrxsÇwsz+Tç~Éyyq-CzÄq86
;protected:YYP7N4N?ŒOiPba$MLTeKB<B
;protected:‘_E_Zc83;<
;protected:À`Tb%YaV^da0O
;protected:”Om_[g+<Ö7Q
;protected:÷MfG^Q,D_ScG99l
;protected:“QbJ_N"q]Pd`_9Z
;protected:”`^^#HL^J`3H\
;protected:ŒZd`U.EM]I`9;g
;protected:”Y\VbT,kLNY
;protected:‘EqG<FG_\L?:;
;protected:‘MEd)bdL`bS7h
;protected:‘ZWM^O#qU]Y[`AM
;protected:◊WROQ"_JaWM>9F
;protected:”P`^VJ+_W_UqX2g
;protected:›S]QJ,LCpPQA7R
;protected:’B_T_[#Z_MWsTH_
;protected:ŒVcMU.EM]I`9;V
;protected:”NPF+^OdD[S86
;protected:ÊC_K&]XVPbL8?
;protected: `]Uc^,`TLbak/a
;protected:”SRrP<WTQI:B@SW
;protected:”TpO/QL^TB;:R
;protected:‡UYQ,D_ScG79[
;protected:“a`J,LCpPQB7R
;protected:’IYQR8DLc\/d
;protected:…^HL-eM[OXT75
;protected:ÊKRV+\PLLbTD7
;protected:œM`IqD<XZNi_b:^
;protected:‘RQrX/cP`SOaA>
;protected:jQK?<6PPg?ŒOiPba$_TIl5F
;protected:ÿMOS LO^_E77C
;protected:ÀpFpQ]-EÇ?>
;protected:?,^kåp{u+\enwÅru+^rìuÖsk-XyÅs$@
;protected:QZk<AB?aG»NZ^^#HL^J`5
;protected:‰HR_[*POVSM7
;protected:ÊL[bQ,NA]UNN
;protected:ÀTZbI>B]WMOE6f
;protected:÷Q[aYd)cUX\O0
;protected:”[[nI'LMUeCM1]
;protected:’bYeeJ,_GkYQA
;protected:”Y\VQ.MYUNM>/u
;protected:…iT\d[*cSQ\M4
;protected:ÊV^fQ,NA]UNK/^
;protected:”YRtXb%ZRbZQA
;protected:ÃYZXj`/@É<E
;protected:»X]boI'W[RnDkZTa
;protected:aY^^YY>4P=PJ”^_F+PMjJI=8I
;protected:ÊC_K&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀI_RVa!oYGaj];Q
;protected:ÃSZVm)P\`Y@2=BZYS
;protected:œMOI>Q_QGa]6B
;protected:÷FOQ"nL[Q_T94
;protected:”RQ[IZe,OmPlHUbc^;T
;protected:ÃSZVm)[_Z\bM>@>LD
;protected:œX[YuG<QU\eM^cR`
;protected:WQmYd]>>?4MH‘jUM+NDpH^62S
;protected:›LRT$\NN_]W<>
;protected:‘OCQ.\[OH_T/R
;protected:…^YL`X*bbE``UJL
;protected:◊WZ`\ MZae69=@Q_Q
;protected:‰GIS5ZRZE`S.Q
;protected:—QSQ,]CWO``/;
;protected:”PHaGo_&YdY_QSaYVJO
;protected:◊WZ`\ W][hXT>>5RC
;protected:‰RUclP/ZS[[Em^]d
;protected:W[\P`[?J5;NFÀpSb%HNgQQ>0R
;protected:”DaO/`NXNTS:?
;protected:‡EJQ,SaM]YN9I
;protected:“QbJ_N"q]Pd`_9C
;protected:”U[lR'NXXk4N7:[VZ
;protected:◊PGR+RaUPdS8@
;protected:»MQR8SJWMWf-P
;protected:ÕJRXPbh$XZQnL^eY`9F
;protected:”U[lR'W[RnVi88?IM
;protected:◊QP^Q"_JaWM<
;protected:’CW`R8DH]SEO
;protected:…_QXS5KP`KN=
;protected: aUaV+MNRRP?
;protected:‡UL_XZ>1î56
;protected:Na_\A6>?P_YIÿMOS ^bMlXZ7O
;protected:À`Db%VPaKcV0?
;protected:”DaO/`NXNTS:@
;protected:‡JV_[#_MqR9?G>]O
;protected:FX`OQ;ADYM]:”PO^#Z_MWsTHH
;protected:ŒOXP/^GXLVf5B
;protected:ÿMOS [QXYWO7@
;protected:ÀePpT&Oa_\A6>?P_
;protected:L[eX??2?\Mh=œMOI>TpFZbh6R
;protected:÷FOQ"nL[Q_T93
;protected:”PO^#WNXDrIH9
;protected:ŒTd^^.GX`OQ;ADYM
;protected:NLZ]\mP:=>7X…nWL-WKaUF>7H
;protected:ÊKRV+\PLLbTD6
;protected:œMOI>Q_QGa]6C
;protected:÷F`QUq)bdL`bS7Q
;protected:‘_R[Z,DjVi88?IXP
;protected:÷Q[aH>]T][N@,b
;protected:÷M\G^Q,D_ScG99[
;protected:“\]ZR+VcV_R=8d
;protected:»MbRkF'^`DrVo1I
;protected:’^XRTWf+VcV_R=8d
;protected:»LRPoI'LMUeCN1L
;protected:’bYeT$`POnK@<b
;protected:‘OTQaO8V[L`Xq-_
;protected:ÕO[XPbh$`POnK@<b
;protected:‘NDOeR8DH]SEO-b
;protected:ÕS\kP/bIY[DN5f
;protected:ÿM`SSN._lD[`_/a
;protected:…eSIShd/bIY[DN5f
;protected:ÿLPQWQ.MYUNM</d
;protected:BhZS@G<C\EF”TpO/QL^TB;:R
;protected:‡UYQ,D_ScG79[
;protected:“a`J,LCpPQB7R
;protected:’R]T,YDYRN6JG
;protected:‰WXS5KP`KN?.d
;protected:—QSQ,]CWO``/:
;protected:”NFd!lHRNiR;B
;protected:ÃPPEd\i0W[\PN]afW3Q
;protected:‘JmUk%GYdY_cQ?=4R
;protected:—\_aXd ;Ü<P
;protected:ÀTZbZd!hTU]XYd\X
;protected:NWQmYd]>>?4E÷^jI'MMUeCM1L
;protected:’WMU.TOWCrQ;C
;protected:”NPF+^OdD[S87
;protected:ÊCpKY`5]cOXa^.a
;protected:—V__[-BWcYK59?ZD
;protected:ÊNk[L-iO\^F?7Y
;protected:ÊJSTbR-AL`SZ63Q
;protected:‘PmWb%ZRbZQ@0c
;protected:”DrObS+_aA_c_DF
;protected:œTZFdTv%ZRbZQ@0c
;protected:”CbMfV+MNRRP>DI
;protected:œX[Yd!pJS]W;;e
;protected:ÃN_HqL/c_MaU^:O
;protected:‡LUNRVx!pJS]W;;e
;protected:ÃMOFuO/QL^TB<:R
;protected:‡PVaR#rFiUH=Aa
;protected:◊PXR^E>\cQ_a`,N
;protected:÷UfFM^f#rFiUH=Aa
;protected:◊OHPbH>JPbRN=,Q
;protected:PXmP:=>7lBVÕX_[*POVSM2JO
;protected:◊b]R-AL`SZ43Q
;protected:‘UpG<FG_\LA:J
;protected:‘]Td)PQ]SO37T
;protected:‘jUM+MDpH^92S
;protected:›\aT$MLTeKD<Q
;protected:‘OCQ.\[OH_T/Q
;protected:…^HL-eM[OXT76
;protected:ÊMTSQ_g W][hFV`ZWJG
;protected:‰LUad*QZS[[Wk<AB?
;protected:‘ZOaZc83;D
;protected:ÀkPr\L-aY^^G[`Pr
;protected:L[_Z\bM>@>L=œ]^I>C]WMOE6U
;protected:÷FOQ"nL[Q_T93
;protected:”PO^#WNXDrIH9
;protected:ŒOiPba$__Cr^b<N
;protected:‘TO_],[O\X?5P5jF
;protected:ŒZd`U.XQXR`<;g
;protected:”MQDbT,YDYRN6JG
;protected:‰RUc[*cSQ\M4J`
;protected:◊R_R`C+a`YW\^8F
;protected:ÊJjHL`o*cSQ\M4J`
;protected:◊QOPdF+OMjJI=8I
;protected:ÊNk[L-iO\^F=7Y
;protected:ÊKcV^O-S_O`mV3N
;protected:‘LlDbX`-iO\^F=7Y
;protected:ÊJSTbR-AL`SZ43Q
;protected:‘PmWb%ZRbZQ>0c
;protected:”DrObS+_aA_c_DF
;protected:œTZFdTv%ZRbZQ>0c
;protected:”CbMfV+MNRRP<DI
;protected:JWaPQ3N9TNO“a`J,LCpPQ@7R
;protected:’R]T,YDYRN4JG
;protected:‰WXS5KP`KN=.d
;protected:—abQ,NA]UNK/M
;protected:”^Ud!]FXTW>;T
;protected:Ã^]H>JPbRNB,Q
;protected:÷^jI'LMUeCR1L
;protected:’WMU.TOWCrQ;C
;protected:”NPF+^OdD[S87
;protected:ÊEaHL`o*[]S\NQsWc<Q
;protected:‘TO_],[OVZ\Xk4N7:
;protected:’gOcZ[,;zN9
;protected:J0^u{gws,hulnuvápä%X|ä~x|i,Nqên/E
;protected:QdZ2??Bm=œNXUd!]FXTW=
;protected:◊QP^Q"_JaWM@
;protected:’MZdR8DH]SEN-s
;protected:ÕS\kaU.XQXR`9
;protected:◊]ZbS LO^_E87c
;protected:ÀkPr\L-iO\^F=
;protected:”Om_U0LM_GM@8o
;protected:ÀTZbZd!pJS]W<
;protected:◊[SbWY>9á@C
;protected:‘ZOaeR8OVZ\FmVjY
;protected:R\dZd[6@<8_C◊b]R-BL`SZ43Q
;protected:‘EaG<UIYV^W:7
;protected:‘MEd)_SWMaH7B
;protected:‘ZWM^O#qU]Y[`AM
;protected:◊US`Z"_Ud]=@>6YO\
;protected:‡EJQ,SaM]YN9H
;protected:“QQJ,[EjJcX7@
;protected:’DPQRk]'W[RnDkZTaAP
;protected:◊US`Z"jX^``Y?4<DM
;protected:‡PVacI>MkTVPd_]b
;protected:P[ZRsVAD<BO:”`^^#IL^J`1HK
;protected:ŒOXP/^GXLVf5B
;protected:ÿMOS [QXYWO7@
;protected:À`UbXI-h^PbY_7E
;protected:ÊP^dZ,OL`[>L4=YMS
;protected:ÊC_K&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀKPOIq[<QU\eM^cR`7H
;protected:ÊP^dZ,YOZ^ae5;<BE
;protected:ÊDhWL-VKaUF<
;protected:”Ej[U0LM_GM?
;protected:‘[OYQ,D_ScG8
;protected:’gOcZ[,;zN9
;protected:Q\`Y?4<DZYSA”NFd!oYGaj];Q
;protected:ÃNNH>YR\L`U,>
;protected:÷N[I'[OO_Ud1:
;protected:’\Yc]$NWWk;CAAZN
;protected:AWcYJ78AZDn;‰GIS5]cOXa^.a
;protected:—QSQ,]CWO``/:
;protected:”NFd!lHRNiR;B
;protected:ÃSZVm)P\`Y?4<DZY
;protected:DSZ[SsNN97CO“a`J,MCpPQA7R
;protected:’BNT,hFSL`KJ4
;protected:‰GIS5ZRZE`S.R
;protected:—QdQ_` ^bMlXZ7O
;protected:ÀePpT&Na_\@8=AP_
;protected:—\_aR-TP[\Z53b
;protected:‘DbEsK&NV\VP68Q
;protected: kXeV+`RM[P=DZ
;protected:œM`IqD<XZNi_b:G
;protected:‘TPaObj+`RM[P=DZ
;protected:œLPGuG<FG_\L@:J
;protected:‘XQtO/dPY]B;:c
;protected:‡E[Q_F>TpFZbh6R
;protected:÷MZNHqc/dPY]B;:c
;protected:‡DKOcI>B]WMOE6U
;protected:OPaX4R:E^LF’R]T,YDYRN3JG
;protected:‰WXS5KP`KN<.d
;protected:—abQ,NA]UNJ/M
;protected:”^Ud!]FXTW=;T
;protected:ÃNNH>YR\L`U,>
;protected:÷N[I'[OO_Ud1:
;protected:’YORTWf+NmX_SZa[T7T
;protected:‘_R[Z,DjPkU[ZG>@D
;protected:ÃYZXj`/@É<E
;protected:»X]boI'W[RnDkZTa
;protected:WV^]TaX4R:EJ”^_F+PMjJI;8I
;protected:ÊC_K&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀI_RVq!oYGaj];Q
;protected:ÃSZVm)Q\`Y?4<DZY
;protected:ÀTZbI>UaRVOG6f
;protected:÷EPOYd)PQ]SO27T
;protected:‘eR]Q,WcNlG79l
;protected:“QbJ_N"q]Pd`_9C
;protected:”WZ[IZe,WcNlG79l
;protected:“PRHcQ"_JaWM=9F
;protected:”[[nI'_QPnCL1]
;protected:’W^UaG,^V_]dc7O
;protected:’IYQRk]'_QPnCL1]
;protected:’VNSeJ,LCpPQ@7R
;protected:OL`[>L4=YM=ÊSnK&NV\VP48Q
;protected: p[U0LM_GM?8^
;protected:ÀY]R#_BnLH?AP
;protected:◊`VR+C_[VR>8S
;protected:»]`R8DH]SER-b
;protected:ÕHP[*_QPM_JJ<
;protected:◊RNR-PNZMlK3?
;protected:‘GcDbX`-aY^^G[`Pr5U
;protected:ÿR[aO+PXgRW`Y5R2R
;protected:ÕXRiVf.4Ñ;2
;protected:Y)byysye+^~}fp~urå!nt{Å~xt.G{xr{xÉzz
;protected:aAWbNK5A”YRtG<FG_\L?:[
;protected:‘cQp`U0MM_GM>8o
;protected:ÀTZbZd!pJS]W:
;protected:◊PGR+RaUPdS8@
;protected:»MQR8SJWMWf-P
;protected:ÕHa[]R.XQXR`9;G
;protected:”S\TZ.`YO[M?5m
;protected:…^HL-eM[OXT75
;protected:ÊKRV+\PLLbTD7
;protected:œM`IqD<FG_\L?:;
;protected:‘RQrX/dLXaB>@Z
;protected:lDS_N6PQVÕS\kP/OId[.u
;protected:—beMcS MSdh/^
;protected:”NWdTo%YaV^da0O
;protected:”Tc][g+<Ö0;
;protected:÷NlIZ^,VrBpZY9o
;protected:“aSXXb"NÅ?A
;protected:”Y\VQ.MYUNM</u
;protected:…oZHd[*QOVSM2J`
;protected:◊R_R`S+a`YW\^8F
;protected:ÊSaYRd5:á>4
;protected:‘MVd\b0^`NT`a8r
;protected:ÀYP`Ou!L}6>
;protected:›W^dJ,LCpPQA7c
;protected:’S`Pc^#IL^J`2H\
;protected:ŒOiPba$__Cr^b<N
;protected:‘_E_Zc83;<
;protected:À`UbXY-h^PbY_7\
;protected:Ê[TdWc-0É>=
;protected:‡PVaR#_BnLH?Aa
;protected:◊aYNbH>KPbRN?,b
;protected:÷NlIZ^,VrBpZY9X
;protected:“aSXXb"NÅ?@
;protected:”NaF^a,kWH_aVJ[
;protected:‰WKaaa/>|<<
;protected: pNc\b,=x;>
;protected:`YO[M?5l;‰RUc[*QS\\7Y
;protected:Ê\dRbR-APf\DZ
;protected:œM`IqT<XZNi_b:G
;protected:‘]GrUf0;Ñ=0
;protected:”P`^VZ+_W_UqX2g
;protected:›\TbPc+2ñ9@
;protected:ÿX[cF+PMjJI;8Z
;protected:ÊTqG]S5KP`KN;.u
;protected:—QdQ_` ^bMlXZ7O
;protected:ÀpFpQ]-EÇ?>
;protected:ÃN_Hq\/c_MaU^:f
;protected:‡UL_XZ>1î57
;protected:’bYeT$NLTeK@<b
;protected:‘`UMeR8DH]SEO-s
;protected:ÕHa[]b.W`LVs\;S
;protected:”^RTWe,H{7;
;protected:‘ErGoX&`iKccW8e
;protected: pNc\b,=x;?
;protected:‘eR]Q,E_ScG89l
;protected:“bcFcQ"_JaWM>9W
;protected:”P`^VZ+_W_UqX2P
;protected:›\TbPc+2ñ9?
;protected:ÿM`SS^._lD[`_/x
;protected:…nJZYl*?Ü4=
;protected:”Tc][g+<Ö0;
;protected:bMdWI>>RX…^YL`h*QOVSM2J@
;protected:◊bP`YW+>ÑH4
;protected:œ]QWjX<5~=E
;protected:^PSUN>4X—\_aR-BPf\DZ
;protected:œ^aEuG<FKee6f
;protected:÷F`QUq)bdL`bS7h
;protected:‘jH[Wc#NyL5
;protected:ŒZd`U.FM]I`9;g
;protected:”_bBbT,YDYRN3JX
;protected:‰GZSh]/aXM_Wq5i
;protected:ÿ]QaLb.<ê37
;protected:”YRtG<GG_\L@:[
;protected:‘^W``U0LM_GM?8o
;protected:ÀI_RVq!oYGaj];h
;protected:Ã^PVj`/@É<=
;protected:»X]b^#IL^J`3H\
;protected:Œ`jLfT$MLTeKA<b
;protected:‘OTQa_8V[L`Xq-v
;protected:ÕXRiVf.4Ñ;2
;protected:Ê[TdWc-0É>=
;protected:S#Ztzjäf<UxrxsÇwsz+Tç~Éyyq-Aor,kxi~dÅu
;protected:bUY@GD◊[SbWY>9áH;
;protected:‘eO]eR8EH]SEN-b
;protected:KVNH<I÷Q[aH>JPbRN=,b
;protected:÷dgU^Q,E_ScG69l
;protected:“\]ZcQ"rN\`M<
;protected:’CW`R8DH]SEQ
;protected:…_QXS5LP`KN>
;protected: kXeV+MRX[:c
;protected:‡V\McI>Ca]V9l
;protected:“QQJ,[EjJcX7?
;protected:’BNT,hFSL`KJ5
;protected:‰GZSh]/aXM_Wq5R
;protected:ÿR[aO+c_]D:=
;protected:‘PmWb%HRmZ;e
;protected:ÃYZXuO/QL^TB@
;protected:÷YgYM+MHvQH\
;protected:ŒZd`fT$NPZn
;protected:—\_aR-AL`SZ83b
;protected:‘PmWsK&NZb_
;protected:÷Q[aH>KPbRN=,b
;protected:÷YgY^Q,D_ScG;
;protected:’bYeT$MLTeK?<b
;protected:‘ZOaeR8EH]SEN
;protected:…iT\S5KP`KN@.u
;protected:—\_acS LO^_E7
;protected:”YRtG<GG_\L@:[
;protected:‘XQt`U0LM_GMC
;protected:‘eR]Q,D_ScG79l
;protected:“\]ZcQ"`JaWM=
;protected:’MZdR8DH]SES-s
;protected:ÕS\kaU.EM]I`:
;protected:◊]ZbS MO^_E97c
;protected:ÀkPr\L-VKaUFA
;protected:”Om_U0LM_GM@8o
;protected:ÀTZbZd!^FXTW<
;protected:◊[SbQ"_JaWMA9W
;protected:”[[nZM+MDpH^7
;protected:[`ZKB@>‘XQtO/RPd],b
;protected:÷NlIZN,VrBpZY9o
;protected:“aSXXb"NÅ?@
;protected:”Y\VQ.MYUNM</u
;protected:…iT\d[*bWKZ
;protected:”DqO/QL^TB;:C
;protected:‡EZQ,E_ScG69L
;protected:“\]ZR+Dca_<b
;protected:‘`UMeR8DLc\/u
;protected:…iT\d[*QS\\
;protected:”DaO/`NXNTS:?
;protected:‡EJQ,SaM]YN9I
;protected:“QbJ_N"q]Pd`_9Z
;protected:”U[lR'LXLeOaI9?
;protected:›W^dPc+:
;protected:Ê\dRbR-BPf\DZ
;protected:œMOI>Q_QGa]6B
;protected:÷FOQ"nL[Q_T94
;protected:”P`^VZ+_W_UqX2P
;protected:›Q^bS,LNgP]R>>
;protected:’MZdc^#IPdS
;protected:ÊNk[L-WKaUF>7Y
;protected:ÊV^fbR-BL`SZ6
;protected:œX[Yd!^FXTW;;e
;protected:ÃYZXuO/RL^TB=
;protected:÷YgYM+NDpH^52d
;protected:›W^d[R+D_[VR<
;protected:‘PL]T,ZDYRN3
;protected:ÊNk[Rd5B
;protected:◊aYNbH>KTh[8d
;protected:»MQR8SJWMWf-O
;protected:ÕHP[*_QPM_JJ=
;protected:◊R_R`S+a`YW\^8F
;protected:ÊHkYU-VVXURN>4
;protected:ÊV^fbR-BPf\
;protected:‡PVaR#`BnLH?Aa
;protected:◊[SbbH>KPbRN@
;protected:»X]b^#IL^J`2H\
;protected:ŒZd`fT$NLTeKA
;protected:ÿNX_F+PMjJI<
;protected:‘PmWh\&E
;protected:›]dP[R+Dca_<b
;protected:‘OCQ.\[OH_T/Q
;protected:…^HL-eM[OXT76
;protected:ÊKcV^_-S_O`mV3N
;protected:‘JmUk%GY^Q]P7>
;protected:”Om_U0^UTN7e
;protected:‘eR]bR#_BnLH=
;protected:›\TbPc+2ñ9?
;protected:QWUTNMA>RÀTZbI>Ca]V9l
;protected:“QQJ,[EjJcX7?
;protected:’BNT,hFSL`KJ5
;protected:‰GZShM/aXM_Wq5i
;protected:ÿR[aO+OXaJUPP6P
;protected:BhTU]W=AHÃNNH>\cQ_a`,N
;protected:÷^jI'MMUeCL1L
;protected:’g\U.FM]I`:;V
;protected:”^_F+PMjJI=8I
;protected:ÊSnK&OV\VP78Q
;protected: `LU0[OYA_V8K
;protected:ÀINR#nDhFZUA>
;protected:◊RIOQUx)QUc\9F
;protected:”U[lR'LXRmQ^88
;protected:NaSV\IP>4X
;protected:—QSQ,]CWO``/:
;protected:”NFd!lHRNiR;B
;protected:ÃN_Hq\/dPY]B;:C
;protected:‡JV_[#_Pg88
;protected:’XY\T$NLTeKB<Q
;protected:‘POXT,ZDYRN5JG
;protected:‰HUZ[*QOVSM3JO
;protected:◊SZYS MO^_E77R
;protected:ÀgO_K&OV\VP78Q
;protected: `]UcN,`TLbak/a
;protected:”UQaG<GG_\LA:J
;protected:‘MVd\R0^`NT`a8r
;protected:ÀPYOI>C]WMOF6U
;protected:÷F`QUa)bdL`bS7h
;protected:‘aQJQ,E_ScG69[
;protected:K^Y7>E kXeV+NNRRP?DZ
;protected:œLPGuG<FG_\LB:J
;protected:‘XQtO/RL^TB=:c
;protected:‡E[Q_F>TpFZbh6R
;protected:÷MZNHqc/RL^TB=:c
;protected:‡DKOcI>B]WMOG6U
;protected:÷Q[aH>KPbRN>,b
;protected:÷NlIZN,VrBpZY9X
;protected:“X\GR^\>KPbRN>,b
;protected:÷M\G^Q,D_ScG79[
;protected:“\]ZR+D_[VR;8d
;protected:»MbRkF'^`DrVo1I
;protected:’^XRTWf+D_[VR;8d
;protected:»LRPoI'LMUeCL1L
;protected:’WMU.TOWCrQ;C
;protected:”NPF+^OdD[S87
;protected:ÊCpKYP5^T[TN;.U
;protected:—V__[-AN]Yh69
;protected:”NFd!lHRNiR;A
;protected:ÃNNH>YR\L`U,?
;protected:÷NlIZ^,VrBpZY9X
;protected:“V]X[+PpVa^O@=3=
;protected:÷^jI'LMUeCL1L
;protected:’g\U.EM]I`:;V
;protected:”^_F+OMjJI=8I
;protected:ÊSnK&NV\VP78Q
;protected: `LU0[OYA_V8K
;protected:ÀINR#nDhFZUA>
;protected:◊WROQUx)PUc\9F
;protected:”U[lR'Y^PpO`96@G
;protected:“QQJ,[EjJcX7?
;protected:’BNT,hFSL`KJ5
;protected:‰LUad*bSXRZXQ;
;protected:PSZY]3=H
;protected:‘ZFM+\FjBpM2@
;protected:›LRT$\NN_]W<?
;protected:‘OTQaO8V[L`Xq-_
;protected:ÕM\iY/\VY?2Q;
;protected:◊SZYS LO^_E:7R
;protected:ÀaPiK&NV\VP68Q
;protected: aX\V+MNRRP=DI
;protected:œN[Pd!]FXTW:;T
;protected:ÃUYEd)PQ]SO37T
;protected:‘ZWM^O#qU]Y[`Ad
;protected:◊WROQ"_JaWM>9F
;protected:”P`^VJ+_W_UqX2g
;protected:›S]QJ,LCpPQA7R
;protected:’B_T_[#Z_MWsTH_
;protected:ŒVcMU.EM]I`9;V
;protected:”Y\VWe,H{?;
;protected:‘[mSsK&`^Q]:J
;protected:‘MEd)_SWMaH7A
;protected:‘ZFM+\FjBpM2A
;protected:›Q^bS,YTk<AC=
;protected:G-St|sÑh'[~hÅjènu{5\~Éxuyg>VÑ|u}lÑ
;protected:T\e69E‘PmWb%GRmZ;e
;protected:ÃN_Hq\/c_MaU^:f
;protected:‡PVaR#`FtU2d
;protected:›LRT$\NN_]W<>
;protected:‘OCQ.\[OH_T/R
;protected:…^YL`X*bbE``UJc
;protected:◊WZ`\ ]S_H69
;protected:X?5`Oa5@’bYeT$MLTeK?<b
;protected:‘eO]eR8EH]SEN-s
;protected:ÕS\kaU.WURP
;protected:ÊV^fQ,OEc^8o
;protected:ÀHOPZd!]J^]AP
;protected:◊[SbWY>:AG8=
;protected:’BNT,hFSL`KJ4
;protected:‰GIS5ZRZE`S.R
;protected:—QdQ_` ^bMlXZ7O
;protected:ÀePpT&Zi_]A6
;protected:‘^W``U0LQeP7T
;protected:‘ZFM+\FjBpM2@
;protected:›LRT$\NN_]W<?
;protected:‘OTQaO8V[L`Xq-_
;protected:ÕM\iY/aI`QQt<A
;protected:ÿMOS [QXYWO7?
;protected:À`Db%VPaKcV0@
;protected:”Im]^0X[X3=
;protected:[`mQ:=FÀqV^\L-VOg^0R
;protected:”DaO/`NXNTS:?
;protected:‡EJQ,SaM]YN9I
;protected:“QbJ_^"q]Pd`_9C
;protected:”U[lR'^QWdVj88
;protected:ZdUB@>‘XQtO/QL^TB;:c
;protected:‡PVacI>B]WMOH
;protected:“\]ZR+C_[VR<8d
;protected:»X]boI'LMUeCP
;protected:ÕS\kP/OE^RDP5f
;protected:ÿX[cWQ.MYUNMA
;protected:À`Tb%GNgQQA0C
;protected:”DqO/RL^TB;:C
;protected:‡EJQ,VrBpZY9X
;protected:“RZVR+C_[VR;
;protected:‘PL]T,YDYRN4
;protected:ÊDhWL-VKaUF>
;protected:”Om_[g+>A
;protected:»X]boI'_QPnCL
;protected:RR\dZB@>
;protected:‘MEd)_SWMaH7A
;protected:‘ZFM+\FjBpM2A
;protected:›LcTW_+C_[VR@8=
;protected:»R]`g#TY[DbEO7
;protected:SNYNB@>‘XQtO/RL^TB=:c
;protected:‡DKOcI>B]WMOG6U
;protected:÷Q[aH>KPbRN>,b
;protected:÷NlIZN,VrBpZY9X
;protected:“X\GR^\>KPbRN>,b
;protected:÷M\G^Q,D_ScG79[
;protected:“\]ZR+D_[VR;8d
;protected:»MbRkF'^`DrVo1I
;protected:’^XRTWf+D_[VR;8d
;protected:»LRPoI'LMUeCL1L
;protected:ZcYPRH?=<Ê[aV+MNRRP<DI
;protected:œ]^I>B]WMOF6U
;protected:÷V^Q"_JaWM>9F
;protected:”`^^#HL^J`4HK
;protected:Œ_gP/OE^RDR5U
;protected:ÿ]^S LO^_E<7R
;protected:À`Db%YaV^da0O
;protected:”DaO/`NXNTS:?
;protected:‡EJQ,SaM]YN9I
;protected:“SSGR^\>]T][N=,Q
;protected:÷SgWV+YOmPl88
;protected:’WMU.TOWCrQ;C
;protected:”NPF+^OdD[S87
;protected:ÊCpKYP5KP`KN;.U
;protected:—V__[-M]]afG:=
;protected:‘UjG<FG_\LB:J
;protected:‘]Nd)PQ]SO27T
;protected:‘jOM+MDpH^62S
;protected:›\[T$MLTeK?<Q
;protected:‘QENT,YH_[8I
;protected:kSkZTQH<I
;protected:÷FOQ"nL[Q_T93
;protected:”PO^#WNXDrIH9
;protected:ŒOiPbQ$R[HjJVc7B
;protected:’B_T_k#HL^J`3H5
;protected:ŒTd^^.QaW5PXZ
;protected:ÿMOS [QXYWO7?
;protected:À`Db%VPaKcV0@
;protected:”DrObc+MNRRP?D:
;protected:œR[Wm!iZR@GYZ
;protected:÷MZNH>JPbRN?,Q
;protected:÷NlIZN,VrBpZY9o
;protected:“X\GR+C_[VR<8S
;protected:»MbRkF'^`DrVo1`
;protected:’^XRT$MLTeK?<Q
;protected:‘OCQ.\[OH_T/Q
;protected:…^HL-eM[OXT76
;protected:ÊKcV^_-S_O`mV3e
;protected:‘JmUk%Sba=A]O
;protected:‘]Td)PQ]SO07T
;protected:‘jUM+MDpH^62S
;protected:›\aT$MLTeKA<Q
;protected:‘VNNT,YH_[8I
;protected:ÊC_K&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀI_RVa!oYGaj];h
;protected:ÃSZVm)bU_R\V>@
;protected:YmO:=[NX…^YL`h*bWKZ79
;protected:ÊKRV+MNRRP<D:
;protected:œ]QWjX<5~=E
;protected:E/amzrnÉ)_Çpovst}z8UvÄÄlåf<IoÉ~nt
;protected:TTP>4X—\_aR-BPf\DZ
;protected:œMOI>Q_QGa]6B
;protected:÷FOQ"nL[Q_T94
;protected:”P`^VJ+_W_UqX2g
;protected:›Q^bS,^GrOSj>>
;protected:’MZdR8DLc\/u
;protected:…^HL-eM[OXT75
;protected:ÊKRV+\PLLbTD7
;protected:œM`IqD<XZNi_b:^
;protected:‘RQrX/bP_=3=
;protected:R?JEUP<=ÊNk[L-VKaUF<7Y
;protected:Êa^bbR-BL`SZ33b
;protected:‘PmWsK&`^Q]
;protected:÷F_Q"_JaWM<97
;protected:”P_^#IL^J`1H<
;protected:ZNaSV\7>E aUaV+`RM[P<
;protected:‡PVaR#_BnLH=Aa
;protected:◊[SbbH>JPbRN@
;protected:»X]b^#HL^J`2H\
;protected:ŒZd`fT$MLTeKC
;protected:ÿX[cF+OMjJI=8Z
;protected:ÊNk[]S5KP`KN@
;protected: kXeV+NNRRP>DZ
;protected:œ^aEuG<FG_\LD:J
;protected:‘XQtO/RL^TB<:c
;protected:‡E[Q_V>TpFZbh6R
;protected:÷MZNHqc/RL^TB<:c
;protected:lV8LXLeOO7@’h_QeJ,LCpPQD7R
;protected:’MZdR8EH]SEN-s
;protected:ÕHa[]b.W`LVs\;S
;protected:”U[CQaf8EH]SEN-s
;protected:YY?VVXUR?=<Ê\dRbR-AL`SZ63Q
;protected:‘FjSb%GNgQQA
;protected:ÃOWTd)PQ]SO4
;protected:”QXjI'LMUeCQ
;protected:ÕHP[*_QPM_JJ<
;protected:◊RNR-PNZMlK3?
;protected:‘ErGoX&`iKccW8N
;protected: eXc_+PNLTUZK5VV
;protected:‘EaG<XZNi_b:G
;protected:‘]Td)PQ]SO07T
;protected:‘jUM+MDpH^62S
;protected:›\aT$MLTeKA<Q
;protected:‘_RQ.MYUNM?/d
;protected:…iT\Yl*?Ü4=
;protected:”Om_fV+`RM[P<
;protected:\DSTSQQ3kP@’bYeT$NPZn5f
;protected:ÿ^aOWQ.M][W7R
;protected:À`Db%VPaKcV0?
;protected:”DaO/`NXNTS:@
;protected:‡E[Q_V>TpFZbh6R
;protected:÷K[_Q>J[dM??
;protected:ARSNK5A”YRtMs%7?L7@
;protected:÷EPOYd)cUX\O07e
;protected:‘YGKbR#_FtU2S
;protected:›LRT$\NN_]W<>
;protected:‘OCQ.\[OH_T/R
;protected:…^YL`X*bbE``UJL
;protected:◊WZ`\ ^S`^R]>>
;protected:À`Db%VPaKcV0?
;protected:”DaO/`NXNTS:@
;protected:‡JV_[#bBnLUXH<
;protected:PZXN>4X—\_aXd <@CE4
;protected:œLPGuG<YKZeL?:[
;protected:‘LFb`U0LQeP7T
;protected:‘ZFM+\FjBpM2@
;protected:›LRT$\NN_]W<?
;protected:‘OTQa_8V[L`Xq-_
;protected:ÕM\iY/aI`QWl<A
;protected:TL^TOVA>RÀTZbOu!N9
;protected:ŒZd`fT$`POnK@
;protected:TW[\P>@F‡USQ,D_ScG;9[
;protected:“aZJ,LCpPQD7R
;protected:’RWT,YDYRN6JG
;protected:‰WRS5KP`KN=.d
;protected:—a\Q,NA]UNI/M
;protected:”^Od!]FXTW:;T
;protected:Ã^WH>]T][N=,Q
;protected:÷YgYM+NDpH^72d
;protected:›]dP[R+C_[VR=8S
;protected:»X]b^#IL^J`2H\
;protected:ŒOiPba$__Cr^b<N
;protected:‘VNNT_r#IL^J`2H\
;protected:J`F=AHÃ_`DuO/QL^TB<:R
;protected:‡PVaR#`BnLH=Aa
;protected:◊PXR^U>\cQ_a`,N
;protected:÷UfFM^f#`BnLH=Aa
;protected:Sa6?=<Ê\dRbR-AL`SZ33Q
;protected:‘UjG<GG_\L?:[
;protected:‘TQp`U0_QZPM>8^
;protected:ÀINR#nDhFZUA=
;protected:◊PGR+RaUPdS8A
;protected:»MbRkV'_QPnCL16
;protected:’\Yc]$P]Gq]BB
;protected:”N`F+OMjJI@83
;protected:ÊC_K&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀNZ`R>EkP9?
;protected:Y\TaX?=<ÊV^fQ,OA]UNJ/^
;protected:”MGbXb%GNgQQ@0R
;protected:”Om_U0MM_GM?8o
;protected:ÀI_RVa!oYGaj];Q
;protected:ÃUYEd\i0MM_GM?8o
;protected:GH]QVr4N?ŒNYNfT$MLTeK@<Q
;protected:‘ZOaT,ZDYRN3JX
;protected:‰GZShM/aXM_Wq5R
;protected:ÿTZPF+PMjJI;8Z
;protected:ÊB`I]S5KP`KN;.d
;protected:—QSQ,NA]UNM/7
;protected:O[NQ3V
;protected:ÕHP[*_QPM_JJ<
;protected:◊RNR-PNZMlK3?
;protected:‘GcDbX`-iO\^F=7H
;protected:ÊP^dZ,QLZ]\K5
;protected:K][XlEO7@
;protected:’WMU.TOWCrQ;C
;protected:”NPF+^OdD[S87
;protected:ÊCpKYP5P_TPMRUJ?
;protected:◊R_R`S+OMjJI@83
;protected:ÊHkYU-YSeA6[V
;protected: `LU0^`NT`a8[
;protected:ÀYWR#_BnLH?AP
;protected:◊`PR+C_[VR<8S
;protected:»]ZR8DH]SEN-b
;protected:ÕXY[*cSQ\M2JO
;protected:◊]ZbS MO^_E97c
;protected:ÀqV^\L-VKaUF>7H
;protected:ÊV^fQ,OA]UNI/^
;protected:”NWdTo%YaV^da0O
;protected:”KlLUce,OA]UNI/^
;protected:”_X`Xb%GNgQQ?0R
;protected:”Om_U0MM_GM>8o
;protected:ÀI_RVq!oYGaj];Q
;protected:ÃUYEd\i0MM_GM>8o
;protected:ÀZ`NZd!]FXTW:;T
;protected:Ã^WH>KPbRN=,b
;protected:÷UgU^Q,WcNlG69l
;protected:“P\HXb"NÅ?A
;protected:”MQDbT,YDYRN8JG
;protected:‰GZShM/aXM_Wq5R
;protected:ÿTZPF+OMjJI?8I
;protected:ÊCpKYP5]cOXa^.x
;protected:—X^NR-AL`SZ63Q
;protected:‘EaG<UIYV^W:7
;protected:‘MEd)_SWMaH7B
;protected:‘ZWM^_#qU]Y[`Ad
;protected:◊US`Z"bReC=[X
;protected:»]`R8DH]SEQ-b
;protected:ÕX_[*POVSM6JO
;protected:◊b]R-AL`SZ83Q
;protected:‘LlDb%GRmZ;T
;protected:ÃNNH>YR\L`U,>
;protected:÷N[I'[OO_Ud1:
;protected:’W^UaG,^V_]dc7f
;protected:’GZb[8VL_RRt4N
;protected:IOcH<^Y>‘MVd\b0^UTN7E
;protected:‘ZFM+MDpH^82D
;protected:›W^dJ,LCpPQC7c
;protected:’MZdc^#HL^J`1
;protected:‰RUc[*POVSM6J`
;protected:◊]ZbdF+OMjJI<
;protected:‘PmWb%GNgQQC0c
;protected:”Om_fV+MNRRP>
;protected:‡UL_XZ>1î56
;protected:`Z^UR^?=<ÊKbV+R]FWOSk/:
;protected:”^HrMs%6Ö[P
;protected:J.Wuyiän/`}qpi~w{Ü#YzÅwáoÅ%R\\
;protected:V^U7>E aUaV+MNRRP?
;protected:‡EJQ,SaM]YN9H
;protected:“QQJ,[EjJcX7@
;protected:’B_T_[#HL^J`1H<
;protected:ŒTd^^.H[XGp[BBj=
;protected:’MZdR8DLc\/u
;protected:…^HL-eM[OXT75
;protected:ÊKRV+\PLLbTD7
;protected:œM`IqD<XZNi_b:^
;protected:‘RQrX/TZYRR]A>w4
;protected:œX[Yd!bULYVQb:[
;protected:‘XQt`U0OM_GMA
;protected:‘ZFM+RSdM]LY9K
;protected:“\]ZR+Cca_<b
;protected:‘ZOaeR8HH]SEQ
;protected:…iT\Yl*@@;9<
;protected: q^QgQ,RA]UNK/M
;protected:”YRtXb%GRmZ
;protected:◊[SbWY>9áV>
;protected:‘`UMeR8DH]SEP-s
;protected:ÕS\kVf.4Ñ;6
;protected:ÊV^fbR-TP[\Z3
;protected:œM`IqT<XZNi_b:G
;protected:‘TPaObj+`RM[P<DZ
;protected:œ^aEuG<FG_\L@:[
;protected:‘XQtUf0;Ñ@5
;protected:”[[nZM+`HkQ^5
;protected:ŒOiPba$__Cr^b<N
;protected:‘VNNT_r#[PYS`1H\
;protected:Œ`jLfT$MLTeK?<b
;protected:‘OCQ.\[OH_T/Q
;protected:…^HL-eM[OXT76
;protected:ÊKcV^_-S_O`mV3N
;protected:‘JmUk%R\\=ATP[b
;protected:NmPBBQTVGSH‘eR]Wc#NySK
;protected:ŒZd`fT$NPZn
;protected:—R\]R-BL`SZ3
;protected:œNXUd!^FXTW;
;protected:◊QP^Q"`JaWM>
;protected:’BNT,hFSL`KJ4
;protected:‰GIS5ZRZE`S.R
;protected:—RQWX-F[a?J
;protected:ÀINR#nDhFZUA=
;protected:◊PGR+RaUPdS8A
;protected:»R]`g#SZS]Q3kP
;protected:R\\=ATP[b<ÊR]SQ,NEc^8^
;protected:ÀTZbOu!L}=S
;protected:›W^d[R+Dca_
;protected:ÿNX_F+PMjJI;
;protected:‘FjSb%HNgQQ?
;protected:ÃOWTd)QQ]SO2
;protected:”PO^#WNXDrIH8
;protected:ŒOXP/^GXLVf5C
;protected:ÿNMYL+T\k69
;protected:”PHaG<JG_\LB:J
;protected:XZIx<A_VF’MZdR8DLc\/u
;protected:…iT\d[*SS\\
;protected:”Om_U0LM_GM>8o
;protected:ÀTZbZd!`FXTW:
;protected:◊[SbQ"_JaWM=9W
;protected:”[[nZM+PDpH^6
;protected:ŒZd`U.EM]I`;;g
;protected:”Y\VbT,\DYRN5
;protected:ÊNk[Rd5V^U7>\3
;protected:ÊV^fbR-BPf\
;protected:‡PVaXZ>MkL9?f;?
;protected:÷Q[aYd)QQ]SO0
;protected:”[[nO^+XRe4NV7>
;protected:›W^d[R+D_[VR<
;protected:‘ZOaZc8OVR?5o2N
;protected:ÕS\kaU.FM]I`;
;protected:◊RNR-PNZMlK3>
;protected:‘EaG<UIYV^W:8
;protected:‘NCjU/V[M@2
;protected:”[[nI'OQ[n-s
;protected:ÕS\kaU.FQcR
;protected:ÊV^fQ,QA]UNH/^
;protected:”YRtXb%HNgQQ>
;protected:ÃYZXd)SQ]SO17e
;protected:‘eR]bR#`BnLH>
;protected:›W^dJ,OCpPQB7c
;protected:’MZdc^#IL^J`3
;protected:‰GIS5ZRZE`S.Q
;protected:—QSQ,]CWO``/;
;protected:”ODjM<KVZH<
;protected:◊[SbWY>U^W>>^0
;protected:”[[nZM+NHvQ
;protected:‰RUcaa/ZSS>4o9?
;protected:ÿX[cWQ.NYUNM<
;protected:ÀkPrQ]-aYVA6];3
;protected:ÊV^fbR-BL`SZ4
;protected:œX[YjX<QUTH<`>6
;protected:‘XQt`U0MM_GM@
;protected:‘ZFM+\FjBpM2@
;protected:›LRT$\NN_]W<?
;protected:‘PAWZ,^SH>>
;protected:ÀkPrK&NZb_:[
;protected:‘XQt`U0NQeP
;protected:”[[nI'LMUeCL1]
;protected:’bYeeJ,NCpPQ@
;protected:”Y\VQ.MYUNM=/u
;protected:…iT\d[*ROVSM3
;protected:ÊV^fQ,NA]UNJ/^
;protected:”YRtXb%INgQQ@
;protected:ÃYZXd)SUc\9W
;protected:”[[nZM+MHvQ
;protected:‰RUc[*SOVSM2J`
;protected:◊]ZbdF+OMjJI;
;protected:‘PmWb%JNgQQ?0c
;protected:”Om_fV+MNRRP=
;protected:‡PVaR#bBnLH?Aa
;protected:◊[SbbH>JPbRN?
;protected:»X]bdZ'W[JQ3l6
;protected:ŒZd`fT$NPZn
;protected:—\_aXd W]SK5W<<
;protected:ÀkPr\L-WKaUF<
;protected:”Om_[g+X\G>@\I4
;protected:œX[YuG<GG_\L@
;protected:÷Q[aNu)[_R??P<@
;protected:‘eR]bR#`BnLH?
;protected:›LRT$\NN_]W<>
;protected:‘OCQ.\[OH_T/R
;protected:…_FRY5P_[7>
;protected:”Om_[g+X\G>@\H
;protected:ÀTZbZd!^J^]
;protected:›W^dPc+NmPBB[<=
;protected:»X]boI'MMUeCL
;protected:ÕS\kVf.P[R5PY?A
;protected:”Y\VbT,ZDYRN4
;protected:ÊNk[Rd5V^U7>[2P
;protected:—\_acS MO^_E9
;protected:”NFd!lHRNiR;A
;protected:ÃNNH>YR\L`U,?
;protected:÷OYOS+RS_4N
;protected:ÕS\kP/QId[.u
;protected:—\_acS MSdh
;protected:ÀTZbI>D]WMOE6f
;protected:÷Q[aYd)QQ]SO0
;protected:”[[nI'NMUeCM1]
;protected:’bYeeJ,MCpPQA
;protected:”Y\VQ.OYUNM>/u
;protected:…iT\d[*QOVSM4
;protected:ÊKRV+\PLLbTD6
;protected:œMOI>Q_QGa]6C
;protected:÷GMWN>O_T>>
;protected:’MZdR8DLc\/u
;protected:…iT\d[*RS\\
;protected:”Om_U0LM_GM>8o
;protected:ÀTZbZd!_FXTW:
;protected:◊[SbQ"_JaWM=9W
;protected:”[[nZM+ODpH^6
;protected:ŒZd`U.EM]I`;;g
;protected:”Y\VbT,[DYRN5
;protected:ÊNk[L-YOg^0c
;protected:”Om_fV+NRX[
;protected:÷YgYM+PDpH^52d
;protected:›W^d[R+D_[VR;
;protected:‘ZOaT,\DYRN4JX
;protected:‰RUclP/PE^RDO
;protected:—\_aR-DL`SZ53b
;protected:‘PmWsK&OV\VP6
;protected:‘XQtO/TPd],b
;protected:÷YgY^Q,DcYl
;protected:ÕS\kP/RE^RDN5f
;protected:ÿX[cWQ.MYUNM<
;protected:ÀkPrK&QV\VP58b
;protected: kXegQ,NA]UNI
;protected:ÀTZbI>E]WMOG6f
;protected:÷Q[aYd)PQ]SO2
;protected:”PO^#WNXDrIH8
;protected:ŒOXP/^GXLVf5C
;protected:ÿNMYL+T\e69
;protected:”YRtG<FKee6f
;protected:÷Q[aYd)TUc\
;protected:’MZdR8DH]SEN-s
;protected:ÕS\kaU.IM]I`9
;protected:◊]ZbS LO^_E87c
;protected:ÀkPr\L-ZKaUF=
;protected:”Om_U0LM_GM@8o
;protected:ÀTZbZd!aFXTW<
;protected:◊[SbQ"aNg`7c
;protected:’MZdc^#IPdS
;protected:ÊNk[L-XKaUF<7Y
;protected:ÊV^fbR-BL`SZ3
;protected:œX[Yd!_FXTW;;e
;protected:ÃYZXuO/RL^TB<
;protected:÷YgYM+ODpH^72d
;protected:›W^d[R+D_[VR=
;protected:‘OCQ.\[OH_T/Q
;protected:…^HL-eM[OXT76
;protected:ÊLP\W,SPXA>
;protected:‡PVaR#bFtU2d
;protected:›W^d[R+Dca_
;protected:ÿX[cF+RMjJI;8Z
;protected:ÊNk[]S5LP`KN;
;protected: kXeV+PNRRP=DZ
;protected:œX[YuG<GG_\L@
;protected:÷Q[aH>MPbRN?,b
;protected:÷YgY^Q,E_ScG8
;protected:’WMU.TOWCrQ;C
;protected:”NPF+^OdD[S87
;protected:ÊD]QR-[Z\A6
;protected:‘XQtO/UL^TB;:c
;protected:‡PVacI>C]WMOE
;protected:“\]ZR+G_[VR<8d
;protected:»X]boI'MMUeCM
;protected:ÕS\kP/SE^RDP5f
;protected:ÿX[cWQ.NYUNM>
;protected:ÀkPrK&RZb_:[
;protected:‘XQt`U0MQeP
;protected:”P`^VZ+_W_UqX2g
;protected:›NTQJ,MGvY;V
;protected:”NPF+^OdD[S86
;protected:ÊC_K&]XVPbL8?
;protected: aJ[\+R]S>@
;protected:‘ZFM+\FjBpM2@
;protected:›LRT$\NN_]W<?
;protected:‘PAWZ,jQK?<6P
;protected:…iT\S5NTfT8b
;protected: kXegQ,OEc^
;protected:‘eR]Q,G_ScG69l
;protected:“\]ZcQ"`JaWM<
;protected:’MZdR8GH]SEO-s
;protected:ÕS\kaU.FM]I`:
;protected:◊]ZbS OO^_E97c
;protected:ÀkPr\L-WKaUF>
;protected:”DaO/`NXNTS:?
;protected:‡EJQ,SaM]YN9I
;protected:“ROPX+HnJBB
;protected:”NPF+^OdD[S86
;protected:ÊC_K&]XVPbL8?
;protected: `]UcN,QA]UNK/=
;protected:”ODjM<WTQI:B@
;protected:ÃYZXd)TQ]SO37e
;protected:‘ZFM+\FjBpM2@
;protected:›LRT$\NN_]W<?
;protected:‘OTQa_8V[L`Xq-v
;protected:ÕM\iY/OHVWQe<A
;protected:ÿ]QaLb.<ê37
;protected:LPMjPc88G
;protected:›LRT$\NN_]W<>
;protected:‘OCQ.\[OH_T/R
;protected:…_FRY5\]R8<>4
;protected:ÊV^fQ,NEc^8o
;protected:ÀTZbZd!aJ^]
;protected:›W^dJ,LCpPQ@7c
;protected:’MZdc^#LL^J`1
;protected:‰RUc[*POVSM3J`
;protected:◊]ZbdF+SMjJI<
;protected:‘PmWb%GNgQQ@0c
;protected:”Om_fV+QNRRP>
;protected:‡FS]R#_BnLH=
;protected:›W^dJ,PCpPQC7c
;protected:’MZdc^#HL^J`2
;protected:‰GZShM/OE^RDO5F
;protected:ÿN[ZF+OMjJI;8I
;protected:ÊCoK&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀJLXO>GhT7CG>
;protected:◊QP^Q"_JaWM>
;protected:’MZdR8DLc\/u
;protected:…iT\d[*SS\\
;protected:”Om_U0LM_GM>8o
;protected:ÀTZbZd!`FXTW:
;protected:◊[SbQ"_JaWM=9W
;protected:”[[nZM+PDpH^6
;protected:ŒZd`U.EM]I`;;g
;protected:”Y\VbT,\DYRN5
;protected:ÊCoK&NV\VP48B
;protected: kXe\b,=x;R9I
;protected:ÀZ`NZd!]J^]AP
;protected:◊[SbWY>9áTP
;protected:‘ZOaeR8EH]SEN
;protected:…iT\Yl*?Ü<<
;protected:”Om_fV+NNRRP=
;protected:‡PVaXZ>1î=9
;protected:’bYeeJ,MCpPQB
;protected:”NPF+^OdD[S86
;protected:ÊC_K&]XVPbL8?
;protected: aJ[\+ReM=B>LX
;protected:œMOI>Q_QGa]6B
;protected:÷FOQ"nL[Q_T94
;protected:”P`^VJ+MDpH^52D
;protected:›Q^bS,WQe<AV<[X
;protected:»]ZR8DH]SEQ-b
;protected:ÕXY[*POVSM4JO
;protected:◊bWR-AL`SZ43Q
;protected:‘UjG<FG_\L?:J
;protected:‘OGaO/QPd],Q
;protected:Z[_69Q=Ri;‰GZShM/RE^RDN5F
;protected:ÿMOS LO^_E77C
;protected:À`Db%VPaKcV0?
;protected:”DaO/`NXNTS:@
;protected:‡FHWX#pO`96@G
;protected:“\]ZR+Gca_<b
;protected:‘ZOaeR8ELc\
;protected:ÀkPrK&RV\VP48b
;protected: kXegQ,OA]UNH
;protected:ÀTZbI>F]WMOF6f
;protected:÷Q[aYd)QQ]SO1
;protected:”[[nI'PMUeCN1]
;protected:’bYeeJ,MCpPQB
;protected:”NPF+^OdD[S86
;protected:ÊC_K&]XVPbL8?
;protected: aJ[\+R]A>@
;protected:‘ZFM+\FjBpM2@
;protected:›LRT$\NN_]W<?
;protected:‘PAWZ,jQK?<6P
;protected:…iT\S5KTfT8b
;protected: kXegQ,REc^
;protected:‘eR]Q,D_ScG69l
;protected:“\]ZcQ"cJaWM<
;protected:’MZdR8DH]SEO-s
;protected:ÕS\kaU.IM]I`:
;protected:◊]ZbS LO^_E97c
;protected:ÀkPr\L-ZKaUF>
;protected:”Om_[g+<ÖB<
;protected:÷YgY^Q,E_ScG6
;protected:’bYeZ[,;zV9
;protected:◊]ZbdF+PMjJI<
;protected:‘PmWb%JRmZ;e
;protected:ÃYZXuO/QPd]
;protected:»X]b^#KL^J`1H\
;protected:ŒZd`fT$MLTeK?
;protected:ÿX[cF+RMjJI<8Z
;protected:ÊNk[]S5KP`KN<
;protected: kXeV+PNRRP>DZ
;protected:œX[YuG<FG_\LA
;protected:÷F_Q"_JaWM<97
;protected:”PO^#WNXDrIH8
;protected:ŒOXP/^GXLVf5C
;protected:ÿNMYL+Tde5;<BX
;protected:ÊC_K&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀI_RVa!]FXTW:;E
;protected:ÃSZVm)[_R??FZY
;protected:‘jOM+MDpH^82S
;protected:›\[T$MLTeKA<Q
;protected:‘_LQ.MYUNM=/d
;protected:…nQL-VKaUF<7H
;protected:ÊMTSQ,NEc^8^
;protected:OVR?5dPg?ŒOiPba$PLTeK?<B
;protected:‘OCQ.MYUNM</U
;protected:…iT\S5OTfT8b
;protected: kXegQ,OEc^
;protected:‘eR]Q,H_ScG69l
;protected:“\]ZcQ"`JaWM<
;protected:’MZdR8HH]SEO-s
;protected:ÕS\kaU.FM]I`:
;protected:◊]ZbS PO^_E97c
;protected:ÀkPr\L-WKaUF>
;protected:”DaO/`NXNTS:?
;protected:‡EJQ,SaM]YN9I
;protected:“ROPX+HnJBB
;protected:”NPF+^OdD[S86
;protected:ÊC_K&]XVPbL8?
;protected: `]UcN,QA]UNK/=
;protected:”SRrP<WTQI:B@
;protected:H[XGp[BBj=G»MaR8IWQXDeTH:
;protected:Œ_Z^[e$<ÉHd
;protected:U^W>>]0E÷QiX';Ñ:c
;protected:MkL9?e:?HÃQ\W>9áE@
;protected:X\G>@\H4A”QTs!L}:C
;protected:aYVA6\;4X—Ta`,=xQD
;protected:XgJ:=\4X…aV[-EÇFR
;protected:P[R5PY@@E‘RQ`.<ê:@
;protected:W[JQ3l67G›O`c$<É3P
;protected:U^W>>]1=H‘]T\+<{VB
;protected:hTM@G[?HÃQ\W>9áH;
;protected:X\G>@]H3A”QTs!L}7S
;protected:aYVA6];3X—Ta`,=xQC
;protected:XgJ:=]3P;‰JWb5:áQ:
;protected:XZIQ;`AE‘RQ`.<ê;7
;protected:W[JQ3m66G›O`c$<É7S
;protected:U^W>>^1<H‘]T\+<{SG
;protected:hTM@G[@@>‘PSs)?àB>
;protected:YORA>i5A”QTs!L}=S
;protected:aYVA6]=2X—Ta`,=x;>
;protected:XgJ:=]5O;‰JWb5:á>4
;protected:XZIQ;`B=F’E\c,H{7;
;protected:R[k3P7:bO“RZVR+C_[VR>
;protected:‘PL]T,YDYRN7
;protected:ÊDhWL-VKaUFA
;protected:”Om_U0LM_GM>8o
;protected:ÀTZbZd!pJS]W:
;protected:◊[SbQ"_JaWM=9W
;protected:”[[nZM+`HkQ^6
;protected:ŒZd`U.EM]I`;;g
;protected:”Y\VbT,lHT[N5
;protected:ÊNk[Rd5:á><
;protected:‘XQt`U0W[\PN]afW
;protected:SZ[SsNN98AVD◊`VR+D_[VR=8S
;protected:»MQR8SJWMWf-O
;protected:ÕHP[*_QPM_JJ=
;protected:◊R_R`C+a`YW\^8F
;protected:ÊHkYU-VVd[6@=6lJ_
;protected:ÿMOS [QXYWO7?
;protected:À`Db%VPaKcV0@
;protected:”FcLUce,YOZ^OgXU_8I
;protected:ÊHkYU-aY^^YY=6P=P
;protected:ÿX[cWQ.XgRWN[XlU
;protected:hTU]jWAB6@M<Ê[aV+NNRRP=DI
;protected:œMOI>Q_QGa]6B
;protected:÷FOQ"nL[Q_T94
;protected:”P`^VJ+_W_UqX2P
;protected:›Q^bS,MNsVAD=@[A[
;protected:÷N[I'[OO_Ud19
;protected:’WMU.TOWCrQ;D
;protected:”PRCQaf8OVZ\FmVjY2S
;protected:›Q^bS,WQmYd]=@?4M
;protected:÷YgY^Q,OmPlHUbc^
;protected:[]S\`OP=ADNF’R]T,ZDYRN3JG
;protected:‰GIS5ZRZE`S.Q
;protected:—QSQ,]CWO``/;
;protected:”NWdT_%YaV^da0O
;protected:”Im]^0NXbM=B>LQH[
;protected:‘EaG<UIYV^W:7
;protected:‘MEd)_SWMaH7B
;protected:‘\HJQ_]>MkTVPd_]b0R
;protected:”Im]^0W[\P`[>L5;N
;protected:‘FjSb%GNgQQ>
;protected:ÃOWTd)PQ]SO1
;protected:”QXjI'LMUeCN
;protected:ÕXRiVf.4Ñ;2
;protected:aUd]=@?4YO\RÀINR#qU]Y[`AM
;protected:◊PGR+RaUPdS8@
;protected:»MQR8SJWMWf-P
;protected:ÕM\iY/QPaX4R;C^L
;protected:NYUX@@J7UL\=ÊC_K&`iKccW8N
;protected: `LU0[OYA_V8K
;protected:ÀINR#nDhFZUA>
;protected:◊US`Z"`Ud]=@?4YO
;protected:MdXT=@5RO]U@’WMU.W`LVs\;S
;protected:”NPF+^OdD[S86
;protected:ÊC_K&]XVPbL8?
;protected: eXc_+MYUX@@J7UL
;protected:MOmPlZS?I<CHÃ^]H>KPbRN?,Q
;protected:÷N[I'[OO_Ud19
;protected:’WMU.TOWCrQ;D
;protected:”NaF^a,kWH_aVJD
;protected:‰LUad*PZYY=6P=]Q
;protected:”Y\VQ.`]PWM>/u
;protected:…]IJd[*POVSM4JO
;protected:◊]ZbS _SYhE87c
;protected:À`UbXI-h^PbY_7E
;protected:ÊR]SQ_g _SYhE87c
;protected:À_E`\L-VKaUF=7H
;protected:ÊV^fQ,aEX^NH/^
;protected:”NWdT_%YaV^da0O
;protected:”KlLUce,aEX^NH/^
;protected:”MGbXb%GNgQQ>0R
;protected:LNsVAD=@[AE÷^jI'LMUeCL1L
;protected:’g\U.EM]I`:;V
;protected:”^_F+OMjJI=8I
;protected:ÊSnK&NV\VP78Q
;protected: `LU0[OYA_V8K
;protected:ÀINR#nDhFZUA>
;protected:◊RIOQUx)[_Z\PO`\`DI
;protected:œR[Wm!]QU\e_\@8>?
;protected: kXe\b,=x;F
;protected:‘eR]bR#jPkUI\jXc
;protected:PP[ZRsVAD=@G»]`R8EH]SEO-b
;protected:ÕHP[*_QPM_JJ<
;protected:◊RNR-PNZMlK3?
;protected:‘ErGoX&`iKccW8N
;protected: eXc_+NYUX@@J7UL
;protected:‘PmWb%ZRbZQ@0c
;protected:”CbMfV+MNRRP>DI
;protected:œX[Yd!pJS]W;;e
;protected:ÃN_HqL/c_MaU^:O
;protected:‡LUNRVx!pJS]W;;e
;protected:ÃMOFuO/QL^TB<:R
;protected:‡PVaR#rFiUH=Aa
;protected:◊PXR^E>\cQ_a`,N
;protected:÷UfFM^f#rFiUH=Aa
;protected:◊OHPbH>JPbRN=,Q
;protected:PXmP9?>7lBVÕX_[*POVSM2JO
;protected:◊b]R-AL`SZ43Q
;protected:‘UpG<FG_\LA:J
;protected:‘]Td)PQ]SO37T
;protected:‘jUM+MDpH^92S
;protected:›LRT$\NN_]W<>
;protected:‘OCQ.\[OH_T/R
;protected:…`JIShd/ZS[[Em^]d7R
;protected:’GZb[8ESZ[SsNN98A
;protected:›W^dPc+2ñ9G
;protected:ÿX[cWQ.XgRWN[XlU
;protected:_QU\e_\@8>?<Ê[aV+NNRRP<DI
;protected:œMOI>Q_QGa]6B
;protected:÷FOQ"nL[Q_T94
;protected:”P`^VZ+_W_UqX2P
;protected:›Q^bS,NNsVAD=@[A
;protected:”[[nI'_QPnCN1]
;protected:’VNSeJ,LCpPQB7R
;protected:’MZdR8WLX\EO-s
;protected:ÕHa[]R.W`LVs\;S
;protected:”U[CQaf8WLX\EO-s
;protected:ÕGQYaU.EM]I`:;V
;protected:”Y\VQ.`]PWM</u
;protected:…^YL`X*bbE``UJL
;protected:◊YYOSSe.`]PWM</u
;protected:…]IJd[*POVSM2JO
;protected:R\`Y?4=BZY=œ]^I>B]WMOE6U
;protected:÷V^Q"_JaWM=9F
;protected:”`^^#HL^J`3HK
;protected:Œ_gP/OE^RDQ5U
;protected:ÿ]^S LO^_E;7R
;protected:ÀpSb%GNgQQC0R
;protected:”DqO/`NXNTS:?
;protected:‡EJQ,SaM]YN9I
;protected:“SSGR^\>U^_[O\UYb8^
;protected:ÀNZ`R>DhTU]jWAB6@
;protected:”Tc][g+<Ö0;
;protected:TXg4==@=ÊNk[Rd5;D95>B
;protected: kXegQ,NEc^
;protected:‘eR]Q,D_ScG69l
;protected:“\]ZcQ"qRV^
;protected:”N`F+^OdD[S86
;protected:ÊC_K&]XVPbL8?
;protected: `]Uc^,NA]UNH/>
;protected:”SRrP<SXZG>AB
;protected:ÃOZOd)PQ]SO17T
;protected:‘[RTQ,D_ScG69[
;protected:“X\GR+C_[VR<8S
;protected:»MbRkF'^`DrVo1`
;protected:’^XRT$MLTeK?<Q
;protected:Z_M=B>L=œNXUd!pJS]W:
;protected:◊[SbQ"_JaWM<9W
;protected:”P_^#WNXDrIH8
;protected:ŒOXP/^GXLVf5C
;protected:ÿM`SS^._lD[`_/x
;protected:…cTZ\5X^`Q>?4R
;protected:—\_aR-AL`SZ43b
;protected:‘PmWsK&NV\VP4
;protected:‘MUd)_SWMaH7A
;protected:‘ZFM+\FjBpM2A
;protected:›LcTWO+UrJce^8g
;protected:»R]`g#YP_3P5
;protected:‰HR_[*POVSM3
;protected:ÊKbV+`RM[P<D6
;protected:UZ^PP5N9@’bYeT$`POnK?<b
;protected:‘`UMeR8DLc\/d
;protected:…^XL-eM[OXT75
;protected:ÊKRV+\PLLbTD7
;protected:œM`IqT<XZNi_b:^
;protected:‘MVd\b0^`NT`a8[
;protected:ÀNZ`R>TaYLbc<C
;protected:÷FOQ"q]Pd`_9C
;protected:Y]^e5;=@DX
;protected:…^XL-eM[OXT75
;protected:ÊKRV+\PLLbTD7
;protected:œM`IqD<FG_\L?:;
;protected:‘RQrX/VTd`IR\>L
;protected:ÀYWR#_BnLH>AP
;protected:◊`PR+C_[VR;8S
;protected:»MaR8SJWMWf-O
;protected:ÕHP[*_QPM_JJ=
;protected:◊TPOSSe.M][W7R
;protected:ÀePpT&[d\\@8>?C
;protected:ÊKbV+\PLLbTD6
;protected:œMOI>Q_QGa]6C
;protected:÷K[_Q>\TdQa[2?
;protected:TUpVPRZ5R;‰GZSh]/aMSY.U
;protected:—QSQ,NA]UNH/>
;protected:”^HrMs%6ÖE:
;protected:aSW<=6X—R\]R-AL`SZ3
;protected:œNXUd!]FXTW;
;protected:◊QP^Q"_JaWM>
;protected:’CW`R8DLc\
;protected:ÀpFpQ]-EÇ?>
;protected:WQ_HsWADE‘OSQ.RhISLSVJ3
;protected:‰GZSh]/TTRWCe\;G
;protected:”^RTWe,H{MQ
;protected:‘PmWh\&=ç:@
;protected:÷Q[aYd)PUc\
;protected:’CW`R8DH]SEN
;protected:…_QXS5KP`KN<
;protected: pUU0^UTN7T
;protected:‘jUM+MDpH^52S
;protected:›\TbPc+2ñOU
;protected:K+_vnrzq8Sypolëjãs&_ÑÉwrq+GvY
;protected:Th[??:”[[nO^+<{SF
;protected:‰X[OlP/OId[.u
;protected:—\_acS _SYhE7
;protected:”NVd!lHRNiR;A
;protected:ÃNNH>YR\L`U,?
;protected:÷NlIZN,WcNlG69L
;protected:“V]X[+GvYBBZZR
;protected:»MaR8SJWMWf-O
;protected:ÕHP[*_QPM_JJ=
;protected:◊R_R`C+OMjJI;8:
;protected:ÊHkYU-iXTfT?=
;protected:VnNg`>>G»X]b^#HPdSJX
;protected:‰X[Oaa/[EdWQe<AUc\
;protected:’B^T,hFSL`KJ4
;protected:‰GIS5ZRZE`S.R
;protected:—QdQ_` ^bMlXZ7O
;protected:ÀePpT&QdWT`V?=aP
;protected:—QcQ,]CWO``/:
;protected:”NFd!lHRNiR;B
;protected:ÃN_Hq\/c_MaU^:f
;protected:‡JV_[#cYl88NgQ^Y
;protected:ÃYZXd)PQ]SO07e
;protected:‘kXIWc#kBtQUTH<Q>
;protected:ÃN^H>YR\L`U,>
;protected:÷N[I'[OO_Ud1:
;protected:’W^UaW,^V_]dc7O
;protected:’GZb[8GVXQUp4Nd8
;protected:’W]U.TOWCrQ;C
;protected:”NPF+^OdD[S87
;protected:ÊCpKY`5]cOXa^.x
;protected:—V__[-Ec^?JDYR[N
;protected:ÊNk[L-VKaUF=7Y
;protected:Ê\dRWc-MLfXgJ:=N4
;protected:ÊCoK&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀI_RVq!oYGaj];Q
;protected:ÃSZVm)S_XQ_R>@kJ
;protected:ÀI^R#nDhFZUA=
;protected:◊PGR+RaUPdS8A
;protected:»MbRkV'^`DrVo1`
;protected:’\Yc]$QcRQ;PbR[X
;protected:»X]b^#HL^J`3H\
;protected:Œ`jL[e$YLZjXVC=N?
;protected:»MaR8SJWMWf-O
;protected:ÕHP[*_QPM_JJ=
;protected:◊R_R`S+a`YW\^8F
;protected:ÊHkYU-YY\SV^>4};
;protected:◊R^R-PNZMlK3>
;protected:‘EaG<UIYV^W:8
;protected:‘RQrX/Uc\@2L`SgN
;protected:[YQ[n4N?ŒZd`U.EQcRJ`
;protected:◊c`NYW+[UfOVR?5cYl
;protected:ÕH`[*_QPM_JJ<
;protected:◊RNR-PNZMlK3?
;protected:‘ErGoX&`iKccW8N
;protected: eXc_+P\MP`^K5f=
;protected:‘EqG<UIYV^W:7
;protected:‘MEd)_SWMaH7B
;protected:‘ZWM^_#qU]Y[`Ad
;protected:◊US`Z"ca_C=M_GZY
;protected:‘eR]Q,D_ScG69l
;protected:“bcFXb"kR]\ZS@2M>
;protected:‘ZVM+\FjBpM2@
;protected:›LRT$\NN_]W<?
;protected:‘OTQa_8V[L`Xq-_
;protected:ÕM\iY/RSYPTp<Ao=
;protected:‘OSQ.\[OH_T/Q
;protected:…^HL-eM[OXT76
;protected:ÊKcV^_-S_O`mV3e
;protected:‘JmUk%Kee=AOVSZM
;protected:ÊV^fQ,NA]UNI/^
;protected:”_X`Ms%SVcV^U7>M3
;protected:ÊKbV+\PLLbTD6
;protected:œMOI>Q_QGa]6C
;protected:÷F`QUq)bdL`bS7Q
;protected:‘_R[Z,GmNaWX@GiA
;protected:÷F_Q"nL[Q_T93
;protected:”PO^#WNXDrIH9
;protected:ŒOiPba$__Cr^b<e
;protected:‘TO_],][W>>DpHkP
;protected:ŒZd`U.EM]I`;;g
;protected:”_bBWe,eLUW[JQ3^7
;protected:ŒOhP/^GXLVf5B
;protected:ÿMOS [QXYWO7@
;protected:À`UbXY-h^PbY_7E
;protected:ÊP^dZ,QOXS^j69j>
;protected:HvQO7G_\YZHÃYZXd)U`QXNG^:c
;protected:‡PVacI>E]WMOH
;protected:“QQJ,QRdUPW^8C
;protected:»MaR8SJWMWf-O
;protected:ÕHP[*_QPM_JJ=
;protected:◊SLXY ]`QpS:=
;protected:‘EqG<UIYV^W:7
;protected:‘MEd)_SWMaH7B
;protected:‘ZWM^O#bBnLH=AA
;protected:◊US`Z"ca_C=X
;protected:RX[A>`=
;protected:œX[YjX<J^]H<WC
;protected:ÃYZXuO/RPd]
;protected:»X]bdZ'PdSQ3d:6
;protected:’bYeeJ,MCpPQ@
;protected:”Y\VWe,][W>>KS2
;protected:‰RUclP/PE^RDO
;protected:—\_aXd Pf\K5O@>
;protected:ÀkPr\L-WKaUF>
;protected:”DaO/`NXNTS:?
;protected:‡EJQ,SaM]YN9I
;protected:“ROPX+HnVBB
;protected:”Y\VWe,][W>>KR
;protected:…iT\d[*QS\\
;protected:”Om_[g+QeP>@TL3
;protected:œX[YuG<GG_\L?
;protected:÷Q[aNu)Th[??H??
;protected:‘eR]bR#`BnLH>
;protected:›W^dPc+GvYBBS@?
;protected:»X]boI'MMUeCN
;protected:ÕHP[*_QPM_JJ<
;protected:◊RNR-PNZMlK3?
;protected:‘F_Mh%L]V=A
;protected:÷Q[aH>MTh[8d
;protected:»X]boI'MQ[n
;protected:…iT\S5NP`KN;.u
;protected:—\_acS MO^_E7
;protected:”YRtG<IG_\L@:[
;protected:‘XQt`U0MM_GM?
;protected:‘eR]Q,G_ScG89l
;protected:“\]ZcQ"`JaWM>
;protected:’BNT,hFSL`KJ4
;protected:‰GIS5ZRZE`S.R
;protected:—RQWX-F[[?J
;protected:ÀTZbOu!a]V@GRB
;protected:÷Q[aYd)QUc\
;protected:’MZdXo#Lc\6PIO5
;protected:ŒZd`fT$NLTeK?
;protected:ÿX[cLb.QpS:=T6O
;protected:…iT\d[*QOVSM3
;protected:ÊV^fWc-Ec^?JK:=
;protected:‘PmWsK&OV\VP6
;protected:‘MEd)_SWMaH7A
;protected:‘ZFM+\FjBpM2A
;protected:›MPZP,QR_<A
;protected:ÿX[cF+RQpS3b
;protected:‘PmWsK&OZb_
;protected:÷Q[aH>MPbRN=,b
;protected:÷YgY^Q,E_ScG6
;protected:’bYeT$PLTeK@<b
;protected:‘ZOaeR8EH]SEO
;protected:…iT\S5NP`KN=.u
;protected:—\_acS MO^_E9
;protected:”NFd!lHRNiR;A
;protected:ÃNNH>YR\L`U,?
;protected:÷OYOS+RSk4N
;protected:ÕS\kVf.Id[5PQA
;protected:ÿX[cWQ.N][W
;protected:”YRtMs%Kee=AV6<
;protected:”Om_fV+NNRRP<
;protected:‡PVaXZ>FtU9?]<@
;protected:÷Q[aYd)QQ]SO1
;protected:”[[nO^+Q[n4NM8?
;protected:›W^d[R+D_[VR=
;protected:‘OCQ.\[OH_T/Q
;protected:…^HL-eM[OXT76
;protected:ÊLP\W,SPLA>
;protected:‡PVaR#bFtU2d
;protected:›W^d[R+Dca_
;protected:ÿX[cF+RMjJI;8Z
;protected:ÊNk[]S5LP`KN;
;protected: kXeV+PNRRP=DZ
;protected:œX[YuG<GG_\L@
;protected:÷Q[aH>MPbRN?,b
;protected:÷YgY^Q,E_ScG8
;protected:’WMU.TOWCrQ;C
;protected:”NPF+^OdD[S87
;protected:ÊD]QR-[Z\A6
;protected:‘XQtUf0Pd]3=V=
;protected:‡PVacI>Ca]V
;protected:’bYeZ[,PZn<AX<<
;protected:’MZdc^#IL^J`1
;protected:‰RUcaa/S\\>4f:@
;protected:ÿX[cWQ.NYUNM=
;protected:ÀkPrQ]-Zb_A6T<4
;protected:ÊV^fbR-BL`SZ5
;protected:œMOI>Q_QGa]6B
;protected:÷FOQ"nL[Q_T94
;protected:”QMdO'Q\DQ3
;protected:‰RUc[*SS\\7Y
;protected:ÊV^fbR-BPf\
;protected:‡PVaR#bBnLH=Aa
;protected:◊[SbbH>KPbRN=
;protected:»X]b^#KL^J`2H\
;protected:ŒZd`fT$NLTeK@
;protected:ÿX[cF+RMjJI=8Z
;protected:ÊNk[]S5LP`KN=
;protected: `LU0[OYA_V8K
;protected:ÀINR#nDhFZUA>
;protected:◊QEXW"dY\C=
;protected:‘ZOaZc8H_[?5f1
;protected:‰RUclP/PId[
;protected: kXe\b,RX[A>`37
;protected:”YRtXb%HNgQQ>
;protected:ÃYZXj`/Uc\@2S>=
;protected:‡PVacI>C]WMOF
;protected:“\]ZXb"ca_C=T=2
;protected:”[[nZM+NDpH^7
;protected:ŒOXP/^GXLVf5B
;protected:ÿMOS [QXYWO7@
;protected:ÀaBhQ&SeKB@
;protected:ÃYZXd)TQ]SO37e
;protected:‘YGKbR#_FtU2S
;protected:›\TbPc+2ñ9?
;protected:Uc\@2WH
;protected:‘eR]Wc#cYl88YJ
;protected:“\]ZcQ"`Ng`
;protected:”Y\VWe,][W>>OS1
;protected:‰RUclP/PE^RDN
;protected:—\_aXd Pf\K5S@=
;protected:ÀkPr\L-WKaUF=
;protected:”Om_[g+QeP>@XM5
;protected:œX[YuG<GG_\LA
;protected:÷FOQ"nL[Q_T93
;protected:”PO^#WNXDrIH9
;protected:ŒPVV[.J\X5P
;protected:—\_aXd Pf\K5S?
;protected:‘PmWsK&OZb_
;protected:÷Q[aNu)Th[??L?>
;protected:‘eR]bR#`BnLH=
;protected:›W^dPc+GvYBBW@>
;protected:»X]boI'MMUeCM
;protected:ÕS\kVf.Id[5PUCB
;protected:”Y\VbT,ZDYRN5
;protected:ÊC_K&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀJLXO>GlF9?
;protected:›W^dJ,OGvY;g
;protected:”Y\VbT,ZH_[
;protected:‘PmWb%JNgQQ>0c
;protected:”Om_fV+NNRRP<
;protected:‡PVaR#bBnLH>Aa
;protected:◊[SbbH>KPbRN>
;protected:»X]b^#KL^J`3H\
;protected:ŒZd`fT$NLTeKA
;protected:ÿMOS [QXYWO7?
;protected:À`Db%VPaKcV0@
;protected:”E_U[0Q\Z3=
;protected:÷YgYSb,HvQO7R@
;protected:›W^d[R+Dca_
;protected:ÿX[cLb.QpS:=X6N
;protected:…iT\d[*QOVSM2
;protected:ÊV^fWc-Ec^?JO:<
;protected:‘PmWsK&OV\VP5
;protected:‘XQtUf0Pd]3=Z?J
;protected:ÀTZbZd!^FXTW<
;protected:◊PGR+RaUPdS8@
;protected:»MQR8SJWMWf-P
;protected:ÕINaV/TTM>4
;protected:ÊV^fQ,QEc^8o
;protected:ÀTZbZd!^J^]
;protected:›W^dJ,OCpPQ@7c
;protected:’MZdc^#IL^J`1
;protected:‰RUc[*SOVSM3J`
;protected:◊]ZbdF+PMjJI<
;protected:‘PmWb%JNgQQ@0c
;protected:”Om_fV+NNRRP>
;protected:‡EJQ,SaM]YN9H
;protected:“QQJ,[EjJcX7@
;protected:’CLZX8IWX?5
;protected:ÊNk[Rd5Og^7>W4
;protected:ÊV^fbR-BPf\
;protected:‡PVaXZ>FtU9?a<?
;protected:÷Q[aYd)QQ]SO0
;protected:”[[nO^+Q[n4NQ8>
;protected:›W^d[R+D_[VR<
;protected:‘ZOaZc8H_[?5j3N
;protected:ÕS\kaU.FM]I`;
;protected:◊RNR-PNZMlK3>
;protected:‘EaG<UIYV^W:8
;protected:‘NCjU/V[M@2
;protected:”[[nI'OQ[n-s
;protected:ÕS\kaU.FQcR
;protected:ÊV^fQ,QA]UNH/^
;protected:”YRtXb%HNgQQ>
;protected:ÃYZXd)SQ]SO17e
;protected:‘eR]bR#`BnLH>
;protected:›W^dJ,OCpPQB7c
;protected:’MZdc^#IL^J`3
;protected:‰GIS5ZRZE`S.Q
;protected:—QSQ,]CWO``/;
;protected:”ODjM<KVZH<
;protected:◊[SbWY>Ng`>>Y1
;protected:”[[nZM+NHvQ
;protected:‰RUcaa/S\\>4j:?
;protected:ÿX[cWQ.NYUNM<
;protected:ÀkPrQ]-Zb_A6X<3
;protected:ÊV^fbR-BL`SZ4
;protected:œX[YjX<J^]H<[?6
;protected:‘XQt`U0MM_GM@
;protected:‘ZFM+\FjBpM2@
;protected:›LRT$\NN_]W<?
;protected:‘PAWZ,^SH>>
;protected:ÀkPrK&QZb_:[
;protected:‘XQt`U0MQeP
;protected:”[[nI'OMUeCL1]
;protected:’bYeeJ,MCpPQ@
;protected:”Y\VQ.PYUNM=/u
;protected:…iT\d[*QOVSM3
;protected:ÊV^fQ,QA]UNJ/^
;protected:”YRtXb%HNgQQ@
;protected:ÃNNH>YR\L`U,>
;protected:÷N[I'[OO_Ud1:
;protected:’XK[Z$R[OQ;
;protected:◊]ZbYW+Sdh69W<
;protected:ÀkPr\L-WOg^
;protected:ÃYZXj`/Uc\@2W><
;protected:‡PVacI>C]WMOE
;protected:“\]ZXb"ca_C=X=1
;protected:”[[nZM+NDpH^6
;protected:ŒZd`[e$QcRQ;[@=
;protected:‘ZOaeR8EH]SEP
;protected:…^HL-eM[OXT75
;protected:ÊKRV+\PLLbTD7
;protected:œNMOj!bUG@G
;protected:Og^7>ZMX—\_aR-EL`SZ63b
;protected:‘DbEsK&NZb_:J
;protected:‘MVd\b0OM_GMA8N
;protected:ÀYP`Ou!L}6=
;protected:›LbT$R[HjJVc7B
;protected:’BNT,hFSL`KJ4
;protected:‰GIS5ZRZE`S.R
;protected:—V__[-RYR@H69
;protected:PdSQ3kSKG›W^dPc+3P@
;protected:◊]ZbdF+OQpS
;protected:œNXUd!]FXTW:
;protected:◊QP^Q"_JaWM=
;protected:’CW`R8DH]SEP
;protected:…_QXS5KP`KN>
;protected: pNc\b,=x;>
;protected:PgPL]^6P`N?ŒOhP/TTRWCe\;E
;protected:”^RTWe,H{MQ
;protected:^UcYl88G›W^dJ,LGvY;g
;protected:”Y\VbT,[H_[
;protected:‘PmWb%GNgQQ>0c
;protected:”Om_fV+ONRRP<
;protected:‡PVaR#_BnLH>Aa
;protected:◊[SbbH>LPbRN>
;protected:»X]b^#HL^J`3H\
;protected:ŒZd`fT$OLTeKA
;protected:ÿM_S LO^_E77C
;protected:ÀkPrK&NV\VP48b
;protected: kXegQ,OA]UNH
;protected:ÀTZbI>B]WMOF6f
;protected:÷Q[aYd)QQ]SO1
;protected:”[[nI'LMUeCN1]
;protected:’bYeeJ,MCpPQB
;protected:”Y\VWe,H{IC
;protected:‘PmWsK&NV\VP4
;protected:‘XQtUf0;ÑNA
;protected:”[[nZM+MDpH^6
;protected:ŒZd`[e$<É5`
;protected:—\_acS LO^_E9
;protected:”YRtMs%6ÖGC
;protected:◊[SbbH>JPbRN@
;protected:»MQR8SJWMWf-O
;protected:ÕHP[*_QPM_JJ=
;protected:◊SLXY QfYK59?a
;protected:ÀgO_K&NZb_:J
;protected:‘MUd)_SWMaH7A
;protected:‘ZFM+\FjBpM2A
;protected:›LcTWO+C_[VR;8D
;protected:»R]`g#Y]Q[n4N^UX
;protected:›\[T$MLTeKB<Q
;protected:‘_LQ.MYUNM>/d
;protected:…nQL-VKaUF=7H
;protected:Ê[[V+MNRRP<DI
;protected:œOQFd!]J^]AP
;protected:a`Id[5Pb^[E‘OTQa_8FH]SEN-S
;protected:ÕHP[*POVSM2J@
;protected:◊RNR-PNZMlK3>
;protected:‘EaG<UIYV^W:8
;protected:‘NCjU/bYPA0>@
;protected:‘eR]Wc#NySJ
;protected:ŒZd`fT$NPZn
;protected:—R\]R-BL`SZ3
;protected:œNXUd!^FXTW;
;protected:◊QP^Q"`JaWM>
;protected:’BNT,hFSL`KJ4
;protected:‰GIS5ZRZE`S.R
;protected:—RQWX-F[O?J
;protected:ÀI^R#nDhFZUA=
;protected:◊PGR+RaUPdS8A
;protected:»NOXd#MW[Rp4N
;protected:ÕS\kP/OId[.u
;protected:—\_acS PSdh
;protected:ÀI^R#nDhFZUA=
;protected:◊PGR+RaUPdS8A
;protected:»MbRkF'^`DrVo1`
;protected:’\Yc]$^]GvYBBQQ^X
;protected:”[[nI'LMUeCL1]
;protected:’bYeeJ,PCpPQ@
;protected:”Y\VQ.MYUNM=/u
;protected:…iT\d[*TOVSM3
;protected:ÊV^fQ,NA]UNJ/^
;protected:”YRtXb%KNgQQ@
;protected:ÃYZXj`/@ÉCR
;protected:»X]boI'MQ[n
;protected:…iT\Yl*?ÜF=
;protected:”Om_fV+NNRRP<
;protected:‡PVaXZ>1î=6
;protected:’bYeeJ,MCpPQA
;protected:”OYRQ.NYUNM>
;protected:À`Db%VPaKcV0?
;protected:”DaO/`NXNTS:@
;protected:‡FHWX#dQi88
;protected:’bYeT$OPZn5f
;protected:ÿX[cWQ.N][W
;protected:”YRtG<HG_\L?:[
;protected:‘XQt`U0MM_GM>
;protected:‘eR]Q,F_ScG79l
;protected:“\]ZcQ"`JaWM=
;protected:’MZdR8FH]SEP-s
;protected:ÕS\kaU.FM]I`;
;protected:◊RNR-PNZMlK3>
;protected:‘EaG<UIYV^W:8
;protected:‘NCjU/V[M@2
;protected:”[[nI'LQ[n-s
;protected:ÕS\kaU.HQcR
;protected:ÊV^fQ,NA]UNH/^
;protected:”YRtXb%JNgQQ>
;protected:ÃYZXd)PQ]SO17e
;protected:‘eR]bR#bBnLH>
;protected:›W^dJ,LCpPQB7c
;protected:’MZdc^#KL^J`3
;protected:‰RUcaa/>|C=
;protected: kXegQ,OEc^
;protected:‘eR]Wc#NyQJ
;protected:ŒZd`fT$NLTeK?
;protected:ÿX[cLb.<ê;7
;protected:”YRtXb%HNgQQ?
;protected:ÃYZXj`/@ÉD@
;protected:»X]boI'MMUeCN
;protected:ÕS\kP/SId[.u
;protected:—\_acS LSdh
;protected:ÀTZbI>F]WMOE6f
;protected:÷Q[aYd)PQ]SO0
;protected:”[[nI'PMUeCM1]
;protected:’bYeeJ,LCpPQA
;protected:”Y\VQ.QYUNM>/u
;protected:…iT\d[*POVSM4
;protected:ÊKRV+\PLLbTD6
;protected:œMOI>Q_QGa]6C
;protected:÷GMWN>O_]>>
;protected:’MZdR8GLc\/u
;protected:…iT\d[*QS\\
;protected:”Om_U0OM_GM>8o
;protected:ÀTZbZd!^FXTW:
;protected:◊[SbQ"bJaWM=9W
;protected:”[[nZM+NDpH^6
;protected:ŒZd`U.HM]I`;;g
;protected:”Y\VbT,ZDYRN5
;protected:ÊC_K&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀJLXO>GlF9?
;protected:›LRT$\NN_]W<>
;protected:‘OCQ.\[OH_T/R
;protected:…_FRY5\]R8<>4
;protected:ÊV^fQ,NEc^8o
;protected:ÀTZbZd!`J^]
;protected:›W^dJ,LCpPQ@7c
;protected:’MZdc^#KL^J`1
;protected:‰RUc[*POVSM3J`
;protected:◊]ZbdF+RMjJI<
;protected:‘PmWb%GNgQQ@0c
;protected:”Om_fV+PNRRP>
;protected:‡PVaR#cFtU2d
;protected:›W^d[R+Cca_
;protected:ÿX[cF+SMjJI;8Z
;protected:ÊNk[]S5KP`KN;
;protected: kXeV+QNRRP=DZ
;protected:œX[YuG<FG_\L@
;protected:÷F_Q"nL[Q_T93
;protected:”PO^#WNXDrIH9
;protected:ŒPVV[.MZ_4R:E
;protected:ÿX[cF+OMjJI<8Z
;protected:ÊNk[]S5OP`KN>
;protected: kXeV+PRX[:c
;protected:‡PVacI>Ba]V
;protected:’bYeT$PLTeK?<b
;protected:‘ZOaeR8DH]SEN
;protected:…iT\S5NP`KN<.u
;protected:—\_acS LO^_E8
;protected:”YRtG<IG_\LA:[
;protected:‘XQt`U0LM_GM@
;protected:‘jH[Wc#NyL5
;protected:X_Zb_A6RPSvC◊]ZbS NSdh/^
;protected:”YRtXb%JRmZ
;protected:◊[SbbH>JTh[
;protected:‘ZOaT,[DYRN3JX
;protected:‰RUclP/RE^RDN
;protected:—\_acS LO^_E7
;protected:”YRtG<HG_\L@:[
;protected:‘XQt`U0OM_GM?
;protected:‘eR]bR#_BnLH>
;protected:›W^dJ,NCpPQB7c
;protected:’MZdc^#KL^J`3
;protected:‰RUclP/OE^RDP
;protected:—R\]R-EL`SZ6
;protected:œ]QWjX<5~=E
;protected:Og^7>S2X—Ta`,=xBT
;protected:QpS:=T3N;‰JWb5:á>4
;protected:QcRQ;W@<F’E\c,H{7;
;protected:Q[n4NM6?O“T_Y,;zN9
;protected:Th[??H<H‘]T\+<{UG
;protected:a]V@GR@>>‘PSs)?à;<
;protected:RX[A>`48E‘HoV<5~=E
;protected:Og^7>S3PC◊U\a-0É>>
;protected:][W>>KP;‰JWb5:áEH
;protected:QcRQ;WB;F’E\c,H{>Q
;protected:Q[n4NM8>O“T_Y,;zdN
;protected:Th[??H=@F‡HX`,3ñES
;protected:J^]H<WA>‘PSs)?àBO
;protected:RX[A>`67E‘HoV<5~?V
;protected:Og^7>S5OC◊U\a-0ÉQC
;protected:][W>>KQ3VÕK^j*?ÜER
;protected:PZn<AX?F’E\c,H{>L
;protected:Q[n4NM:=O“T_Y,;zPA
;protected:Th[??H??F‡HX`,3ñ3M
;protected:J^]H<WB6F”Go^/@É@N
;protected:Ec^?JK<E‘HoV<5~DM
;protected:Og^7>S7NC◊U\a-0É@>
;protected:][W>>KS2VÕK^j*?Ü7=
;protected:PZn<AX@>G»P_a83>R
;protected:HvQO7R=O“T_Y,;zUO
;protected:Th[??L;>F‡HX`,3ñ1L
;protected:J^]H<[>5F”Go^/@É<=
;protected:Ec^?JO7=FÀcRq%6ÖE:
;protected:TfT?=NOC◊U\a-0ÉEQ
;protected:][W>>OO1VÕK^j*?Ü;R
;protected:PZn<A\<=G»P_a83QR
;protected:HvQO7R>GD◊SUa+2ñOR
;protected:Uc\@2W@F‡HX`,3ñ8`
;protected:J^]H<[@4F”Go^/@ÉCS
;protected:Ec^?JO9<FÀcRq%6Ö[P
;protected:TfT?=NP;IÿP]b ;Ü<H
;protected:H_[?5j4VÕK^j*?Ü;O
;protected:PZn<A\><G»P_a83=M
;protected:HvQO7R@FD◊SUa+2ñBA
;protected:Uc\@2WA>RÀL\a#NyS9
;protected:Kee=AZ8F”Go^/@ÉCN
;protected:Ec^?JO;;FÀcRq%6ÖGB
;protected:TfT?=NR:IÿP]b ;ÜEJ
;protected:H_[?5j5N?ŒRf_/>|<@
;protected:GvYBBWAG»P_a83BC
;protected:HvQO7RBED◊SUa+2ñ?D
;protected:Uc\@2WC=RÀL\a#NyQK
;protected:Kee=AZ9>E cZd0;ÑR9
;protected:XOddRN>>HvQVÕk~ä*?Ü<A
;protected:XCvU^W>>O0E÷qâx';Ñ6O
;protected:N]]R\\=AP5F”gè~/@ÉC?
;protected:MLfXgJ:=N5X…Åv{-EÇ@F
;protected:QUYNmPBBPd]:”s}ç#7ÉD8
;protected:kJjQUTH<Q>>‘psì)?àLQ
;protected:ZIYZ[_69M==Êfçz&=çKR
;protected:[MZWQe<AR=F’e|É,H{<;
;protected:ROmPn88G›M[`J,LCpPQC
;protected:”Y\VQ.M][W7c
;protected:À`UbXI-h^PbY_7\
;protected:Ê[TdWc-0É><
;protected:‡PVaR#_BnLH=Aa
;protected:◊[SbbH>JPbRNA
;protected:»X]b^#HL^J`2H\
;protected:ŒZd`fT$MLTeKD
;protected:ÿX[cF+OMjJI=8Z
;protected:ÊNk[]S5KP`KNA
;protected: kXe\b,>2B
;protected:÷_mE^Q,DcYl1]
;protected:’bYeeJ,_GkYQA
;protected:”N`F+^OdD[S86
;protected:ÊC_K&]XVPbL8?
;protected: `]UcN,aEX^NI/>
;protected:”SRrP<KR\d\B@^Q]Q
;protected:Ê\dRWc-0É?DE4
;protected:œX[YuG<YKZeL?
;protected:÷Q[aYd)cUX\O1
;protected:”P_^#WNXDrIH8
;protected:ŒOXP/^GXLVf5C
;protected:ÿM`SSN.`]PWM=/N,P
;protected:ÕM\iY/TP[ZTQ;\Q^WU
;protected:»MaR8SJWMWf-O
;protected:ÕHP[*_QPM_JJ=
;protected:◊R_R`C+bQeSI<83I4
;protected:‰LUad*UZS[]5PVPcVY
;protected:SLZ]^K5TL_Nj;‰RUcaa/>|<B
;protected: _WSgQ,aEX^NH/M
;protected:”YRtMs%R\l*UZS[]5PVPcV`NBWS
;protected:‘YGKbR#rFiUH=AP
;protected:◊[SbWY>QXWS,SLZ]^K5TL_NrB^QK
;protected:’W^UaG,^V_]dc7O
;protected:’AORXo#7É<4
;protected:ÊNk[]S5ZRZE`S
;protected: gWRV+`RM[P<DZ
;protected:œNMOj!bQU\g=A[E_VV_K[U
;protected:”M[DbT,YDYRN5JG
;protected:‰GZSh]/OE^RDN5F
;protected:ÿ]QaLb.<ê37
;protected:”YRtXb%GNgQQE
;protected:ÃYZXd)PQ]SO67e
;protected:‘kXIbR#_BnLH?Aa
;protected:◊PWR+RaUPdS8@
;protected:»MQR8SJWMWf-P
;protected:ÕHa[]b.W`LVs\;j
;protected:”S\TZ.RdRV]?5pO`Q
;protected:Œ_Z^[e$<É2N
;protected:O[_Z^@2]\Pd=œN[Pd!]FXTWA;e
;protected:ÃYZXuO/dPY]B<
;protected:÷UfFM+`HkQ^62d
;protected:›KSR[R+C_[VR=8S
;protected:»MbRkF'^`DrVo1`
;protected:’^XRT$MLTeK@<Q
;protected:‘OTQaO8V[L`Xq-v
;protected:ÕO[XP/OE^RDN5U
;protected:ÿM`SS^._lD[`_/x
;protected:…nJZYl*?Ü4<
;protected:”TpO/QL^TB;:R
;protected:‡UYQ,D_ScG79[
;protected:“a`J,LCpPQB7R
;protected:’IYQRk]'LQ[n-b
;protected:ÕXRiVf.4Ñ;2
;protected:ÊKRV+\PLLbTD6
;protected:œMOI>Q_QGa]6C
;protected:÷K[_Q>\TdQ[c3=
;protected:TXgRY>>P_TgR@’bYeZ[,;zN@
;protected:◊QYPdF+bQeSI;8I
;protected:ÊNk[Rd5V^e$RWQm[BBXM`K_ONdH
;protected:œLPGuG<YKZeL?:J
;protected:‘XQtUf0SUTH+TXgRY>>P_TgYGOaO
;protected:◊PXR^E>\cQ_a`,N
;protected:÷M\GSb,3ñ1M
;protected:ÕS\kaU.TOWCrQ
;protected:◊YYOS _SYhE77c
;protected:ÀaBhQ&SaY^`7>XCqTcQMXR
;protected:»L\PoI'LMUeCM1L
;protected:’XVaT$MLTeKA
;protected:ÿM`SS^.MYUNM</U
;protected:…nJZYl*?Ü4<
;protected:”Om_fV+MNRRPC
;protected:‡PVaR#_BnLHCAa
;protected:◊aYNbH>JPbRN?,b
;protected:÷NkI'[OO_Ud19
;protected:’WMU.TOWCrQ;D
;protected:”NaF^a,kWH_aVJ[
;protected:‰LUad*UZS[]5P[]TX
;protected:‘ZOaT,YDYRN8JX
;protected:‰X[OlP/OE^RDO5f
;protected:ÿM_S [QXYWO7?
;protected:À`Db%VPaKcV0@
;protected:”DrObc+_aA_c_D]
;protected:œR[Wm!bQU\g=A`RPX
;protected: pNc\b,=x;>
;protected:RdRV]?5pO`R@’XY\T$MLTeKF<b
;protected:‘ZOaeR8WLX\EO
;protected:…eSIS5^T[TN<.u
;protected:—PTOcS LO^_E87R
;protected:À`UbXI-h^PbY_7\
;protected:ÊR]SQ,NA]UNH/M
;protected:”NWdTo%YaV^da0f
;protected:”Tc][g+<Ö0;
;protected:÷^jI'LMUeCL1L
;protected:’g\U.EM]I`:;V
;protected:”^_F+OMjJI=8I
;protected:ÊJjHL`o*PS\\7H
;protected:Ê[TdWc-0É><
;protected:‡EJQ,SaM]YN9H
;protected:“QQJ,[EjJcX7@
;protected:’GZb[8VL_RRt4N
;protected:KR\d\B@QM^MfC◊]ZbYW+>ÑH:
;protected:œLZGuG<YKZeL?:J
;protected:‘XQtUf0W[d QZ[gU:=YDqLpFHYZ
;protected:“PRHcQ"rN\`M<9F
;protected:”[[nO^+TLeI<KR\d\B@QM^MrJQ\P
;protected:‘OTQaO8V[L`Xq-_
;protected:ÕGQYVf.4Ñ;3
;protected:ÊV^fbR-PNZMlK
;protected:œTZFd!pJS]W:;e
;protected:ÃOLNj)U\Z[_3=[MkN[LNOc
;protected:…]SJd[*POVSM2JO
;protected:◊SW^S LO^_E8
;protected:”OOpG<FG_\LA
;protected:÷F`QUq)PQ]SO07E
;protected:‘jH[Wc#NyL5
;protected:ŒZd`fT$MLTeKF
;protected:ÿX[cF+OMjJIA8Z
;protected:ÊTqG]S5KP`KN=.u
;protected:—QcQ,]CWO``/:
;protected:”NFd!lHRNiR;B
;protected:ÃN_Hq\/c_MaU^:f
;protected:‡JV_[#dMkTX@G\]RL
;protected:‘XQtO/QL^TB@:c
;protected:‡V\McI>B]WMOF6f
;protected:÷F_Q"nL[Q_T93
;protected:”PO^#WNXDrIH9
;protected:ŒOiPba$__Cr^b<e
;protected:‘TO_],^OVZ^6PSjIN
;protected:’bYeT$MLTeKC<b
;protected:‘`UMeR8DH]SEN-s
;protected:ÕH`[*_QPM_JJ<
;protected:◊RNR-PNZMlK3?
;protected:‘ErGoX&`iKccW8e
;protected: eXc_+RYOZ`?JUUOT
;protected:ÀpFpQ]-EÇ?>
;protected:JXZQp<AbYPU:”Q[eI'LMUeCS1]
;protected:’bYeeJ,_GkYQA
;protected:”U[CQ.`]PWM=/u
;protected:…]IJd[*POVSM2JO
;protected:◊R_R`S+a`YW\^8F
;protected:ÊSaYRd5:á>4
;protected:‘]Td)PQ]SO07T
;protected:‘jUM+MDpH^62S
;protected:›S]QJ_e"_Ng`7R
;protected:’RPbXo#7É<3
;protected:ÊC_K&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀNZ`R>TaYL\k=A
;protected:TP[ZTQ;iU][G
;protected:»MaR8SJWMWf-O
;protected:ÕHP[*_QPM_JJ=
;protected:◊R_R`C+OMjJI;8:
;protected:ÊHkYU-[V^]V?=OgWdcZZR
;protected:»NZ^^#HPdS
;protected:ÊDhWL-VKaUF<
;protected:”Ej[U0LM_GM?
;protected:‘[OYQ,D_ScG8
;protected:’gOcZ[,;zN9
;protected:U\Z[_3=[UfXZZZHX…iT\Yl*?Ü;R
;protected:”Om_fV+MRX[
;protected:÷YgYSb,3ñ9L
;protected:ÕS\kaU.EM]I`9
;protected:◊SW^S LO^_E8
;protected:”OOpG<FG_\LA
;protected:÷VQ_Nu)?à;<
;protected:SLZ]^K5TL_NrB^QKG›W^d[R+RaU
;protected:◊bP`YW+>Ñ^I
;protected:œ]QWjX<5~SZ
;protected:“aSXXb"NÅUS
;protected:”^RTWe,H{MC
;protected:‘UcUh\&=çP?
;protected:÷VQ_Nu)?àP<
;protected:’RPbXo#7ÉO3
;protected:ÊSaYRd5:áF4
;protected:‘]GrUf0;Ñ=0
;protected:T\`J78AFÀkPrK&NZb_:[
;protected:‘MVd\R0^`NT`a8r
;protected:ÀYP`Ou!L}6=
;protected:›W^dJ,LCpPQ@7c
;protected:’MZdc^#ZTSQ
;protected:ÊCoK&NV\VP48B
;protected: kXe\b,>2B9=M
;protected:ÀZ`NZd!]J^]AP
;protected:◊PWR+RaUPdS8@
;protected:»MQR8SJWMWf-P
;protected:ÕHa[]b.EQcRJ@
;protected:◊WZ`\ ^S`aR]<B
;protected:ÀaPiK&NZb_:J
;protected:‘TPaO/QPd],Q
;protected:÷YgYSb,;
;protected:ÊTqG]S5KTfT8b
;protected: `\U0[OYA_V8K
;protected:ÀINR#nDhFZUA>
;protected:◊PXR^U>\cQ_a`,N
;protected:÷SgWV+`VfJbY8AF@
;protected:◊[SbbH>JTh[
;protected:‘_LQ.MYUNM=/d
;protected:…iT\S5KP`KN;.u
;protected:—\_acS LO^_E8
;protected:”OOpG<FG_\L?
;protected:÷Q[aNu)G
;protected:ÿ^aOWQ.M][W7c
;protected:À`Tb%VPaKcV0?
;protected:”DaO/`NXNTS:@
;protected:‡E[Q_V>TpFZbh6R
;protected:÷K[_Q>]bXTRa2??B
;protected:‡PVacI>Ba]V
;protected:’gVU.EM]I`:;V
;protected:”OYRQ.MYUNM=
;protected:ÀkPrK&NZb_:[
;protected:‘MVd\b0^`NT`a8r
;protected:ÀINR#qU]Y[`AM
;protected:◊PWR+RaUPdS8@
;protected:»MQR8SJWMWf-P
;protected:ÕM\iY/aLUQVP=@FZW
;protected:aSSWRl5;<B=ÊNk[L-VOg^0c
;protected:”DqO/`NXNTS:?
;protected:‡EJQ,SaM]YN9I
;protected:“QbJ_N"q]Pd`_9Z
;protected:”U[lR'^TLdUN97CdU
;protected:bVMR_4R:EJ”NPF+a`YW\^8F
;protected:ÊSnK&NV\VP48Q
;protected: p[U0LM_GM?8^
;protected:ÀI^R#nDhFZUA=
;protected:◊PGR+RaUPdS8A
;protected:»OSO^Va+MHvQHK
;protected:ŒTd^^.WTTHr;CAA
;protected:_UIQb>L4=ZW=
;protected:ÊCoK&]XVPbL8>
;protected: `LU0[OYA_V8L
;protected:ÀI_RVa!bULYVQb::
;protected:‘MVd\b0LM_GM?8H
;protected:ÀNZ`R>JjY8AF@^Y
;protected:ÃN^H>YR\L`U,>
;protected:÷N[I'[OO_Ud1:
;protected:’W^UaW,^V_]dc7O
;protected:’GZb[8LU_>7O7kP
;protected:ŒVcMU.EM]I`:;V
;protected:”NaF^Q,kWH_aVJ[
;protected:‰NTP[*POVSM2JO
;protected:◊R^R-PNZMlK3>
;protected:‘EaG<UIYV^W:8
;protected:‘MVd\R0LM_GM>8O
;protected:ÀNZ`R>TaYO\k;E
;protected:WR`=6O?^[E‘OTQa_8VPRZ/U
;protected:…nJZYl*?Ü4<
;protected:”EmVU0LM_GM?8^
;protected:ÀJZYI>B]WMOE6U
;protected:÷MZNH>JPbRN>,Q
;protected:÷NlIZN,VrBpZY9o
;protected:“X\GR+C_[VR;8S
;protected:»]S`dZ';Ñ3N
;protected:TaYO\k;EHÃN^H>O_VWMTS7>
;protected:‘ZWM^_#dQbQGTh6F
;protected:÷VQ_Nu)?àQR
;protected:’CW`R8DH]SEN
;protected:…^YL`h*bWKZ79
;protected:ÊV^fWc-0ÉTR
;protected:‡PVacI>B]WMOE
;protected:“\]ZcQ"_JaWM=
;protected:’RWT,kLNY8I
;protected:ÊSnK&NV\VP48Q
;protected: pNc\b,=xQT
;crypt_stop
; APPEND CODE BEGIN: _routine_ascii_single_
_append_lab_0001:
	MOVLW 0x5A
	MOVWF 0x06A
	BCF 0x069,0
	BSF PCLATH,3
	BCF PCLATH,4
	BTFSS 0x067,7
	GOTO L0004
	BCF 0x067,7
	MOVLW 253
	MOVWF LONG_0
	BSF PCLATH,3
	BCF PCLATH,4
	CALL _append_lab_0010
L0004:
	MOVF 0x065,W
	MOVWF AARGB2
	MOVF 0x066,W
	MOVWF AARGB1
	MOVF 0x067,W
	MOVWF AARGB0
	MOVF 0x068,W
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL INT3232
	MOVF AARGB3,W
	MOVWF R0L
	MOVF AARGB2,W
	MOVWF R0H
	MOVF AARGB1,W
	MOVWF R1L
	MOVF AARGB0,W
	MOVWF R1H
	MOVF R0L,W
	MOVWF AARGB3
	MOVF R0H,W
	MOVWF AARGB2
	MOVF R1L,W
	MOVWF AARGB1
	MOVF R1H,W
	MOVWF AARGB0
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FLO3232
	MOVF AARGB2,W
	MOVWF BARGB2
	MOVF AARGB1,W
	MOVWF BARGB1
	MOVF AARGB0,W
	MOVWF BARGB0
	MOVF AEXP,W
	MOVWF BEXP
	MOVF 0x065,W
	MOVWF AARGB2
	MOVF 0x066,W
	MOVWF AARGB1
	MOVF 0x067,W
	MOVWF AARGB0
	MOVF 0x068,W
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FPS32
	MOVF AARGB2,W
	MOVWF 0x065
	MOVF AARGB1,W
	MOVWF 0x066
	MOVF AARGB0,W
	MOVWF 0x067
	MOVF AEXP,W
	MOVWF 0x068
	CLRF BARGB2
	CLRF BARGB1
	MOVLW 0x7A
	MOVWF BARGB0
	MOVLW 0x88
	MOVWF BEXP
	MOVF 0x065,W
	MOVWF AARGB2
	MOVF 0x066,W
	MOVWF AARGB1
	MOVF 0x067,W
	MOVWF AARGB0
	MOVF 0x068,W
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FPM32
	MOVF AARGB2,W
	MOVWF 0x065
	MOVF AARGB1,W
	MOVWF 0x066
	MOVF AARGB0,W
	MOVWF 0x067
	MOVF AEXP,W
	MOVWF 0x068
	BSF PCLATH,3
	BCF PCLATH,4
	CALL _append_lab_0002
	MOVLW 254
	MOVWF LONG_0
	BSF PCLATH,3
	BCF PCLATH,4
	CALL _append_lab_0010
	BSF 0x069,0
	MOVF 0x065,W
	MOVWF AARGB2
	MOVF 0x066,W
	MOVWF AARGB1
	MOVF 0x067,W
	MOVWF AARGB0
	MOVF 0x068,W
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL INT3232
	MOVF AARGB3,W
	MOVWF R0L
	MOVF AARGB2,W
	MOVWF R0H
	MOVF AARGB1,W
	MOVWF R1L
	MOVF AARGB0,W
	MOVWF R1H
	BSF PCLATH,3
	BCF PCLATH,4
	CALL _append_lab_0006
	RETURN
_append_lab_0002:
	MOVLW 0x40
	MOVWF R2L
	MOVLW 0x42
	MOVWF R2H
	MOVLW 0x0F
	MOVWF R3L
	CLRF R3H
	BSF PCLATH,3
	BCF PCLATH,4
	CALL _append_lab_0009
_append_lab_0003:
	MOVLW 0xA0
	MOVWF R2L
	MOVLW 0x86
	MOVWF R2H
	MOVLW 0x01
	MOVWF R3L
	CLRF R3H
	BSF PCLATH,3
	BCF PCLATH,4
	CALL _append_lab_0009
_append_lab_0004:
	MOVLW 0x10
	MOVWF R2L
	MOVLW 0x27
	MOVWF R2H
	CLRF R3L
	CLRF R3H
	BSF PCLATH,3
	BCF PCLATH,4
	CALL _append_lab_0009
_append_lab_0005:
	MOVLW 0xE8
	MOVWF R2L
	MOVLW 0x03
	MOVWF R2H
	CLRF R3L
	CLRF R3H
	BSF PCLATH,3
	BCF PCLATH,4
	CALL _append_lab_0009
_append_lab_0006:
	MOVLW 0x64
	MOVWF R2L
	CLRF R2H
	CLRF R3L
	CLRF R3H
	BSF PCLATH,3
	BCF PCLATH,4
	CALL _append_lab_0009
_append_lab_0007:
	MOVLW 0x0A
	MOVWF R2L
	CLRF R2H
	CLRF R3L
	CLRF R3H
	BSF PCLATH,3
	BCF PCLATH,4
	CALL _append_lab_0009
_append_lab_0008:
	MOVF R0L,W
	MOVWF LONG_0
	BSF PCLATH,3
	BCF PCLATH,4
	CALL _append_lab_0010
	CLRF INDF
	RETURN
_append_lab_0009:
	BCF PCLATH,3
	BCF PCLATH,4
	CALL LD01
	MOVF LONG_0,W
	BSF PCLATH,3
	BCF PCLATH,4
	BTFSC 0x003,2
	GOTO L0005
	BSF 0x069,0
L0005:
	BSF PCLATH,3
	BCF PCLATH,4
	BTFSS 0x069,0
	GOTO L0006
_append_lab_0010:
	BCF STATUS,IRP
	MOVF 0x06A,W
	MOVWF FSR
	MOVF LONG_0,W
	ADDLW 0x30
	MOVWF INDF
	INCF FSR,f
	MOVF FSR,W
	MOVWF 0x06A
L0006:
	RETURN
; APPEND CODE END.
; User code start
L0003:
	CLRF 0x047
; 1: 'Õ‡ ·‡ÁÂ Ã  Ë ‰‡Ú˜ËÍ‡ MQ-135 ‡Á‡·ÓÚ‡Ú¸ ÒıÂÏÛ Ë ÔÓ¯Ë‚ÍÛ ÛÒÚÓÈÒÚ‚‡,
; 2: 'ÍÓÌÚÓÎËÛ˛˘Â„Ó ÍÓÌˆÂÌÚ‡ˆË˛ —Œ2 ‚ ÔÓÏÂ˘ÂÌËË Ò ˆ‚ÂÚÓ‚ÓÈ ËÌ‰ËÍ‡ˆËÂÈ Ë
; 3: '‚˚‚Ó‰ÓÏ ËÌÙÓÏ‡ˆËË Ì‡ LCD Ë ‚ UART.
; 4: 
; 5: 'PIC16F877A
; 6: 
; 7: Hseropen 9600  'ŒÚÍ˚ÚËÂ ‡ÔÔ‡‡ÚÌÓ„Ó ÔÓÚ‡ UART Ì‡ ÒÍÓÓÒÚË ÔÂÂ‰‡˜Ë ‰‡ÌÌ˚ı 9600
; exact baud rate achieved = 9615.385; bit period = 104µs; baud rate error = .16%
	BSF STATUS,RP0
	MOVLW 0x19
	MOVWF SPBRG
	BSF TRISC,6
	BSF TRISC,7
	MOVLW 0x24
	MOVWF TXSTA
	BCF STATUS,RP0
	MOVLW 0x90
	MOVWF RCSTA
; 8: 
; 9: 'Õ‡ÒÚÓÈÍ‡ LCD ÏÓ‰ÛÎˇ ÔÓ‰ ÔÓÚ˚ ÏËÍÓÍÓÌÚÓÎÎÂ‡
; 10: Define LCD_LINES = 2  ' ÓÎË˜ÂÒÚ‚Ó ÒÚÓÍ ‚ LCD
; 11: Define LCD_CHARS = 16  ' ÓÎË˜ÂÒÚ‚Ó ÒËÏ‚ÓÎÓ‚  ‚ LCD
; 12: Define LCD_BITS = 8  'ÿËÌ‡ ‰‡ÌÌ˚ı 8-ı ·ËÚÌ‡ˇ
; 13: Define LCD_DREG = PORTB  'œÓÚ ‚˚‚Ó‰‡ ‰‡ÌÌ˚ı Ì‡ LCD
; 14: Define LCD_DBIT = 0  'œÂ‚˚Â 4 ‚˚‚Ó‰‡ ÔÓÚ‡
; 15: Define LCD_RSREG = PORTD  'œÓÚ ‚˚‚Ó‰‡ ÍÓÌÚÓÎÎÂ‡ Ì‡ ‚ıÓ‰ RS LCD
; 16: Define LCD_RSBIT = 1  'ÕÓÏÂ ‚˚‚Ó‰‡ ÍÓÌÚÓÎÎÂ‡ Ì‡ ‚ıÓ‰ RS LCD
; 17: Define LCD_EREG = PORTD  'œÓÚ ‚˚‚Ó‰‡ ÍÓÌÚÓÎÎÂ‡ Ì‡ ‚ıÓ‰ E LCD
; 18: Define LCD_EBIT = 3  'ÕÓÏÂ ‚˚‚Ó‰‡ ÍÓÌÚÓÎÎÂ‡ Ì‡ ‚ıÓ‰ E LCD
; 19: Define LCD_RWREG = PORTD  'œÓÚ ‚˚‚Ó‰‡ ÍÓÌÚÓÎÎÂ‡ Ì‡ ‚ıÓ‰ RW LCD
; 20: Define LCD_RWBIT = 2  'ÕÓÏÂ ‚˚‚Ó‰‡ ÍÓÌÚÓÎÎÂ‡ Ì‡ ‚ıÓ‰ RW LCD
; 21: 
; 22: Symbol warning_led = PORTA.1  'œËÒ‚ÓËÏ ‚˚‚Ó‰Û PORTA.1 ËÏˇ Warning_led
; 23: 
; 24: TRISA = %00000001  ' ÓÌÙË„ÛËÓ‚‡ÌËÂ PORTA (‚ıÓ‰˚/‚˚ıÓ‰˚)
	MOVLW 0x01
	BSF STATUS,RP0
	MOVWF TRISA
	BCF STATUS,RP0
; 25: ADCON1 = %00000010  '”ÒÚ‡Ì‡‚ÎË‚‡ÂÏ ‚ÒÂ ‚˚‚Ó‰˚ PORTA Í‡Í ‡Ì‡ÎÓ„Ó‚˚Â
	MOVLW 0x02
	BSF STATUS,RP0
	MOVWF ADCON1
	BCF STATUS,RP0
; 26: 
; 27: Lcdinit 1  'ËÌËˆË‡ÎËÁËÓ‚‡ÎË ÍÓÂÚÍÛ LCD
	BCF PORTD,3
	BCF PORTD,1
	BCF PORTD,2
	BSF STATUS,RP0
	BCF TRISD,3
	BCF TRISD,1
	BCF TRISD,2
	CLRF TRISB
	BCF STATUS,RP0
	MOVLW 0x64
	MOVWF R0L
	CLRF R0H
	BCF PCLATH,3
	BCF PCLATH,4
	CALL W001
	MOVLW 0x33
	CALL LC02
	MOVLW 0x33
	CALL LC02
	MOVLW 0x33
	CALL LC02
	MOVLW 0x38
	CALL LC02
	MOVLW 0x0D
	CALL LC02
	MOVLW 0x01
	CALL LC02
; 28: Lcddefchar 2, %0, %0, %0, %11100, %100, %11100, %10000, %11100  '—ÓÁ‰‡ÌËÂ ÔÓÎ¸ÁÓ‚‡ÚÂÎ¸ÒÍÓ„Ó ÒË‚ÓÎ‡ ‰Îˇ ‚˚‚Ó‰‡ Ì‡ LCD Ò Ë‰ÂÌÚËÙËÍ‡ÚÓÓÏ 2
	BCF PCLATH,3
	BCF PCLATH,4
	MOVLW 0x50
	CALL LC02
	MOVLW 0x00
	CALL LC01
	MOVLW 0x00
	CALL LC01
	MOVLW 0x00
	CALL LC01
	MOVLW 0x1C
	CALL LC01
	MOVLW 0x04
	CALL LC01
	MOVLW 0x1C
	CALL LC01
	MOVLW 0x10
	CALL LC01
	MOVLW 0x1C
	CALL LC01
	MOVLW 0x02
	CALL LC02
; 29: '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
; 30: '------ Fucking constants from mq135 library for arduino ------'
; 31: Const adc_value_max = 1024  'Ã‡ÍÒËÏ‡Î¸ÌÓÂ ÁÌ‡˜ÂÌËÂ ¿÷œ
; 32: Const operating_voltage = 5  'Õ‡ÔˇÊÂÌËÂ ÔËÚ‡ÌËˇ ‰‡Ú˜ËÍ‡
; 33: Const rl_board = 10  'kOm - –ÂÁËÒÚÓ Ì‡„ÛÁÍË Ì‡ ÔÎ‡ÚÂ ‰‡Ú˜ËÍ‡
; 34: Const r_zero = 76.63  'Om - —ÓÔÓÚË‚ÎÂÌËÂ ‰‡Ú˜ËÍ‡ Ì‡ ÓÚÍ˚ÚÓÏ ‚ÓÁ‰ÛıÂ
; 35: 'œ‡‡ÏÂÚ˚ ‰Îˇ ‡ÒÒ˜∏Ú‡ ppm CO2 ÓÚÌÓÒËÚÂÎ¸ÌÓ ÒÓÔÓÚË‚ÎÂÌËˇ ‰‡Ú˜ËÍ‡ (‚˚˜ËÒÎÂÌ˚ ÔÓ „‡ÙËÍ‡Ï ‚ Datasheet)
; 36: Const a = -0.62
; 37: Const b = 1.92
; 38: 'œ‡‡ÏÂÚ˚ ÒıÂÏ˚
; 39: Dim pin_mq135 As Long  '—ÓÁ‰‡ÌËÂ ÔÂÂÏÂÌÌÓÈ ‡Ì‡ÎÓ„Ó‚Ó„Ó ÔËÌ‡ c ‰‡Ú˜ËÍÓÏ
	BSF STATUS,RP0
	CLRF 0x0A0
	CLRF 0x0A1
	CLRF 0x0A2
	CLRF 0x0A3
	BCF STATUS,RP0
; 40: Dim sensor_voltage As Single  '—ÓÁ‰‡ÌËÂ ÔÂÂÏÂÌÌÓÈ ÚÂÍÛ˘Â„Ó Ì‡ÔˇÊÂÌËˇ, ÒÌËÏ‡ÂÏÓ„Ó Ò ‰‡Ú˜ËÍ‡
	CLRF 0x076
	CLRF 0x077
	CLRF 0x078
	CLRF 0x079
; 41: Dim sensor_resistance As Single  '—ÓÁ‰‡ÌËÂ ÔÂÂÏÂÌÌÓÈ ÚÂÍÛ˘Â„Ó ÒÓÔÓÚË‚ÎÂÌËˇ ‰‡Ú˜ËÍ‡
	CLRF 0x072
	CLRF 0x073
	CLRF 0x074
	CLRF 0x075
; 42: Dim concentration_co2 As Single  '—ÓÁ‰‡ÌËÂ ÔÂÂÏÂÌÌÓÈ ÚÂÍÛ˘ÂÈ ÍÓÌˆÂÌÚ‡ˆËË CO2
	CLRF 0x06E
	CLRF 0x06F
	CLRF 0x070
	CLRF 0x071
; 43: Dim qwe As Single
	CLRF 0x07A
	CLRF 0x07B
	CLRF 0x07C
	CLRF 0x07D
; 44: '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
; 45: 
; 46: loop:  '¬ıÓ‰ ‚ ÚÂÎÓ ÔÓ„‡ÏÏ˚
L0001:
; 47: Adcin 0, pin_mq135  '—ÌˇÎË ÁÌ‡˜ÂÌËˇ Ò ‡Ì‡ÎÓ„Ó‚Ó„Ó ÔÓÚ‡ A0
	BSF STATUS,RP0
	BSF ADCON1,ADFM
	BCF ADCON1,ADCS2
	BCF STATUS,RP0
	CLRF R0L
	BCF PCLATH,3
	BCF PCLATH,4
	CALL A001
	BSF STATUS,RP0
	MOVF ADRESL,W
	MOVWF 0x0A0
	BCF STATUS,RP0
	MOVF ADRESH,W
	BSF STATUS,RP0
	MOVWF 0x0A1
	CLRF 0x0A2
	CLRF 0x0A3
	BCF STATUS,RP0
; 48: sensor_voltage = pin_mq135 * (operating_voltage / adc_value_max)  '¬˚˜ËÒÎÂÌËÂ Ì‡ÔˇÊÂÌËˇ, ÔÓÒÚÛÔ‡ÂÏÓ„Ó Ì‡ ÔËÌ An0
	CLRF BARGB2
	CLRF BARGB1
	CLRF BARGB0
	MOVLW 0x89
	MOVWF BEXP
	CLRF AARGB2
	CLRF AARGB1
	MOVLW 0x20
	MOVWF AARGB0
	MOVLW 0x81
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FPD32
	MOVF AARGB2,W
	MOVWF 0x076
	MOVF AARGB1,W
	MOVWF 0x077
	MOVF AARGB0,W
	MOVWF 0x078
	MOVF AEXP,W
	MOVWF 0x079
	MOVF 0x076,W
	MOVWF BARGB2
	MOVF 0x077,W
	MOVWF BARGB1
	MOVF 0x078,W
	MOVWF BARGB0
	MOVF 0x079,W
	MOVWF BEXP
	BSF STATUS,RP0
	MOVF 0x0A0,W
	BCF STATUS,RP0
	MOVWF AARGB3
	BSF STATUS,RP0
	MOVF 0x0A1,W
	BCF STATUS,RP0
	MOVWF AARGB2
	BSF STATUS,RP0
	MOVF 0x0A2,W
	BCF STATUS,RP0
	MOVWF AARGB1
	BSF STATUS,RP0
	MOVF 0x0A3,W
	BCF STATUS,RP0
	MOVWF AARGB0
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FLO3232
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FPM32
	MOVF AARGB2,W
	MOVWF 0x076
	MOVF AARGB1,W
	MOVWF 0x077
	MOVF AARGB0,W
	MOVWF 0x078
	MOVF AEXP,W
	MOVWF 0x079
; 49: sensor_resistance = ((operating_voltage - sensor_voltage) / sensor_voltage) * rl_board  '¬˚˜ËÒÎÂÌËÂ ÒÓÔÓÚË‚ÎÂÌËˇ ‰‡Ú˜ËÍ‡
	MOVF 0x076,W
	MOVWF BARGB2
	MOVF 0x077,W
	MOVWF BARGB1
	MOVF 0x078,W
	MOVWF BARGB0
	MOVF 0x079,W
	MOVWF BEXP
	CLRF AARGB2
	CLRF AARGB1
	MOVLW 0x20
	MOVWF AARGB0
	MOVLW 0x81
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FPS32
	MOVF AARGB2,W
	MOVWF 0x072
	MOVF AARGB1,W
	MOVWF 0x073
	MOVF AARGB0,W
	MOVWF 0x074
	MOVF AEXP,W
	MOVWF 0x075
	MOVF 0x076,W
	MOVWF BARGB2
	MOVF 0x077,W
	MOVWF BARGB1
	MOVF 0x078,W
	MOVWF BARGB0
	MOVF 0x079,W
	MOVWF BEXP
	MOVF 0x072,W
	MOVWF AARGB2
	MOVF 0x073,W
	MOVWF AARGB1
	MOVF 0x074,W
	MOVWF AARGB0
	MOVF 0x075,W
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FPD32
	MOVF AARGB2,W
	MOVWF 0x072
	MOVF AARGB1,W
	MOVWF 0x073
	MOVF AARGB0,W
	MOVWF 0x074
	MOVF AEXP,W
	MOVWF 0x075
	CLRF BARGB2
	CLRF BARGB1
	MOVLW 0x20
	MOVWF BARGB0
	MOVLW 0x82
	MOVWF BEXP
	MOVF 0x072,W
	MOVWF AARGB2
	MOVF 0x073,W
	MOVWF AARGB1
	MOVF 0x074,W
	MOVWF AARGB0
	MOVF 0x075,W
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FPM32
	MOVF AARGB2,W
	MOVWF 0x072
	MOVF AARGB1,W
	MOVWF 0x073
	MOVF AARGB0,W
	MOVWF 0x074
	MOVF AEXP,W
	MOVWF 0x075
; 50: qwe = Log(sensor_resistance / r_zero)
	MOVLW 0x43
	MOVWF BARGB2
	MOVLW 0x19
	MOVWF BARGB1
	MOVLW 0x05
	MOVWF BARGB0
	MOVLW 0x9E
	MOVWF BEXP
	MOVF 0x072,W
	MOVWF AARGB2
	MOVF 0x073,W
	MOVWF AARGB1
	MOVF 0x074,W
	MOVWF AARGB0
	MOVF 0x075,W
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FPD32
	MOVF AARGB2,W
	MOVWF 0x07A
	MOVF AARGB1,W
	MOVWF 0x07B
	MOVF AARGB0,W
	MOVWF 0x07C
	MOVF AEXP,W
	MOVWF 0x07D
	MOVF 0x07A,W
	MOVWF AARGB2
	MOVF 0x07B,W
	MOVWF AARGB1
	MOVF 0x07C,W
	MOVWF AARGB0
	MOVF 0x07D,W
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL LOG32
	MOVF AARGB2,W
	MOVWF 0x07A
	MOVF AARGB1,W
	MOVWF 0x07B
	MOVF AARGB0,W
	MOVWF 0x07C
	MOVF AEXP,W
	MOVWF 0x07D
; 51: concentration_co2 = Exp((qwe - b) / a)  '¬˚˜ËÒÎÂÌËÂ ÍÓÌˆÂÌÚ‡ˆËË CO2
	MOVLW 0x85
	MOVWF BARGB2
	MOVLW 0xEB
	MOVWF BARGB1
	MOVLW 0x7E
	MOVWF BARGB0
	MOVLW 0x9D
	MOVWF BEXP
	MOVF 0x07A,W
	MOVWF AARGB2
	MOVF 0x07B,W
	MOVWF AARGB1
	MOVF 0x07C,W
	MOVWF AARGB0
	MOVF 0x07D,W
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FPS32
	MOVF AARGB2,W
	MOVWF 0x06E
	MOVF AARGB1,W
	MOVWF 0x06F
	MOVF AARGB0,W
	MOVWF 0x070
	MOVF AEXP,W
	MOVWF 0x071
	MOVLW 0x71
	MOVWF BARGB2
	MOVLW 0x3D
	MOVWF BARGB1
	MOVLW 0x7D
	MOVWF BARGB0
	MOVLW 0x9D
	MOVWF BEXP
	MOVF 0x06E,W
	MOVWF AARGB2
	MOVF 0x06F,W
	MOVWF AARGB1
	MOVF 0x070,W
	MOVWF AARGB0
	MOVF 0x071,W
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL FPD32
	MOVF AARGB2,W
	MOVWF 0x06E
	MOVF AARGB1,W
	MOVWF 0x06F
	MOVF AARGB0,W
	MOVWF 0x070
	MOVF AEXP,W
	MOVWF 0x071
	MOVF 0x06E,W
	MOVWF AARGB2
	MOVF 0x06F,W
	MOVWF AARGB1
	MOVF 0x070,W
	MOVWF AARGB0
	MOVF 0x071,W
	MOVWF AEXP
	BSF PCLATH,3
	BCF PCLATH,4
	CALL EXP32
	MOVF AARGB2,W
	MOVWF 0x06E
	MOVF AARGB1,W
	MOVWF 0x06F
	MOVF AARGB0,W
	MOVWF 0x070
	MOVF AEXP,W
	MOVWF 0x071
; 52: 
; 53: Hserout "Concentration CO2: ", #concentration_co2, CrLf  'ŒÚÔ‡‚Í‡ ÁÌ‡˜ÂÌËˇ ÍÓÌˆÂÌÚ‡ˆËË ‚ ‡ÔÔ‡‡ÚÌ˚È ÔÓÚ UART
	BCF PCLATH,3
	BCF PCLATH,4
	MOVLW 0x43
	CALL HS01
	MOVLW 0x6F
	CALL HS01
	MOVLW 0x6E
	CALL HS01
	MOVLW 0x63
	CALL HS01
	MOVLW 0x65
	CALL HS01
	MOVLW 0x6E
	CALL HS01
	MOVLW 0x74
	CALL HS01
	MOVLW 0x72
	CALL HS01
	MOVLW 0x61
	CALL HS01
	MOVLW 0x74
	CALL HS01
	MOVLW 0x69
	CALL HS01
	MOVLW 0x6F
	CALL HS01
	MOVLW 0x6E
	CALL HS01
	MOVLW 0x20
	CALL HS01
	MOVLW 0x43
	CALL HS01
	MOVLW 0x4F
	CALL HS01
	MOVLW 0x32
	CALL HS01
	MOVLW 0x3A
	CALL HS01
	MOVLW 0x20
	CALL HS01
	MOVF 0x06E,W
	MOVWF 0x065
	MOVF 0x06F,W
	MOVWF 0x066
	MOVF 0x070,W
	MOVWF 0x067
	MOVF 0x071,W
	MOVWF 0x068
	CALL _append_lab_0001
	BCF PCLATH,3
	BCF PCLATH,4
	CALL HS21
	MOVLW 0x0D
	CALL HS01
	MOVLW 0x0A
	CALL HS01
; 54: Serout PORTC.0, 9600, "Concentration CO2: ", #concentration_co2, CrLf  'ŒÚÔ‡‚Í‡ ÁÌ‡˜ÂÌËˇ ÍÓÌˆÂÌÚ‡ˆËË ‚ ÔÓ„‡ÏÏÌ˚È ÔÓÚ UART
; exact baud rate achieved = 9708.738; bit period = 103µs; baud rate error = 1.13%
	MOVLW 0x1B
	MOVWF SO_INTL
	BSF STATUS,RP0
	BCF TRISC,0
	BCF STATUS,RP0
	BSF PORTC,0
	MOVLW 0x07
	MOVWF SO_PORT
	MOVLW 0x01
	MOVWF SO_BIT
	BCF PCLATH,3
	BCF PCLATH,4
	MOVLW 0x43
	CALL SO01
	MOVLW 0x6F
	CALL SO01
	MOVLW 0x6E
	CALL SO01
	MOVLW 0x63
	CALL SO01
	MOVLW 0x65
	CALL SO01
	MOVLW 0x6E
	CALL SO01
	MOVLW 0x74
	CALL SO01
	MOVLW 0x72
	CALL SO01
	MOVLW 0x61
	CALL SO01
	MOVLW 0x74
	CALL SO01
	MOVLW 0x69
	CALL SO01
	MOVLW 0x6F
	CALL SO01
	MOVLW 0x6E
	CALL SO01
	MOVLW 0x20
	CALL SO01
	MOVLW 0x43
	CALL SO01
	MOVLW 0x4F
	CALL SO01
	MOVLW 0x32
	CALL SO01
	MOVLW 0x3A
	CALL SO01
	MOVLW 0x20
	CALL SO01
	MOVF 0x06E,W
	MOVWF 0x065
	MOVF 0x06F,W
	MOVWF 0x066
	MOVF 0x070,W
	MOVWF 0x067
	MOVF 0x071,W
	MOVWF 0x068
	CALL _append_lab_0001
	BCF PCLATH,3
	BCF PCLATH,4
	CALL SO21
	MOVLW 0x0D
	CALL SO01
	MOVLW 0x0A
	CALL SO01
; 55: 
; 56: Lcdout "   Conc. CO", 2, ": "  '¬˚‚Ó‰ ÔÂ‚ÓÈ ÒÚÓ˜ÍË Ì‡ LCD, Á‰Ò¸ 2 - Á‡‡ÌÂÂ ÒÓÁ‰‡ÌÌ˚È ÒËÏ‚ÓÎ
	BCF PCLATH,3
	BCF PCLATH,4
	MOVLW 0x20
	CALL LC01
	MOVLW 0x20
	CALL LC01
	MOVLW 0x20
	CALL LC01
	MOVLW 0x43
	CALL LC01
	MOVLW 0x6F
	CALL LC01
	MOVLW 0x6E
	CALL LC01
	MOVLW 0x63
	CALL LC01
	MOVLW 0x2E
	CALL LC01
	MOVLW 0x20
	CALL LC01
	MOVLW 0x43
	CALL LC01
	MOVLW 0x4F
	CALL LC01
	MOVLW 0x02
	CALL LC01
	MOVLW 0x3A
	CALL LC01
	MOVLW 0x20
	CALL LC01
; 57: Lcdcmdout LcdLine2Home  '»ÌËˆË‡ÎËÁËÓ‚‡ÎË ÍÓÂÚÍÛ Ì‡ ‚ÚÓÛ˛ ÒÚÓÍÛ LCD
	BCF PCLATH,3
	BCF PCLATH,4
	MOVLW 0xC0
	CALL LC02
; 58: Lcdout #concentration_co2, " ppm"
	BSF PCLATH,3
	BCF PCLATH,4
	MOVF 0x06E,W
	MOVWF 0x065
	MOVF 0x06F,W
	MOVWF 0x066
	MOVF 0x070,W
	MOVWF 0x067
	MOVF 0x071,W
	MOVWF 0x068
	CALL _append_lab_0001
	BCF PCLATH,3
	BCF PCLATH,4
	CALL LC21
	MOVLW 0x20
	CALL LC01
	MOVLW 0x70
	CALL LC01
	MOVLW 0x70
	CALL LC01
	MOVLW 0x6D
	CALL LC01
; 59: 
; 60: If concentration_co2 > 1000 Then  '”ÒÚ‡Ì‡‚ÎË‚‡ÂÏ ÛÒÎÓ‚ËÂ, ÔÓ ÒÚ‡ÚËÒÚË˜ÂÒÍËÏ ‰‡ÌÌ˚Ï ‰ÓÔÛÒÚËÏ‡ˇ ÍÓÌˆÂÌÚ‡ˆËˇ CO2 ‚ ‚ÓÁ‰ÛıÂ ÌÂ ‰ÓÎÊÌ‡ ÔÂ‚˚¯‡Ú¸ 1000 ppm
	MOVF 0x06E,W
	MOVWF BARGB2
	MOVF 0x06F,W
	MOVWF BARGB1
	MOVF 0x070,W
	MOVWF BARGB0
	MOVF 0x071,W
	MOVWF BEXP
	CLRF AARGB2
	CLRF AARGB1
	MOVLW 0x7A
	MOVWF AARGB0
	MOVLW 0x88
	MOVWF AEXP
	BCF PCLATH,3
	BCF PCLATH,4
	CALL TALTB32
	ANDLW 0x01
	BSF PCLATH,3
	BCF PCLATH,4
	BTFSC STATUS,Z
	GOTO L0007
; 61: warning_led = 1  'œÓ‰‡˜‡ ÔËÚ‡ÌËˇ Ì‡ ÔÓÚ ÒÓ Ò‚ÂÚÓ‰ËÓ‰ÓÏ
	BSF 0x005,1
; 62: Hserout "œ–≈¬€ÿ≈Õ»≈ ƒŒœ”—“»ÃŒ…  ŒÕ÷≈Õ“–¿÷»» CO2!!!", CrLf  'ŒÚÔ‡‚Í‡ ÁÌ‡˜ÂÌËˇ ÍÓÌˆÂÌÚ‡ˆËË ‚ ‡ÔÔ‡‡ÚÌ˚È ÔÓÚ UART
	BCF PCLATH,3
	BCF PCLATH,4
	MOVLW 0xCF
	CALL HS01
	MOVLW 0xD0
	CALL HS01
	MOVLW 0xC5
	CALL HS01
	MOVLW 0xC2
	CALL HS01
	MOVLW 0xDB
	CALL HS01
	MOVLW 0xD8
	CALL HS01
	MOVLW 0xC5
	CALL HS01
	MOVLW 0xCD
	CALL HS01
	MOVLW 0xC8
	CALL HS01
	MOVLW 0xC5
	CALL HS01
	MOVLW 0x20
	CALL HS01
	MOVLW 0xC4
	CALL HS01
	MOVLW 0xCE
	CALL HS01
	MOVLW 0xCF
	CALL HS01
	MOVLW 0xD3
	CALL HS01
	MOVLW 0xD1
	CALL HS01
	MOVLW 0xD2
	CALL HS01
	MOVLW 0xC8
	CALL HS01
	MOVLW 0xCC
	CALL HS01
	MOVLW 0xCE
	CALL HS01
	MOVLW 0xC9
	CALL HS01
	MOVLW 0x20
	CALL HS01
	MOVLW 0xCA
	CALL HS01
	MOVLW 0xCE
	CALL HS01
	MOVLW 0xCD
	CALL HS01
	MOVLW 0xD6
	CALL HS01
	MOVLW 0xC5
	CALL HS01
	MOVLW 0xCD
	CALL HS01
	MOVLW 0xD2
	CALL HS01
	MOVLW 0xD0
	CALL HS01
	MOVLW 0xC0
	CALL HS01
	MOVLW 0xD6
	CALL HS01
	MOVLW 0xC8
	CALL HS01
	MOVLW 0xC8
	CALL HS01
	MOVLW 0x20
	CALL HS01
	MOVLW 0x43
	CALL HS01
	MOVLW 0x4F
	CALL HS01
	MOVLW 0x32
	CALL HS01
	MOVLW 0x21
	CALL HS01
	MOVLW 0x21
	CALL HS01
	MOVLW 0x21
	CALL HS01
	MOVLW 0x0D
	CALL HS01
	MOVLW 0x0A
	CALL HS01
; 63: Serout PORTC.0, 9600, "œ–≈¬€ÿ≈Õ»≈ ƒŒœ”—“»ÃŒ…  ŒÕ÷≈Õ“–¿÷»» CO2!!!", CrLf  'ŒÚÔ‡‚Í‡ ÁÌ‡˜ÂÌËˇ ÍÓÌˆÂÌÚ‡ˆËË ‚ ÔÓ„‡ÏÏÌ˚È ÔÓÚ UART
; exact baud rate achieved = 9708.738; bit period = 103µs; baud rate error = 1.13%
	MOVLW 0x1B
	MOVWF SO_INTL
	BSF STATUS,RP0
	BCF TRISC,0
	BCF STATUS,RP0
	BSF PORTC,0
	MOVLW 0x07
	MOVWF SO_PORT
	MOVLW 0x01
	MOVWF SO_BIT
	BCF PCLATH,3
	BCF PCLATH,4
	MOVLW 0xCF
	CALL SO01
	MOVLW 0xD0
	CALL SO01
	MOVLW 0xC5
	CALL SO01
	MOVLW 0xC2
	CALL SO01
	MOVLW 0xDB
	CALL SO01
	MOVLW 0xD8
	CALL SO01
	MOVLW 0xC5
	CALL SO01
	MOVLW 0xCD
	CALL SO01
	MOVLW 0xC8
	CALL SO01
	MOVLW 0xC5
	CALL SO01
	MOVLW 0x20
	CALL SO01
	MOVLW 0xC4
	CALL SO01
	MOVLW 0xCE
	CALL SO01
	MOVLW 0xCF
	CALL SO01
	MOVLW 0xD3
	CALL SO01
	MOVLW 0xD1
	CALL SO01
	MOVLW 0xD2
	CALL SO01
	MOVLW 0xC8
	CALL SO01
	MOVLW 0xCC
	CALL SO01
	MOVLW 0xCE
	CALL SO01
	MOVLW 0xC9
	CALL SO01
	MOVLW 0x20
	CALL SO01
	MOVLW 0xCA
	CALL SO01
	MOVLW 0xCE
	CALL SO01
	MOVLW 0xCD
	CALL SO01
	MOVLW 0xD6
	CALL SO01
	MOVLW 0xC5
	CALL SO01
	MOVLW 0xCD
	CALL SO01
	MOVLW 0xD2
	CALL SO01
	MOVLW 0xD0
	CALL SO01
	MOVLW 0xC0
	CALL SO01
	MOVLW 0xD6
	CALL SO01
	MOVLW 0xC8
	CALL SO01
	MOVLW 0xC8
	CALL SO01
	MOVLW 0x20
	CALL SO01
	MOVLW 0x43
	CALL SO01
	MOVLW 0x4F
	CALL SO01
	MOVLW 0x32
	CALL SO01
	MOVLW 0x21
	CALL SO01
	MOVLW 0x21
	CALL SO01
	MOVLW 0x21
	CALL SO01
	MOVLW 0x0D
	CALL SO01
	MOVLW 0x0A
	CALL SO01
; 64: Else
	BSF PCLATH,3
	BCF PCLATH,4
	GOTO L0008
L0007:
; 65: warning_led = 0  '¬˚ÍÎ˛˜ÂÌËÂ Ò‚ÂÚÓ‰ËÓ‰‡
	BCF 0x005,1
; 66: Endif
L0008:
; 67: 
; 68: loopend:
L0002:
; 69: 
; 70: WaitMs 100
	MOVLW 0x64
	MOVWF R0L
	CLRF R0H
	BCF PCLATH,3
	BCF PCLATH,4
	CALL W001
; 71: Lcdcmdout LcdClear  'Œ˜ËÒÚÍ‡ LCD
	BCF PCLATH,3
	BCF PCLATH,4
	MOVLW 0x01
	CALL LC02
; 72: 
; 73: Goto loop  '¬ÓÁ‚‡˘ÂÌËÂ ‚ Ì‡˜‡ÎÓ ÚÂÎ‡ ÔÓ„‡ÏÏ˚
	BSF PCLATH,3
	BCF PCLATH,4
	GOTO L0001
; End of user code
	BSF PCLATH,3
	BCF PCLATH,4
L0009:	GOTO L0009
; End of listing
	END
