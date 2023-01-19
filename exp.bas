10 REM ------------------------------------------------------------------------
20 REM --------------------------- EL EXPLORADOR ------------------------------
30 REM ---------------------------- ESTEBAN H.N. ------------------------------
40 REM ------------- LICENSE GPLv3 (SEE AT THE END OF THE FILE) ---------------
50 ac(1)=1000:ac(2)=1000:ac(3)=1000:ac(4)=1000:ac(5)=1000
60 DIM d$(14)
70 GOSUB 4770
80 pr=1
90 color2=17
100 ENV 1,10,-1,5
110 SYMBOL AFTER 100
120 SYMBOL 127,0,0,16,24,60,112,96,128
130 SYMBOL 128,5,15,10,6,0,0,0,0
140 SYMBOL 129,0,0,60,52,44,44,0,0
150 SYMBOL 130,0,60,66,74,82,82,60,102
160 SYMBOL 131,0,66,36,24,90,165,66,0
170 SYMBOL 132,0,60,126,90,126,36,24
180 SYMBOL 133,0,0,0,36,0,0,0,0
190 SYMBOL 134,0,0,0,0,0,24,0,0
200 SYMBOL 135,255,129,165,189,189,165,129,255
210 SYMBOL 136,255,153,165,219,219,165,153,255
220 SYMBOL 143,126,251,223,255,191,253,247,126
230 SYMBOL 144,126,251,223,255,191,253,126,0
240 SYMBOL 145,255,255,255,255,255,255,255,255
250 SYMBOL 226,6,8,60,94,126,126,126,60
260 SYMBOL 227,0,0,0,32,0,0,0,0
270 SYMBOL 248,0,60,60,24,126,24,36,36
280 SYMBOL 224,60,90,90,126,195,231,255,219
290 SYMBOL 225,60,90,90,126,231,255,255,219
300 SYMBOL 237,0,0,204,236,240,224,224,224
310 SYMBOL 238,255,129,153,189,189,153,129,255
320 SYMBOL 239,0,0,192,224,240,236,236,224
330 SYMBOL 240,0,0,51,55,15,7,7,7
340 SYMBOL 241,0,0,3,7,15,55,55,7
350 SYMBOL 242,96,144,144,96,0,240,0,0
360 puntos=1
370 REM ---------------------------- INICIO -----------------------------------
380 punt=punt+tiempo
390 salto=0
400 MODE 0:BORDER color,17:PAPER 0:INK 0,0:INK 1,color,17:INK 2,24:INK 3,20:INK 5,color,17:INK 6,26:INK 7,15:INK 8,11:PEN 1:SPEED INK 200,25
410 REM ---------------------- INICILIZA VARIABLES ----------------------------
420 LOCATE 1,25
430 FOR f=1 TO 27:PRINT:NEXT f
440 IF color2>26 THEN color2=17
450 IF a$="2" THEN color=0
460 IF a$="1" THEN color=color2
470 INK 1,color,color2:INK 5,color,color2:BORDER color,color2
480 mu$=CHR$(144)
490 pant=1:objeto=0
500 x=2:y=3
510 fx=19:fy=3
520 iz=1:de=1:ab=1:ar=1
530 iz2=1:de2=1:ab2=1:ar2=1
540 ob1=9:ob2=3
550 ob3=16:ob4=5
560 ob5=2:ob6=12
570 ob7=14:ob8=12
580 ob9=ob7:ob10=23
590 s1=0:s2=0
600 s3=0:s4=0
610 s5=0:s6=0
620 s7=0:s8=0
630 s9=0:s10=0
640 muro=0
650 b2=0:bm=0:bm2=0:bm3=0
660 c1=0:c2=0
670 p1=0:p2=0
680 pl1=0:pl2=0
690 poho1=0:poho2=0
700 ov=0:oj=0
710 tiempo=500
720 tie=500
730 IF vida=1 THEN 750
740 vidas=3
750 REM ------------------------- DIBUJA EL BORDE -----------------------------
760 GOSUB 1590
770 REM ----------------------- DIBUJA EL LABERINTO ---------------------------
780 GOSUB 1860
790 REM ------------------------- DIBUJA OBJETOS ------------------------------
800 GOSUB 2240
810 GOSUB 1720
820 REM ----------------------- INSTALA MARCADORES ----------------------------
830 GOSUB 2150
840 REM ------------------------ COMIENZA EL JUEGO ----------------------------
850 PEN 2
860 GOSUB 1050
870 IF pant=3 AND x=11 AND y=13 THEN salto=salto+1:GOTO 410
880 REM -------------------------- LEVANTA MURO -------------------------------
890 IF objeto=5 AND x=2+p1 AND y=23+p2 THEN GOSUB 2510
900 REM ---------------------------- BAJA MURO --------------------------------
910 IF muro=1 AND tie<temp-(47+t) THEN GOSUB 2720
920 REM ------------------------- BORRA EL ANTIGUO ----------------------------
930 GOSUB 1500
940 REM ------------------------- LIMITA AL MU\ECO ----------------------------
950 GOSUB 1720
960 REM ------------------------- DETECTA OBJETOS -----------------------------
970 GOSUB 2440
980 REM -------------------------- MUEVE FANTASMA -----------------------------
990 GOSUB 1230
1000 REM ----------------------- BORRA ANTI.FANTASMA --------------------------
1010 GOSUB 2920
1020 REM ------------------------ LIMITA FANTASMA -----------------------------
1030 GOSUB 3070
1040 GOTO 840
1050 REM ---------------------- CUERPO DEL PROGRAMA ---------------------------
1060 tiempo=tiempo-1:tie=tie-1
1070 IF tiempo=0 THEN vidas=vidas-1:tiempo=500
1080 IF pant=1 AND x>19 THEN 3620
1090 IF pant=2 AND x>19 THEN 4210
1100 IF vidas=0 THEN GOSUB 3350
1110 IF x=fx AND y=fy THEN GOSUB 3210
1120 REM ----------------------- MUEVE AL HOMBRE ------------------------------
1130 a=x:b=y
1140 IF pr1=1 THEN 1160
1150 IF INKEY(8)=0 THEN x=x-1:borra=1:iz=1:RETURN
1160 IF pr2=1 THEN 1180
1170 IF INKEY(1)=0 THEN x=x+1:borra=1:de=1:RETURN
1180 IF pr3=1 THEN 1200
1190 IF INKEY(2)=0 THEN y=y+1:borra=1:ab=1:RETURN
1200 IF pr4=1 THEN 1220
1210 IF INKEY(0)=0 THEN y=y-1:borra=1:ar=1:RETURN
1220 RETURN
1230 REM ----------------------- MUEVE AL FANTASMA ----------------------------
1240 fa=fx:fb=fy
1250 IF pant=3 THEN 1310
1260 IF famur=1 THEN famuro=1
1270 IF fa1>3 THEN fx=fx-1:borrad=1:GOSUB 1450:RETURN
1280 IF fa2>3 THEN fx=fx+1:borrad=1:GOSUB 1450:RETURN
1290 IF fa3>3 THEN fy=fy+1:borrad=1:GOSUB 1450:RETURN
1300 IF fa4>3 THEN fy=fy-1:borrad=1:GOSUB 1450:RETURN
1310 IF tiempo=0 THEN vidas=vidas-1:tiempo=500
1320 IF velo>=2 THEN 1350
1330 IF salto>=5 THEN 1360
1340 IF salto>=1 THEN salto2=INT(RND*2):IF salto2=0 THEN 1360 ELSE 1350
1350 IF fan=1 THEN fan=0:GOTO 1360:ELSE fan=1:RETURN
1360 IF pf1=1 THEN fa1=fa1+1:GOTO 1380
1370 IF fx>x THEN fx=fx-1:borrad=1:iz2=1:fa1=0:RETURN
1380 IF pf2=1 THEN fa2=fa2+1:GOTO 1400
1390 IF fx<x THEN fx=fx+1:borrad=1:de2=1:fa2=0:RETURN
1400 IF pf3=1 THEN fa3=fa3+1:GOTO 1420
1410 IF fy<y THEN fy=fy+1:borrad=1:ab2=1:fa3=0:RETURN
1420 IF pf4=1 THEN fa4=fa4+1:GOTO 1440
1430 IF fy>y THEN fy=fy-1:borrad=1:ar2=1:fa4=0:RETURN
1440 RETURN
1450 REM ----------------------------------------------------------------------
1460 fa1=0:fa2=0:fa3=0:fa4=0
1470 SOUND 1,0,10,15,1,,1
1480 famur=1
1490 RETURN
1500 REM ------------------------ BORRA AL HOMBRE -----------------------------
1510 PEN 2
1520 LOCATE x,y:PRINT CHR$(248)
1530 IF borra=1 THEN PEN 0:LOCATE a,b:PRINT CHR$(224):borra=0:punt=punt+10:SOUND 1,500,2,15
1540 IF punt>((5000*(puntos^2))-10) THEN vidas=vidas+1:puntos=puntos+1
1550 PEN 5
1560 IF a=2+p1 AND b=23+p2 AND muro=1 THEN LOCATE 2+p1,23+p2:PRINT CHR$(239+pl2):RETURN
1570 IF a=2+p1 AND b=23+p2 THEN LOCATE 2+p1,23+p2:PRINT CHR$(237+pl1)
1580 RETURN
1590 REM ------------------------ DIBUJA EL MARGEN ----------------------------
1600 PEN 1
1610 LOCATE 1,2
1620 FOR n=1 TO 20
1630 LOCATE n,2:PRINT CHR$(238+b2);
1640 LOCATE n,24:PRINT CHR$(238+b2);
1650 NEXT n
1660 FOR n=2 TO 23
1670 LOCATE 1,n:PRINT CHR$(238+b2)
1680 LOCATE 20,n:PRINT CHR$(238+b2)
1690 NEXT n
1700 PEN 2
1710 RETURN
1720 REM ------------------------ LIMITA AL HOMBRE ----------------------------
1730 te1=(x*32)-48
1740 te2=400-((y*16)-8)
1750 IF iz=1 THEN pr1=TEST(te1,te2) ELSE pr1=0:iz=0
1760 te3=(x*32)+16
1770 te4=te2
1780 IF de=1 THEN pr2=TEST(te3,te4) ELSE pr2=0:de=0
1790 te5=(x*32)-16
1800 te6=400-((y*16)+8)
1810 IF ab=1 THEN pr3=TEST(te5,te6) ELSE pr3=0:ab=0
1820 te7=te5
1830 te8=400-((y*16)-24)
1840 IF ar=1 THEN pr4=TEST(te7,te8) ELSE pr4=0:ar=0
1850 RETURN
1860 REM ----------------------- DIBUJA EL LABERINTO --------------------------
1870 RESTORE 1930
1880 PEN 1
1890 FOR n=1 TO 172
1900 READ bo1,bo2
1910 LOCATE bo1,bo2:PRINT CHR$(143)
1920 NEXT n
1930 DATA 5,3,10,3,12,3
1940 DATA 2,4,3,4,5,4,7,4,8,4,9,4,10,4,12,4,14,4,15,4,16,4,17,4,18,4
1950 DATA 5,5,9,5,12,5,15,5,18,5
1960 DATA 3,6,4,6,5,6,7,6,11,6,12,6,13,6,15,6,16,6,18,6
1970 DATA 7,7,9,7,13,7,15,7,16,7,18,7
1980 DATA 2,8,3,8,4,8,5,8,6,8,7,8,9,8,11,8,13,8,15,8,16,8,18,8
1990 DATA 2,9,11,9,13,9,18,9
2000 DATA 2,10,4,10,5,10,6,10,7,10,8,10,9,10,10,10,11,10,13,10,14,10,15,10,16,10,17,10,18,10
2010 DATA 6,11,13,11,18,11
2020 DATA 3,12,4,12,6,12,8,12,10,12,11,12,12,12,13,12,15,12,16,12,18,12
2030 DATA 2,13,6,13,8,13,10,13,14,13
2040 DATA 2,14,4,14,5,14,6,14,8,14,10,14,12,14,16,14,17,14,18,14,19,14
2050 DATA 2,15,8,15,10,15,12,15,13,15,14,15,15,15,16,15
2060 DATA 2,16,3,16,4,16,5,16,6,16,7,16,8,16,10,16,12,16,18,16
2070 DATA 10,17,12,17,14,17,15,17,17,17,18,17
2080 DATA 3,18,4,18,5,18,6,18,7,18,8,18,9,18,10,18,14,18,18,18
2090 DATA 3,19,9,19,12,19,13,19,14,19,16,19,18,19,19,19
2100 DATA 3,20,5,20,6,20,7,20,9,20,13,20,14,20,16,20
2110 DATA 3,21,7,21,9,21,11,21,14,21,16,21,18,21,19,21
2120 DATA 3,22,4,22,5,22,7,22,9,22,11,22,12,22,14,22,16,22,19,22
2130 DATA 7,23,11,23,12,23,16,23,17,23
2140 RETURN
2150 REM ---------------------- INSTALA MARCADORES ----------------------------
2160 PEN 3
2170 LOCATE 1,1:PRINT"TIEMPO"
2180 LOCATE 12,1:PRINT"VIDAS:"
2190 LOCATE 1,25:PRINT"PUNTUACION:"
2200 PEN 2
2210 LOCATE 12,25:PRINT punt
2220 LOCATE 17,1:PRINT vidas
2230 RETURN
2240 REM --------------------------- SITUA OBJETOS ----------------------------
2250 PEN 5
2260 a(1)=INT(RND*5)
2270 a(2)=INT(RND*5)
2280 a(3)=INT(RND*5)
2290 a(4)=INT(RND*5)
2300 a(5)=INT(RND*5)
2310 IF a(2)=a(1) THEN a(2)=INT(RND*5):GOTO 2310
2320 IF a(3)=a(2) OR a(3)=a(1) THEN a(3)=INT(RND*5):GOTO 2320
2330 IF a(4)=a(3) OR a(4)=a(2) OR a(4)=a(1) THEN a(4)=INT(RND*5):GOTO 2330
2340 IF a(5)=a(4) OR a(5)=a(3) OR a(5)=a(2) OR a(5)=a(1) THEN a(5)=INT(RND*5):GOTO 2340
2350 oj=oj+1
2360 LOCATE 2+p1,23+p2:PRINT CHR$(237+pl1)
2370 IF a(oj)=0 AND objeto<>5 THEN ov=1:PRINT CHR$(22);CHR$(1):PEN 7:LOCATE 9+s1,3+s2:PRINT CHR$(127):PEN 2:LOCATE 9+s1,3+s2:PRINT CHR$(128):PRINT CHR$(22);CHR$(0)
2380 IF a(oj)=1 THEN ov=2:PRINT CHR$(22);CHR$(1):PEN 7:LOCATE 16+s3,5+s4:PRINT CHR$(129):PEN 2:LOCATE 16+s3,5+s4:PRINT CHR$(130):PRINT CHR$(22);CHR$(0)
2390 IF a(oj)=2 THEN ov=4:PRINT CHR$(22);CHR$(1):PEN 7:LOCATE 14+s5,12+s6:PRINT CHR$(132):PEN 6:LOCATE 14+s5,12+s6:PRINT CHR$(133):PEN 8:LOCATE 14+s5,12+s6:PRINT CHR$(134):PRINT CHR$(22);CHR$(0)
2400 IF a(oj)=3 THEN ov=3:PEN 6:LOCATE 2+s7,12+s8:PRINT CHR$(131)
2410 IF a(oj)=4 THEN ov=5:PRINT CHR$(22);CHR$(1):PEN 2:LOCATE 14+s9,23+s10:PRINT CHR$(227):PEN 8:LOCATE 14+s9,23+s10:PRINT CHR$(226):PRINT CHR$(22);CHR$(0)
2420 LOCATE 7,1:PRINT tiempo
2430 RETURN
2440 REM ------------------------- LOCALIZA OBJETOS ---------------------------
2450 IF x=ob1 AND y=ob2 AND ov=1 THEN punt=punt+100:ob1=0:ob2=0:objeto=objeto+1:SOUND 4,50,0,15,1:GOSUB 2350
2460 IF x=ob3 AND y=ob4 AND ov=2 THEN punt=punt+100:ob3=0:ob4=0:objeto=objeto+1:SOUND 4,50,0,15,1:GOSUB 2350
2470 IF x=ob5 AND y=ob6 AND ov=3 THEN punt=punt+100:ob5=0:ob6=0:objeto=objeto+1:SOUND 4,50,0,15,1:GOSUB 2350
2480 IF x=ob7 AND y=ob8 AND ov=4 THEN punt=punt+100:ob7=0:ob8=0:objeto=objeto+1:SOUND 4,50,0,15,1:GOSUB 2350
2490 IF x=ob9 AND y=ob10 AND ov=5 THEN punt=punt+100:ob9=0:ob10=0:objeto=objeto+1:SOUND 4,50,0,15,1:GOSUB 2350
2500 RETURN
2510 REM -------------------------- SUBE EL MURO ------------------------------
2520 PEN 5
2530 LOCATE 2+p1,23+p2:PRINT CHR$(239+pl2)
2540 IF muro=1 THEN RETURN
2550 PEN 1
2560 TAG
2570 mu1=((19+c1)*32)+2
2580 mu2=400-((22+c2)*16)
2590 temp=tie
2600 IF pant=1 THEN PLOT 19*32,32,0:DRAW 20*32,32,0
2610 IF pant=3 THEN PLOT 11*32,(400-(13*16)),0:DRAW 12*32,(400-(13*16)),0
2620 FOR n=1 TO 15
2630 SOUND 2,25,1,15
2640 FOR ret=1 TO 25:NEXT ret
2650 MOVE mu1,mu2+n,1
2660 PRINT mu$;
2670 NEXT n
2680 TAGOFF
2690 LOCATE 20+bm3,22+bm:PRINT CHR$(143)
2700 muro=1
2710 RETURN
2720 REM --------------------------- BAJA EL MURO -----------------------------
2730 PEN 1
2740 TAG
2750 mu2=400-((21+bm2)*16)
2760 FOR n=1 TO 18
2770 SOUND 2,50,1,15
2780 FOR ret=1 TO 25:NEXT ret
2790 TAG
2800 MOVE mu1,mu2-n,1
2810 PRINT CHR$(145);
2820 NEXT n
2830 TAGOFF
2840 IF pant=1 THEN LOCATE 20,22:PRINT CHR$(143):LOCATE 20,23:PRINT CHR$(143)
2850 IF pant=2 THEN LOCATE 20,12:PRINT CHR$(143):LOCATE 20,13:PRINT CHR$(143)
2860 IF pant=3 THEN LOCATE 12,12:PRINT CHR$(143):LOCATE 12,13:PRINT CHR$(143)
2870 muro=0
2880 PEN 5
2890 LOCATE 2+p1,23+p2:PRINT CHR$(237+pl1)
2900 GOSUB 1720
2910 RETURN
2920 REM ------------------------ BORRA AL FANTASMA ---------------------------
2930 PEN 6
2940 IF fx>19 THEN fx=19:RETURN
2950 IF fx<2 THEN fx=2:RETURN
2960 IF fy>23 THEN fy=23:RETURN
2970 IF fy<3 THEN fy=3:RETURN
2980 LOCATE fx,fy:PRINT CHR$(225)
2990 IF pant=3 OR velo>=2 THEN 3050
3000 IF famur=1 AND famuro=1 THEN PEN 5:LOCATE fa,fb:PRINT CHR$(143):famur=0:famuro=2:RETURN
3010 IF salto2=0 AND salto>=1 THEN 3050
3020 IF salto>=1 THEN famuro=0:GOTO 3050
3030 IF famuro=2 THEN famuro=3:RETURN
3040 IF famuro=3 THEN famuro=0:RETURN
3050 IF borrad=1 THEN PEN 0:LOCATE fa,fb:PRINT CHR$(224):borrad=0
3060 RETURN
3070 REM ------------------------ LIMITA AL FANTASMA --------------------------
3080 te9=(fx*32)-48
3090 te10=400-((fy*16)-8)
3100 IF iz2=1 THEN pf1=TEST(te9,te10) ELSE pf1=0:iz2=0
3110 te11=(fx*32)+16
3120 te12=te10
3130 IF de2=1 THEN pf2=TEST(te11,te12) ELSE pf2=0:de2=0
3140 te13=(fx*32)-16
3150 te14=400-((fy*16)+8)
3160 IF ab2=1 THEN pf3=TEST(te13,te14) ELSE pf3=0:ab2=0
3170 te15=te13
3180 te16=400-((fy*16)-24)
3190 IF ar2=1 THEN pf4=TEST(te15,te16) ELSE pf4=0:ar2=0
3200 RETURN
3210 REM ---------------------- FAN SE COME AL HOMBRE -------------------------
3220 PEN 6
3230 FOR j=1 TO 10
3240 LOCATE x,y:PRINT CHR$(224)
3250 FOR ret=1 TO 100:NEXT ret
3260 LOCATE x,y:PRINT CHR$(225)
3270 FOR ret=1 TO 100:NEXT ret
3280 NEXT j
3290 LOCATE x,y:PRINT CHR$(32)
3300 vidas=vidas-1
3310 IF VIDAS=0 THEN 3350
3320 x=2+poho:y=3+poho2:fx=19:fy=3
3330 GOSUB 1720
3340 GOTO 820
3350 REM ------------------------ TERMINA LA PARTIDA --------------------------
3360 PEN 6
3370 PRINT CHR$(22);CHR$(1)
3380 LOCATE 7,13:PRINT"SE ACABO"
3390 PRINT CHR$(22);CHR$(0)
3400 FOR ret=1 TO 3000:NEXT ret
3410 ac(0)=punt
3420 FOR x=0 TO 5
3430 FOR n=0 TO 5
3440 IF n=5 THEN c=ac(n):d=c:GOTO 3470
3450 IF ac(n)>ac(n+1) THEN 3460 ELSE 3490
3460 c=ac(n):d=ac(n+1)
3470 ac(n)=d
3480 ac(n+1)=c
3490 NEXT n
3500 NEXT x
3510 BORDER 0:MODE 1
3520 LOCATE 11,6:PRINT"MEJORES PUNTUACIONES"
3530 LOCATE 13,9:PRINT"1";CHR$(242);".....";ac(5)
3540 LOCATE 13,11:PRINT"2";CHR$(242);".....";ac(4)
3550 LOCATE 13,13:PRINT"3";CHR$(242);".....";ac(3)
3560 LOCATE 13,15:PRINT"4";CHR$(242);".....";ac(2)
3570 LOCATE 13,17:PRINT"5";CHR$(242);".....";ac(1)
3580 punt=0:vidas=3:tiempo=0
3590 WHILE INKEY(47)=-1:WEND
3600 CLEAR INPUT
3610 GOTO 4770
3620 REM ----------------------------------------------------------------------
3630 punt=punt+tiempo
3640 LOCATE 1,24:FOR n=1 TO 27:PRINT:NEXT n
3650 INK 1,color,color2:INK 5,color,color2:BORDER color,color2
3660 pant=2
3670 oj=0:tie=500:ov=0
3680 t=10
3690 b2=-103
3700 bm=-10
3710 bm2=-10
3720 s1=6:s2=11
3730 s3=-14:s4=-2
3740 s5=5:s6=-5
3750 s7=5:s8=11
3760 s9=-3:s10=0
3770 c1=0:c2=-10
3780 p1=17:p2=0
3790 pl1=3:pl2=2
3800 objeto=0:x=2:y=23:fx=19:fy=3
3810 ob1=15:ob2=14
3820 ob3=2:ob4=3
3830 ob5=7:ob6=23
3840 ob7=19:ob8=7
3850 ob9=11:ob10=23
3860 muro=0
3870 poho1=0:poho2=20
3880 tiempo=501
3890 GOSUB 1590
3900 GOSUB 3920
3910 GOTO 790
3920 REM ----------------------------------------------------------------------
3930 PEN 1
3940 RESTORE 4010
3950 FOR n=1 TO 163
3960 READ l2,l3
3970 LOCATE l2,l3:PRINT CHR$(143)
3980 NEXT n
3990 RETURN
4000 DATA 10,3,14,3
4010 DATA 3,4,4,4,6,4,8,4,10,4,12,4,14,4,16,4,17,4,18,4
4020 DATA 6,5,8,5,10,5,12,5,14,5,16,5
4030 DATA 3,6,4,6,6,6,8,6,10,6,12,6,16,6,18,6,19,6
4040 DATA 8,7,10,7,12,7,14,7,16,7,18,7
4050 DATA 2,8,3,8,4,8,6,8,8,8,12,8,14,8,16,8,18,8
4060 DATA 6,9,10,9,11,9,12,9,14,9,16,9
4070 DATA 3,10,4,10,5,10,6,10,7,10,11,10,16,10,18,10,19,10
4080 DATA 3,11,7,11,9,11,11,11,12,11,13,11,15,11,16,11
4090 DATA 3,12,5,12,7,12,11,12,15,12,18,12
4100 DATA 3,13,5,13,7,13,9,13,11,13,13,13,14,13,15,13,16,13,17,13,18,13
4110 DATA 3,14,5,14,7,14,9,14,11,14,13,14,16,14,18,14
4120 DATA 5,15,7,15,9,15,11,15,15,15,16,15,18,15,19,15
4130 DATA 2,16,3,16,4,16,5,16,7,16,9,16,11,16,12,16,14,16,15,16,16,16,18,16
4140 DATA 7,17,9,17,11,17,12,17,18,17
4150 DATA 3,18,4,18,5,18,6,18,7,18,12,18,14,18,16,18,17,18,18,18
4160 DATA 6,19,7,19,8,19,9,19,10,19,12,19,14,19,16,19
4170 DATA 2,20,3,20,4,20,6,20,7,20,8,20,10,20,12,20,16,20,18,20,19,20
4180 DATA 2,21,8,21,12,21,14,21,16,21
4190 DATA 2,22,4,22,6,22,8,22,10,22,12,22,14,22,16,22,17,22,18,22
4200 DATA 4,23,8,23,12,23
4210 REM ----------------------- TERCERA PANTALLA -----------------------------
4220 punt=punt+tiempo
4230 LOCATE 1,24:FOR n=1 TO 27:PRINT:NEXT n
4240 INK 1,color,color2:INK 5,color,color2:BORDER color,color2
4250 velo=velo+1
4260 pant=3
4270 b2=-102
4280 x=2:y=13
4290 fx=19:fy=3
4300 tiempo=501
4310 tie=500:temp=0
4320 p1=0:p2=0
4330 pl1=0:pl2=0
4340 c1=-8
4350 bm3=-8
4360 objeto=0
4370 muro=0:ov=0:oj=0
4380 ob1=7:ob2=5
4390 ob3=16:ob4=9
4400 ob5=19:ob6=17
4410 ob7=7:ob8=15
4420 ob9=14:ob10=21
4430 s1=-2:s2=2
4440 s3=0:s4=4
4450 s5=-7:s6=3
4460 s7=17:s8=5
4470 s9=0:s10=-2
4480 poho=0:poho2=10
4490 vida=1
4500 GOSUB 1590
4510 GOSUB 4530
4520 GOTO 790
4530 PEN 1
4540 RESTORE 4600
4550 FOR n=1 TO 150
4560 READ l4,l5
4570 LOCATE l4,l5:PRINT CHR$(143)
4580 NEXT n
4590 RETURN
4600 DATA 3,4,4,4,6,4,8,4,10,4,11,4,13,4,15,4,17,4,18,4
4610 DATA 6,5,8,5,10,5,11,5,13,5,15,5
4620 DATA 3,6,4,6,6,6,8,6,10,6,11,6,13,6,15,6,17,6,18,6
4630 DATA 3,8,4,8,6,8,7,8,8,8,10,8,11,8,13,8,14,8,15,8,17,8,18,8
4640 DATA 3,9,4,9,6,9,8,9,13,9,15,9,17,9,18,9
4650 DATA 3,10,4,10,6,10,7,10,8,10,10,10,11,10,13,10,14,10,15,10,17,10,18,10
4660 DATA 3,11,4,11,17,11,18,11
4670 DATA 6,12,7,12,9,12,10,12,11,12,12,12,14,12,15,12
4680 DATA 3,13,4,13,6,13,7,13,9,13,12,13,14,13,15,13,17,13,18,13
4690 DATA 6,14,7,14,9,14,10,14,11,14,12,14,14,14,15,14
4700 DATA 3,15,4,15,17,15,18,15
4710 DATA 3,16,4,16,6,16,7,16,8,16,10,16,11,16,13,16,14,16,15,16,17,16,18,16
4720 DATA 3,17,4,17,6,17,8,17,13,17,15,17,17,17,18,17
4730 DATA 3,18,4,18,6,18,7,18,8,18,10,18,11,18,13,18,14,18,15,18,17,18,18,18
4740 DATA 3,20,4,20,6,20,8,20,10,20,11,20,13,20,15,20,17,20,18,20
4750 DATA 6,21,8,21,10,21,11,21,13,21,15,21
4760 DATA 3,22,4,22,6,22,8,22,10,22,11,22,13,22,15,22,17,22,18,22
4770 REM ----------------------------------------------------------------------
4780 INK 0,0:INK 1,26:BORDER 0:PAPER 0
4790 MODE 1
4800 CLS
4810 IF pr=1 THEN LOCATE 14,7:PRINT "EL  EXPLORADOR":GOTO 4920
4820 a$="EL  EXPLORADOR"
4830 s=LEN(a$)
4840 CLS
4850 FOR n=1 TO s
4860 d$(n)=MID$(a$,n,1)
4870 NEXT n
4880 FOR n=1 TO 14
4890 FOR x=27 TO n STEP -1
4900 LOCATE 13+x,7:PRINT d$(n):LOCATE 13+x+1,7:PRINT" "
4910 NEXT x,n
4920 a$=INKEY$
4930 LOCATE 12,12:PRINT"1-.LABERINTO NORMAL"
4940 LOCATE 12,14:PRINT"2-.LABERINTO INVISIBLE"
4950 IF A$="1" THEN color=17:GOTO 4980
4960 IF A$="2" THEN color=0:GOTO 4980
4970 GOTO 4920
4980 IF pr=0 THEN RETURN ELSE 370
4780 INK 0,0:INK 1,26:BORDER 0:PAPER 0
4790 MODE 1
4800 CLS
4810 IF pr=1 THEN LOCATE 14,7:PRINT "EL  EXPLORADOR":GOTO 4920
4820 a$="EL  EXPLORADOR"
4830 s=LEN(a$)
4840 CLS
4850 FOR n=1 TO s
4860 d$(n)=MID$(a$,n,1)
4870 NEXT n
4880 FOR n=1 TO 14
4890 FOR x=27 TO n STEP -1
4900 LOCATE 13+x,7:PRINT d$(n):LOCATE 13+x+1,7:PRINT" "
4910 NEXT x,n
4920 a$=INKEY$
4930 LOCATE 12,12:PRINT"1-.LABERINTO NORMAL"
4940 LOCATE 12,14:PRINT"2-.LABERINTO INVISIBLE"
4950 IF A$="1" THEN color=17:GOTO 4980
4960 IF A$="2" THEN color=0:GOTO 4980
4970 GOTO 4920
4980 IF pr=0 THEN RETURN ELSE 370
5000 '  ------------------------------------------------------------------------
5010 '  ---------------------------- LICENSE GPLv3 -----------------------------
5020 '  ------------------------------------------------------------------------
5030 '  El Explorador, un juego de laberintos, donde un espectro te perseguira
5040 '  por intrincados pasillos, atravesando muros y dejando un reguero de
5050 '  paredes falsas, mientras, el explorador, recolecta reliquias que le
5060 '  permitiran abrir un pasadizo hacia el siguiente laberinto.
5070 ' 
5080 '  Copyright (C) 1988 @estbhan (Esteban H.N.)
5090 ' 
5100 '  This program is free software: you can redistribute it and/or modify it
5110 '  under the terms of the GNU General Public License as published by the
5120 '  Free Software Foundation, either version 3 of the License, or (at your
5130 '  option) any later version. 
5140 ' 
5150 '  This program is distributed in the hope that it will be useful, but
5160 '  WITHOUT ANY WARRANTY; without even the implied warranty of
5170 '  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
5180 '  GNU General Public License for more details.
5190 '  
5200 '  You should have received a copy of the GNU General Public License along
5210 '  with this program. If not, see <https://www.gnu.org/licenses/>.
5220 '  -----------------------------------------------------------------------



