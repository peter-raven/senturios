
' Captain Sansom's mission til Senturios'
'
'      (C) Peter Ravnholt 1988-89
'
'   En produktion fra RealWare Games!
'
'            (Version 1.2)
'
'
' Turbo Basic Source :


10 screen 0:width 80:cls:print"Indlëser data..."
100 DIM ST$(100),TI$(65),TIP(65),TIV(65),und$(65)
110 dim no(100),sy(100),oe(100),ve(100),op(100),ne(100)
120 open "SDATA1.DAT" for INPUT as #1:FOR R=1 TO 100:input#1,ST$(R),NO(R),SY(R),OE(R),VE(R),OP(R),NE(R):NEXT R:close #1
130 open "SDATA2.DAT" for INPUT as #1:FOR R=1 TO 62:input#1,TI$(R),TIP(R),TIV(R),und$(r):NEXT R:close #1
170 cls:input"Bruger du farveskërm ";svr$:if instr(ucase$(svr$),"N")>0 then gosub 9010 else gosub 9000
180 gosub 10000
200 B1$="Du kan ikke gÜ den vej.":b2$="Det kan du ikke.":b3$="DER ER NOGET I!"
300 KEY OFF:color fg1,bg3,bg3:CLS
350 pl=1:bv=0:sf=0:lk=0:lt=0:saf=0:fvf=0:sc=0 : ' PL=84:tip(9)=255:tip(14)=255:tip(36)=255:tip(37)=18:tip(30)=255
500 CLS:color fg1:PRINT"Du er "+ST$(PL);:locate 24,1:print string$(79,205);
502 if pl=39 or pl=44 then goto 14000
503 if pl=47 then goto 4250
505 locate 6,1:print"Du kan gÜ ":gosub 3130
507 if pff<>0 then tip(57)=pl:tip(58)=pl
510 ing=0:LOCATE 9,1:color fg4:PRINT"Du kan se :"
520 px=1:py=10:FOR U=1 TO 65:IF TIP(U)=PL THEN ing=1:locate py,px:PRINT TI$(U):py=py+1
525 if py>14 then px=px+29:py=10:locate py,px
530 NEXT U:if ing=0 then print"Ingenting."
540 locate 15,1
541 if fvf=3 then goto 5120
542 if fvf>0 and fvf<3 then gosub 5110
543 if fvf=0 and (pl=91 or pl=92) then gosub 5100
545 if kmv=1 then gosub 4300:goto 570
546 if kmv>1 and kmv<5 then gosub 4400:goto 570
547 if kmv=5 then gosub 4410:goto 570
550 if kmv=6 then goto 4420
555 if kmv=7 then gosub 4430:goto 570
560 if kmv>9 and kmv<13 then gosub 4500:goto 570
565 if kmv=13 then goto 4510
566 if saf=1 then gosub 4910
567 if (pl=72 or pl=74 or pl=79 or pl=81) and saf=0 then gosub 4900
568 if pl=96 and tip(56)=96 then gosub 5200
570 if pff>0 and (pl>84 and pl<96) then gosub 5500
580 if pl=84 and pff>0 then gosub 5750
585 if pff=-1 and pl=3 then gosub 6300
590 cy=25:gosub 14500:for p=15 to 23:locate p,1:print string$(80," ");:next p:locate 15,1:if a$="" then 590
600 IF A$="N" OR INSTR(A$,"NORD")>0 THEN IF NO(PL)=0 THEN PRINT B1$:GOTO 540 ELSE PL=NO(PL):GOTO 500
610 IF A$="S" OR INSTR(A$,"SYD")>0 THEN IF SY(PL)=0 THEN PRINT B1$:GOTO 540 ELSE PL=SY(PL):GOTO 500
620 if a$="ù" or instr(a$,"ùST")>0 THEN IF OE(PL)=0 THEN PRINT B1$:GOTO 540 ELSE PL=OE(PL):GOTO 500
630 IF A$="V" OR INSTR(A$,"VEST")>0 THEN IF VE(PL)=0 THEN PRINT B1$:GOTO 540 ELSE GOTO 2010
635 if instr(a$,"KRAVL")>0 then npf=0:gosub 3810:if npf=1 then goto 500 else goto 540
640 IF A$="OP" OR INSTR(A$,"OP")>0 THEN IF OP(PL)=0 THEN PRINT B1$:GOTO 540 ELSE PL=OP(PL):GOTO 500
650 IF A$="NE" OR INSTR(A$,"NED")>0 THEN IF NE(PL)=0 THEN PRINT B1$:GOTO 540 ELSE PL=NE(PL):GOTO 500
660 if instr(A$,"UNDER")>0 or instr(a$,"LíS")>0 or instr(a$,"KIG Pè")>0 or instr(a$,"SE Pè")>0 or mid$(a$,1,2)="U " then gosub 3000:GOTO 540
670 IF INSTR(a$,"BRUG")>0 or instr(a$,"TíND")>0 or instr(a$,"TRYK")>0 or instr(a$,"TRíK")>0 OR instr(a$,"HIV")>0 or INSTR(a$,"SKYD")>0 OR instr(a$,"SùG")>0 then gosub 3200:GOTO 540
680 IF A$="SE" OR A$="KIG" or a$="KIK" THEN GOTO 500
690 IF INSTR(A$,"TAG")>0 THEN GOSUB 3035:GOTO 540
700 if instr(a$,"SMID")>0 then gosub 3080:GOTO 540
710 if instr(a$,"LIST")>0 or a$="L" or instr(a$,"BèRET")>0 or instr(a$,"BAGA")>0 or instr(a$,"CHECK")>0 then gosub 3110:GOTO 590
720 if instr(a$,"LUGT")>0 OR INSTR(a$,"SNUS")>0 or instr(a$,"DUFT")>0 then gosub 3700:if pl=18 and kmv<>0 then goto 500 else goto 540
730 if instr(a$,"HJíL")>0 then gosub 3750:goto 540
740 if instr(a$,"SOV")>0 then gosub 4720:goto 540
750 if instr(a$,"TYD")>0 or instr(a$,"OVERS")>0 then gosub 3950:goto 540
760 if instr(a$,"LAV")>0 or instr(a$,"BYG")>0 or instr(a$,"UDHU")>0 then gosub 4020:goto 540
770 if instr(a$,"SEJL")>0 then gosub 4100:if pl=42 then goto 500 else goto 540
780 if instr(a$,"INDS")>0 then gosub 4200:if pl=45 then goto 500 else goto 540
790 if instr(a$,"GIV")>0 then gosub 4600:if kmv=7 then goto 500 else goto 540
800 if instr(a$,"SLUK")>0 then gosub 4700:goto 540
810 if instr(a$,"BIND")>0 then gosub 4750:goto 540
820 if instr(a$,"SLUT")>0 or instr(a$,"QUIT")>0 or instr(a$,"STOP")>0 then 8000
830 if instr(a$,"FLYT")>0 or instr(a$,"SKUB")>0 or instr(a$,"VíLT")>0 or instr(a$,"FJERN")>0 then gosub 4800:goto 540
840 if instr(a$,"VIS")>0 then gosub 4950:goto 540
890 if instr(a$,"DREJ")>0 or instr(a$,"SKRU")>0 then gosub 5000:goto 540
900 if instr(a$,"DYP")>0 or instr(a$,"DRYS")>0 then gosub 5300:goto 540
910 if instr(a$,"èBEN")>0 or instr(a$,"èBN")>0 then gosub 5600:goto 540
920 if instr(a$,"FLYGT")>0 then gosub 5700:goto 540
930 if instr(a$,"LAND")>0 then gosub 5800:goto 540
940 if instr(a$,"SVùM")>0 then gosub 5850:goto 540
950 if instr(a$,"SPIS")>0 then gosub 5900:goto 540
960 if instr(a$,"SAVE")>0 or instr(a$,"GEM")>0 then gosub 5950:goto 500
970 if instr(a$,"LOAD")>0 or instr(a$,"HENT")>0 then gosub 6050:goto 500
980 if instr(a$,"DRíB")>0 or instr(a$,"SLè")>0 then gosub 6150:goto 540
990 if instr(a$,"IDIO")>0 or instr(a$,"FUCK")>0 or instr(a$,"LORT")>0 then gosub 6200:goto 540
1000 if instr(a$,"SCOR")>0 then gosub 6250:goto 540
1010 if instr(a$,"SVING")>0 then gosub 6350:goto 540
1020 if instr(a$,"UNDSK")>0 then gosub 6400:goto 540
1030 if instr(a$,"TAK")>0 then gosub 6450:goto 540
1050 if instr(a$,"SE")>0 or instr(a$,"KIG")>0 or instr(a$,"KIK")>0 then gosub 3850:goto 540

1990 print"Det forstÜr jeg ikke. Prõv at udtrykke dig med nogle andre ord."
2000 goto 590

2010 if pl=24 and tip(21)=24 then print"Këmpefuglen flyver op og angriber dig! Du mÜ trëkke dig tilbage.":goto 540
2020 PL=VE(PL):goto 500


3000 for u=1 to 65:if instr(a$,ti$(u))>0 and (tip(u)=pl or tip(u)=255) then 3020
3002 next u
3005 for u=1 to 65:if instr(ti$(u),right$(a$,4))>0 and (tip(u)=pl or tip(u)=255) then 3020
3010 next u:if instr(a$,"íG")>0 and (tip(20)=255 or tip(20)=pl) then print und$(20):return else print"Det har jeg ikke mere at sige om.":return
3020 if und$(u)="x" then print"Jeg kan ikke fortëlle mere om den ting.":return
3022 if und$(u)="z" then 3026
3023 print und$(u)
3025 return
3026 if u=19 and tip(20)=0 and tip(21)=0 then print b3$:print ti$(20):tip(20)=24:bv=bv+1:und$(19)="x"
3027 if u=19 and tip(21)=24 then print"Këmpefuglen forhindrer dig!"
3028 if u=38 and tip(39)=0 then print"Du kigger under trëet. NakkehÜrene rejser sig pÜ dig....Der - under trëet       ligger et menneskeskelet!!!":gosub 7070:tip(39)=68:und$(38)="x"
3029 if u=42 then print"Det er vraget af Georgies 52. Det har vëret i brand, den ene vinge er brëkket   af, og vraget er brëkket i to dele. Indeni finder du en masse skrammel, et brev og to lig!!!":tip(43)=82:und$(42)="x":sco=sco+5:return
3034 return


3035 FOR u=1 to 65:if instr(ti$(u),right$(a$,4))>0 and tip(u)=pl then 3050
3040 next u:if instr(a$,"íG")>0 and (tip(20)=255 or tip(20)=pl) then u=20:goto 3050 else print"Det er her ikke!":return
3050 if tiv(u)>20 then print"Det kan du da ikke tage!":return
3060 if bv+tiv(u)>25 then print"Hnnngh......Nej, jeg kan ikke bëre mere.":return
3070 tip(u)=255:bv=bv+tiv(u):print"Ok.":return

3080 for u=1 to 65:if instr(ti$(u),right$(a$,4))>0 and tip(u)=255 then 3100
3090 next u:if instr(a$,"íG")>0 and tip(20)=255 then u=20:goto 3100 else print"Den ting har du ikke.":return
3100 tip(u)=pl:bv=bv-tiv(u):print"Ok.":return

3110 px=1:py=16:print"Du har :":for u=1 to 65:if tip(u)=255 then locate py,px:print ti$(u):py=py+1
3120 if py>22 then px=px+29:py=16
3125 next u:return

3130 color fg7
3135 if no(pl)<>0 then print"NORD ";
3140 if sy(pl)<>0 then print"SYD ";
3150 if oe(pl)<>0 then print"ùST ";
3160 if ve(pl)<>0 then print"VEST ";
3170 if op(pl)<>0 then print"OP ";
3180 if ne(pl)<>0 then print"NED ";
3190 return

3200 b$=right$(a$,4)
3210 if instr(ti$(3),b$)>0 and pl=1 then 3300
3220 if instr(ti$(4),b$)>0 and pl=1 then 3340
3230 if instr(ti$(5),b$)>0 and pl=2 then 3410
3240 if instr(ti$(6),b$)>0 and pl=3 then 3520
3250 if instr(a$,"SKYD")>0 and tip(9)=255 then 3560 else if instr(a$,"SKYD")>0 then print"Med hvad? Du har ingen pistol!"
3260 if instr(ti$(12),b$)>0 and pl=8 then 3610
3265 if instr(ti$(30),b$)>0 and tip(30)=255 then 3625
3280 if instr(a$,"BOG")>0 and tip(8)=255 then print"Bogen kan f.eks. bruges til at oversëtte med.":return
3295 print b2$:return
3300 if sf=0 then sound 400,15:print"Computeren bipper og skriver :":print"FEJL - MISSIONEN ER IKKE FULDFùRT.":return
3320 sound 3000,3:sound 1000,2:sound 20000,1:sound 1000,2:sound 20000,2:sound 1500,3:print"Gulvet vibrerer svagt - rumskibet har startet turen til moderskibet!!!":sc=sc+15:goto 11000
3330 return
3340 if sf=0 and lk=0 then sound 1000,2:sound 20000,2:sound 2000,3:sound 20000,1:sound 2000,3:sound 50,15:print"Blib......Summmme......TIKTIKTIKTIK......":print"LANDINGSKAPSEL KLAR TIL LANDING.":lk=1:sc=sc+15:return
3350 if sf=1 and lk<>0 then sound 2500,10:print"Bliiiib.......":print"FEJL - DER ER IKKE GRUND TIL LANDING.":return
3355 print"Intet sker."
3360 return
3410 sound 2000,4:sound 20000,1:for s=1 to 25:sound 700,0.00001:sound 20000,rnd*3:next s
3415 print"TIK TIK.......":print"PLANET : SENTURIOS":print"ATMOSFíRE : OK"
3420 print"KLIMA : FUGTIGT TROPISK":print"GEOGRAFI : PLANETEN BESTèR AF SLETTELAND, BJERGE OG SUMPSKOVE.":print"LIV : MULIGHED FOR INTELLIGENT LIV"
3430 print"LANDINGSSTED : ALLEREDE FORUDPROGRAMMERET."
3440 return
3520 if ft=1 then 3550 else ft=1:print"Klik, fjernsynet tënder:":print"....skëres ud, og dyppes i en klistermasse, sÜ svovlet bedre kan hënge fast pÜ";
3530 print"dem. bla bla bla.... det gule svovl farves rõdt...bla bla... 50 stk. ..."
3540 print"sëlges i disse blÜ ësker....":print"Det er en dokumentarfilm om tëndstikfremstilling.":print"Klik....":sc=sc+10:return
3550 print"Rassknknrrrlooooblopuiiiiikrasrrrr.....Der mÜ vëre atmosvëriske forstyrrelser!":return
3560 for s=2500 to 100 step -20:sound s,0.001:sound 2500,0.0000001:next s:print"ZZZFFFAUUUUU!!!"
3570 if pl=24 and tip(21)=24 then print"Këmpefuglen omkommer med et skrig i et lysskër og falder til jorden.":gosub 7130:return
3572 if saf=1 then print"Vësenet er for hurtigt!":return
3575 if pl=48 and tip(9)=255 and (instr(a$,"VíSE")>0 or instr(a$,"LEDE")>0) then print"Du rammer ikke! Vësenerne er over dig!!!":goto 14000
3576 if fvf>0 and fvf<3 then print"En af sumpfolkene falder om!":gosub 7010
3600 return
3610 if lk=0 then print"Landingskapslen er ikke klar endnu.":return
3611 if lk=2 then print"Du har da ikke fuldfõrt missionen!":return
3615 print"Smmmm! En luge glider i.....":sound 50,25:print"Nogle lamper blinker....":sound 1000,1:sound 1100,1:sound 1200,1:sound 20000,2:sound 1400,5:sound 20000,5
3616 if lk=3 then 3640
3617 print"Phiiuuuu.....Summe....buldre.....":print"Langsomt trënger kapslen igennem planetens atmosfëre.":for s=1000 to 700 step -0.3:sound s,0.001:sound 300,0.000001:sound int(rnd*100)+s,0.0000001:next s
3618 sound 20000,1:print"BUMP! Du er landet...":for s=500 to 50 step -2:sound s,0.0000001:sound int(rnd*450)+50,0.0000001:next s:lk=2:op(7)=9:sc=sc+50:return
3625 if pl<>25 and pl<>27 and pl<>28 and pl<>33 then print"Det er der ingen grund til her.":return
3627 if lt>0 then print"Den ER tëndt!":return
3628 print"KLIK....":lt=1:st$(27)="i en stor hule. Her ligger bunker af opbrudte mineraler her. Der ligger   ogsÜ nogle mineredskaber!":tip(32)=27:tip(34)=33:st$(33)="for enden af gangen ved en stor port."
3629 if pl=27 or pl=33 then print"Nu kan du se meget mere! KIG engang!"
3630 return
3640 print"Kapslen vibrerer kraftigt. Raketdyserne varmer op!":gosub 7170:print"Kapslen letter! I bliver presset ned mod gulvet. Nu stiger kapslen hurtigt.":gosub 7190
3650 print"Efter 2 timer nÜr kapslen rumskibet, og kobler sig pÜ.":op(7)=3:sc=sc+50:return

3700 if instr(a$,"LOMST")>0 and (tip(18)=255 or tip(18)=pl) then print"Blomsten har en sjov, beroligende duft.... Du bliver meeeget sõvnig......       Zzzzzzz...........":print"Noget senere.....":if pl=48 and kmv>9 and kmv<14 then 3730 else return
3710 if instr(a$,"OST")>0 and (tip(1)=255 or tip(1)=pl) then print"YRF! YRF!":return
3720 print"Tingen lugter som du troede.":return
3730 for p=1 to 40000:next p:pl=18:tip(37)=18:rbl=60:kmv=15:sc=sc+40:return

3750 if pl=32 then print"Stenen mÜ jo kunne TYDES pÜ en eller anden mÜde.":return
3760 if pl=40 and tip(28)=pl then print"Hvad var det nu stenalderfolkene sejlede rundt i???":return
3762 if pl=33 and lt=0 then print"Skaf dog noget lys!":return else if pl=33 and lt=1 then print"Lige fõr bëkken slutter med en brusen.":return
3765 if pl=48 and (kmv>1 and kmv<5) then print"Hvad vogtede këmpefuglen over?":return
3768 if pl=48 and (kmv>9 and kmv<13) then print"Der findes et velduftende hjëlpemiddel her pÜ planeten.":return
3770 if pl>95 and pff=0 then print"Har du set fjernsyn? Har du undersõgt hytterne? BlÜ tënder gul.":return
3780 if pl=96 and pff=0 then print"En anden ting.... Stenen kan flyttes med det rigtige hjëlpemiddel.":return
3800 print"Jeg kan ikke hjëlpe her.":return

3810 if instr(a$,"LIAN")>0 and pl=36 then pl=41:npf=1:return
3811 if pl=41 then pl=36:npf=1:return
3812 if pl=18 and tip(37)=18 and rbl=60 and instr(a$,"NED")>0 then print"Du kravler ned ad rebet. Pludselig er der ikke mere, 10 meter fõr en afsats! Du falder de 10 meter.....":goto 14000
3813 if pl=18 and tip(37)=18 and rbl=75 and instr(a$,"NED")>0 then print"Du kravler ned ad rebet, indtil du stÜr pÜ en afsats....":pl=49:for p=1 to 23000:next p:npf=1:return
3814 if pl=49 then pl=18:npf=1:return
3820 if pl=36 and instr(a$,"OP")>0 then print"Du skal ogsÜ sige, hvad du vil kravle op ad.":return
3825 print"Helt ërligt, hva'?":return

3850 if instr(a$,"KIKK")>0 and tip(29)=255 then 3860
3855 print"Du har ikke kikkerten!":return
3860 if pl=18 then 3890
3870 if pl=19 then 3900
3885 print"Der er ikke noget at se i kikkert her.":return
3890 print"Du afsõger hele horisonten med kikkerten. Pludselig ser du et vrag af et        rumskib! Lëngere vëk fÜr du õje pÜ noget bebyggelse af en art!":return
3900 print"Selv med kikkert er det svërt at se noget, men der er nogle smÜ prikker, som    bevëger sig frem og tilbage deroppe.":return

3950 if instr(a$,"SKRI")>0 or instr(a$,"STEN")>0 or instr(a$,"TEGN")>0 then 3970
3960 print"Det kan du ikke tyde.":return
3970 if instr(a$,"BOG")>0 then 3985
3980 print"Hvad vil du tyde med ?":gosub 14500:locate 16,1:if instr(a$,"BOG")=0 then print"Glem det...":return
3985 if tip(8)=255 and (tip(23)=pl or tip(23)=255) then 3990
3986 if tip(8)=255 and tip(25)=pl then 4000
3987 print"Det kan ikke lade sig gõre.":return
3990 print"Hmmmm.....":print"Der stÜr noget om noget ild, som faldt ned her i nërheden.":return
4000 print"ùõhmmm...........":print"Jo, stenene betyder `MORGEN' `MIDDAG' `DAG' `EFTERMIDDAG' `SEN DAG' `AFTEN'     `SEN AFTEN' `NAT'.":return

4020 if (tip(28)=255 or tip(28)=pl) and tip(33)=255 then 4050
4030 if instr(a$,"BèD")>0 then print"Du mangler en vigtig ting.":return
4040 print b2$:return
4050 print"Hug hug hug hug.....":gosub 7150:print"hak hug hak hak.....huk huk huk hak hak....Pust stõn......  huk huk hak huk hak.... o.s.v. o.s.v......Pheeuuu, her er sÜ en bÜd.";
4060 tip(28)=0:tip(35)=pl:sc=sc+50:return

4100 if pl=36 and (tip(35)<>255 and tip(35)<>pl) then print"Da ikke i det vrag!":return
4110 if (pl=40 or pl=38 or pl=31 or pl=36) and (tip(35)=255 or tip(35)=pl) then pl=42:tip(35)=36:bv=bv-15:return
4120 print"Det kan du ikke.":return

4200 if pl=33 and tip(13)=255 and lt=1 and instr(a$,"KLIPPE")>0 then 4220
4210 print b2$:return
4220 print"Klik....Rummmmmle klirre skrasle.....":gosub 7090
4225 print"Hov, porten svinger!":gosub 7110
4227 print"Du blive nërmest skovlet om pÜ den anden side af porten og opdager....."
4230 pl=45:tip(13)=0:sc=sc+60:delay 5:return

4250 locate 15,1:print"Pludselig bliver du opdaget!!! Vësenerne skriger op og lõber rundt. Tilsidst    samles de alle i en rundkreds omkring dig. De viser dig vej til en stor hytte."
4260 print:print"Tryk en tast:":while inkey$="":wend
4270 pl=48:kmv=1:goto 500

4300 if tip(8)<>255 then 4320
4310 goto 4360
4320 print"Lederen siger noget. Desvërre forstÜr du intet. EfterhÜnden bliver hans tone-";
4330 print"fald hõjere og hõjere, men du forstÜr stadig intet. Synes du ikke du har set en bog om fremmede civilationers sprog et sted?";
4340 print"Til sidst opgiver lederen. Han giver en ordre, og du bliver fõrt hen til en     skrënt. Du gõr modstand og skyder et par vësener, inden de smider dig ud over   skrënten.";
4350 goto 14000
4360 print"Lederen siger noget. Du finder din bog om fremmede civilisationers sprog frem   og prõver at finde ud af, hvad han siger. Efter nogle gentagelser og tegnsprog";
4370 print"finder du ud af, at han siger noget med noget ild, som faldt ned og noget om et uhyre, som du skal bevise din sejr over.";
4380 kmv=2:return

4400 locate 13,1:print"Lederen og vësenerne ser afventende pÜ dig":kmv=kmv+1:return
4410 locate 13,1:print"Lederen og vësenerne er meget utÜlmodige nu!":kmv=6:return
4420 print"Nu er vësenernes tÜlmodighed brugt op! Du bliver fõrt hen til en skrënt og      kastet ud over!!!":goto 14000
4430 locate 10,1:print"Lederen er tydeligt forbavset. Vësenerne skriger forundrede. Lederen betragter  ëgget lidt og spiser det!!! Nu prõver han at fortëlle noget igen. Noget med at";
4440 print"du er deres frelser fra stjernerne. Du skal hjëlpe dem med at overvinde deres   vërste fjender, sumpfolket. Du finder ud af, at sumpfolket er nogle vësener,";
4450 print"som lever i sump-omrÜdet under skrënten mod nord. De siges at overfalde alt     levende! Lederen fortëller, at de frygter lysende sten, og den giver dig en.";
4460 print"Du spõrger om det nedstyrtede rumskib, og lederen fortëller om en ildpil, som   hvëste hen over himmelen en tordenvejrsnat. Den tabte ildklumper, som slog en";
4470 print"kadiida (det kaldes vësenerne) ihjel. 'Ildpilen' endte hos sumpfolket, og siden har kadiidaerne ikke vovet sig ud pÜ sletten af frygt for flere 'ildpile'.";
4480 print"Til sidst vil lederen have, at du skal sove dybt, for at du kan komme afsted.";
4490 tip(36)=255:bv=bv+1:kmv=10:sc=sc+70:print:print"Tryk en tast.":while inkey$="":wend:for l=11 to 22:locate l,1:print string$(80," "):next l:return
4500 locate 13,1:print"Lederen gentager, at han vil have, at du skal sove.":kmv=kmv+1:print:return
4510 print"Lederen bliver skuffet. Da du ikke kan sove, bliver du slëbt hen til en skrënt  og kastet ud over....":goto 14000

4600 if (instr(a$,"LEDE")>0 or instr(a$,"VíSE")>0) and instr(a$,"íG")>0 and pl=48 and kmv>1 and kmv<7 and tip(20)=255 then kmv=7:print"Ok...":tip(20)=0:bv=bv-1:DELAY 2:return
4605 if instr(a$,"íG")>0 then print"Du skal ogsÜ sige, hvem du vil give det til.":return
4610 if instr(a$,"LEDE")>0 or instr(a$,"VíSE")>0 then print"Lederen er ikke interesseret.":return
4620 print"Der er ingen grund til at give den ting vëk.":return

4700 if instr(a$,"LYGT")>0 and tip(30)=255 and lt=1 then print"Den behõver ikke at blive slukket.":return
4720 if pl=4 then print"Sansom! Du har en mission at tënke pÜ!":return
4730 print"Det er umuligt at sove her uden hjëlpemidler.":return

4750 if tip(37)=18 and tip(10)=255 and instr(a$,"REB")>0 then rbl=75:tip(10)=0:bv=bv-2:print"Du binder dit reb til rebet pÜ kranen.":und$(37)="Den har 75 meter reb bundet pÜ, som hënger ned ad skrënten.":sc=sc+25:return
4760 print b2$:return

4800 if instr(ti$(40),right$(a$,4))>0 and tip(41)=0 and pl=71 then 4860
4805 if instr(a$,"STEN")>0 and pl=96 then 4865
4810 print b2$:return
4860 print"Hnngh!....Skrrrrrrr...Pheu!":gosub 7090:print"Under stenen er et dybt hul!":tip(41)=71:sc=sc+10:return
4865 if instr(a$,"MED")>0 then 4870
4867 print"Med hvad?":gosub 14500:locate 17,1
4870 if instr(a$,"GREN")>0 then 4875
4872 print"Det duer desvërre ikke.":return
4875 if tip(14)<>255 then print"Du har ikke grenen!":return
4877 print"Du prõver at vëlte stenen med grenen. O'Brien og Foreham hjëlper dig ivrigt.    Langsomt flytter stenen sig sÜ meget, at I kan komme igennem.":sy(96)=95:sc=sc+40
4878 print"Samtidig myldrer 4 sumpfolk-vësener ind.":if tip(61)<>255 then print"De overmander jer alle! Du vÜgner ikke igen....":goto 14000
4879 print"De ser jeres fakler og flygter skrigende igen.":pff=1:tip(53)=95:return

4900 print"Pludselig springer et vësen op af sumpen!!! Det krummer sig sammen til spring!!";:gosub 7070:saf=1:return
4910 print:print:print"Hjëëlp! Vësenet angriber dig!!! Aaaaaaaaarghhh.....":goto 14000

4950 for u=1 to 65:if instr(ti$(u),mid$(a$,4,7))>0 and tip(u)=255 then 4958
4954 next u:for u=1 to 65:if instr(ti$(u),right$(a$,3))>0 then 4958
4956 next u:print"Den ting har du ikke.":return
4958 if pl=48 then 4970
4960 if saf=1 and (pl=72 or pl=74 or pl=81 or pl=79) then 4980
4963 if fvf>0 and fvf<3 and instr(a$,"STEN")>0 and tip(36)=255 then print"Du tager stenen frem. Mange af sumpfolkene flygter skrigende vëk, men sÜ slÜr enaf dem stenen ud af hÜnden pÜ dig, putter den i en krukke og lõber vëk.":tip(36)=0:return
4968 print"Det er ingen nytte til.":return
4970 if u=20 then print"Lederen ser interesseret ud. MÜske var det en ide at GIVE det til vësenet.":return
4972 print"Lederen ser ikke spor interesseret ud.":return
4980 if u=36 or (instr(a$,"STEN")>0 and tip(36)=255) then print"Du tager stenen frem. Den kaster et nësten overnaturligt lys over vësenet, som  flygter i vild panik!":saf=2:sc=sc+25:gosub 7130:return
4985 print"Vësenet snerrer kun ad dig!":return

5000 if instr(a$,"HJUL")>0 and pl=84 and tip(52)=0 then 5050
5005 if (instr(a$,"èBEN")>0 or instr(a$,"èBN")>0) and pl=85 and sy(85)=0 then print"Du skal skrue eller dreje pÜ den mõtriklignende dims.":return
5010 if (instr(a$,"DIMS")>0 or instr(a$,"MùTRI")>0) and pl=85 then 5070
5045 print"Det kan du ikke dreje.":return
5050 if pff<>0 then print"I skal da ikke tilbage til det sted nu!":return
5052 print"Dreje, dreje, skramle.....":gosub 7050
5055 print"Hjulet skubber en primitiv slÜ fra pÜ den anden side. Porten er Üben.":sc=sc+10
5060 tip(44)=85:tip(52)=84:NO(84)=85:und$(44)="Der sidder en stor slÜ pÜ denne side, men kun en mõtriklignende dims som        hÜndtag.":return
5070 if instr(a$,"MED")>0 then 5075
5072 print"Med hvad?":gosub 14500:locate 16,1
5075 if instr(a$,"SKRUE")>0 then 5080
5077 print"Den gÜr nok ikke.":return
5080 if sy(85)<>0 then print"Det kan du, men hvorfor dog?":return
5085 print"Du indstiller skruenõglen og skruer pÜ livet lõs. Langsomt glider slÜen fra, og porten glider op.";:sy(85)=84:sc=sc+25:return

5100 print"Pludselig springer en masse sumpfolk-vësener ud af skoven. De angriber dig!!!   Flere og flere stormer hujende frem!!!":fvf=1:gosub 7030:return
5110 print"Vësenerne er over dig! De myldrer frem!!!":fvf=fvf+1:gosub 7030:return
5120 print"Du bliver overmandet!!! BOK!!! Alt bliver sort....":fvf=4:pl=96:sy(85)=0:if tip(9)=255 then tip(9)=90
5130 if tip(36)=255 then tip(36)=0
5140 delay 5:goto 500

5200 locate 13,1:print"Den ene af de to mënd prësenterer sig som Jim O'Brien og spõrger til, hvordan   dit hoved har det. Du fortëller om din dundrende hovedpine. Den anden mand";
5210 print"viser sig at vëre John Foreham. Du fortëller, hvordan du er havnet her. De to   mënd bliver kede af at hõre, hvordan du fandt Ray Murdoch i sumpen. De bliver";
5220 print"ogsÜ noget skuffede, da de finder ud af, at du ikke er i stand til at redde dem lige med det samme. Derefter fortëller de deres historie : Efter styrtet tog";
5230 print"de mod nord, for at finde hjëlp. De kom til denne lille landsby, og blev        overfaldet og taget til fange af disse sumpvësener. Bruce Wildbird, som var";
5235 gosub 7510:locate 13,1
5240 print"sÜret, blev hurtigt fõrt bort, og aldrig set siden, men der var ingen tvivl om, at han var  blevet ofret af vësenerne. Siden har de to levet i denne hule, som";
5250 print"de kun kommer ud af hver 3. dag for at fÜ lidt luft. De fÜr mad fra vësenerne i form af rÜt kõd, frugter og planter. Vësenerne betegner dem som en kostbar";
5260 print"ejendom, og passer derfor godt pÜ dem. Indtil videre har der ikke vëret mulighedfor flugt, og det har der jo heller ikke vëret grund til, da de ikke har kunnet";
5270 print"komme vëk fra planeten. Du forstÜr hvor glade de to mënd er for at se et andet  menneske efter alle disse Ür. Du forstÜr ogsÜ, at du mÜ finde en mÜde at flygte";
5280 print"pÜ, da I nu har hÜb om at komme vëk fra planeten.":gosub 7510:locate 15,1:tip(56)=0:tip(57)=96:tip(58)=96:sc=sc+25:return

5300 if instr(a$,"STíNG")>0 and tip(54)=255 or tip(59)=255 or tip(60)=255 then 5320
5305 if instr(a$,"STíNG")>0 and tip(54)<>255 and tip(59)<>255 and tip(60)<>255 then print"Du har ikke stëngerne!":return
5310 print"Det er der ingen grund til.":return
5320 if (instr(a$,"KRUKK")>0 or instr(a$,"GUL")>0) and (tip(47)=255 or tip(47)=pl) then 5400
5330 if (instr(a$,"HARPI")>0 or instr(a$,"FAD")>0) and (tip(49)=255 or tip(49)=pl) then 5430
5340 if instr(a$,"BLè")>0 and (tip(55)=255 or tip(55)=pl) then 5450
5350 print"Udtryk dig lidt tydeligere.":return
5400 if tip(54)=255 then print"Pulveret falder af stëngerne igen.":return
5410 if tip(59)=255 then print"Pulveret sidder nu tykt pÜ enden af stëngerne.":tip(59)=0:tip(60)=255:sc=sc+15:return
5420 print"Det har du gjort!":return
5430 if tip(54)=255 then print"Hver stangs spids er nu syltet ind i harpiks.":tip(54)=0:tip(59)=255:sc=sc+10:return
5440 goto 5420
5450 if tip(60)=255 then 5470
5452 if tip(54)=255 then print"Det blÜ pulver drysser af stëngerne igen.":return
5455 if tip(59)=255 then print"Pulveret reagerer kemisk med harpikset, syder og forsvinder.":return
5460 goto 5420
5470 sc=sc+15:if pl=96 then 5490
5475 print"En kemisk reaktion sker. Hver stang, som kommer i kontakt med pulveret, flammer op og bliver til en kraftig fakkel. O'Brien og Forenham dukker op, og tager     begejstrede og forundrede hver to af stëngerne.";
5480 print"'Vi mÜ ud herfra pÜ en eller anden mÜde!' siger John Foreham, og de to mënd ilertil udgangen.":
5485 tip(60)=0:tip(61)=255:return
5490 print"En kemisk reaktion sker. Hver stang, som kommer i kontakt med pulveret, flammer op og bliver til en kraftig fakkel. O'Brien og Forenham ser forundrede og       begejstrede til, og tager hver to af stëngerne.";
5492 print"'Vi mÜ ud herfra pÜ en eller anden mÜde!' siger John Foreham.":goto 5485

5500 locate 19,1:print int(rnd*4)+4"Sumpfolk-vësener angriber jer!":print int(rnd*3)+2"vësener overlever og flygter i vild panik!"
5510 if pff=5 then print"I kan ikke blive ved med at vinde!"
5520 if pff=11 then print"I er trëtte nu, og kan let blive overmandede!"
5525 if pff=15 then print"Flere dukker op! I mÜ bõje jer for overmagten...":goto 14000
5530 pff=pff+1:locate 15,1:return

5600 if instr(a$,"PORT")>0 then 5620
5605 if instr(a$,"BOG")>0 and (tip(8)=255 or tip(8)=pl) then print"Det er nok bare at lëse den.":return
5608 if instr(a$,"VINDU")>0 and pl=3 then print"Vinduet er idiotsikret mod idioter, som kunne finde pÜ at Übne det ud til det   lufttomme rum.":return
5610 print"Den ting er ikke til at Übne.":return
5620 if pl=33 then print"Der er ingen hÜndtag eller lignende, sÜ det er lidt svërt.":return
5630 if pl=84 and tip(44)=84 then print"Her er ingen hÜndtag, men det hjul kunne mÜske bruges...":return
5640 if pl=84 and tip(52)=84 then print"Jamen, (snõft), porten ER Üben.":return
5650 if pl=85 and sy(85)=84 then print"Nej, da....Porten ER jo Üben.":return
5660 if pl=85 and sy(85)=0 then print"Det er ikke til at dreje den mõtriklignende dims rundt uden hjëlpemidler!":return
5670 print"Her er der ingen port.":return

5700 print"Hvis du insisterer. Hvorhen, forresten?":return

5750 print"Porten smëkker i bag jer. I er lettede og lykkelige over at vëre sluppet bort.":no(84)=0:tip(52)=0:tip(44)=84:pff=-1:sc=sc+40
5760 und$(44)="Den er godt lukket til, heldigvis!":print"Nu gëlder det bare om at komme tilbage til kapslen!":sf=1:lk=3
5770 und$(11)="Hans maveonde har fortaget sig lidt. Han siger, at rumskibet skal kobles til    moderskibet.":und$(62)="Han har stadig hõj feber. Han hvisker, at du er en mand af rang.":return

5800 if (pl>0 and pl<9) and lk=0 then print"Hvad tror du rumskibets computere skal bruges til?":return
5810 print"Her kan du ikke lande pÜ nogen mÜde.":return

5850 if pl=31 or pl=36 or pl=40 or pl=42 then print"Du trëder ud i vandet. Pludselig brënder du dig, som pÜ en brandmand, blot megetvërre! Du lammes og driver med strõmmen indtil et vandfald....":goto 14000
5860 print"At svõmme her anses for rimeligt umuligt (suk).":return

5900 if instr(a$,"MAD")>0 and tip(1)=255 or tip(1)=pl then goto 5920
5910 print"Det ville jeg ikke foreslÜ dig at spise.":return
5920 print"Hvis du virkelig alvorligt mener, at du vil spise en (YRF!) gammel ostemad, sÜ  er du ikke klog nok til dette spil. Ostemaden er faktisk havnet i spillet her   ved en total misforstÜelse, sÜ bare glem det....";
5930 return

5950 print"Under hvilket navn skal spillet gemmes?":gosub 14500:locate 17,1
5960 on error goto 6010
5970 open a$ for OUTPUT as #1
5980 for sa=1 to 65:write#1,tip(sa):next sa:write#1,no(84),sy(85),sy(96),op(7),und$(11),und$(19),und$(37),und$(38),und$(42),und$(44),und$(62),st$(27),st$(33)
5990 write#1,pl,bv,msf,sf,lk,lt,kmv,ft,rbl,saf,npf,fvf,pff,sc
6000 close 1:print"Saving ok."
6005 print"Tryk en tast.":while inkey$="":wend:return
6010 color fg9:print"Diskfejl - spillet er ikke blevet gemt.":color fg9:resume 6005

6050 print"Hvad er navnet pÜ det gemte spil?":gosub 14500:locate 17,1
6060 on error goto 6110
6070 open a$ for input as #1
6080 for sa=1 to 65:input#1,tip(sa):next sa:input#1,no(84),sy(85),sy(96),op(7),und$(11),und$(19),und$(37),und$(38),und$(42),und$(44),und$(62),st$(27),st$(33)
6090 input#1,pl,bv,msf,sf,lk,lt,kmv,ft,rbl,saf,npf,fvf,pff,sc
6100 close 1:print"Loading ok."
6105 print"Tryk en tast.":while inkey$="":wend:return
6110 color fg9:print"Diskfejl - spillet er ikke blevet hentet.":color fg1:resume 6105

6150 print"Brug hellere din laserpistol til at drëbe med.":return

6200 print"I lige mÜde!":return

6250 print"Din score er pÜ"sc"points ud af 600":return

6300 print"Jim O'Brien og John Foreham sëtter sig udmattede ned. De takker dig mange gange for at du har reddet dem.":pff=0:return

6350 if pl=36 and instr(a$,"LIAN")>0 then print"AAAEEEEIOOOIOOOO!!!":print"Du leger tarzan lidt, men kommer sÜ i tanke om din mission.":return

6400 print"Tak.":return

6450 print"Ingen Ürsag!":return


7000 Rem Argh
7010 for s=1500 to 250 step -15:sound s,0.000001:sound 255,0.000001:sound 256,0.000001:next s:return
7020 Rem Myldrer frem
7030 for a=1 to int(rnd*4)+6:for s=int(rnd*600)+900 to int(rnd*500)+300 step -10:sound s,0.000001:sound 300,0.0000001:sound s+5,0.000001:next s,a:return
7040 Rem Skrumle dreje
7050 for s=1 to 5:for s2=1 to 500 step 8:sound int(rnd*400)+150,.1:sound 1000+s2+int(rnd*350),0.001:sound 30000,0.1:next s2:sound 30000,5:next s:return
7060 Rem Uhygge
7070 for s=1 to 400:sound 300,0.00001:sound 400+int(rnd*40),0.000001:next s:return
7080 Rem Rumle
7090 for s=1 to 550:sound int(rnd*1000)+40,0.000000001:next s:return
7100 Rem port svinger
7110 for s=50 to 500 step .5:sound int(rnd*1000)+40,0.000000001:sound s,0.000000001:next s:return
7120 rem Fugleskrig
7130 for s=2500 to 1000 step -10:sound s,0.00001:sound 1000,0.00001:sound 2500,0.00001:next s:tip(21)=0:tip(22)=24:return
7140 Rem Hak hak hak
7150 for s1=1 to 15:s2=int(rnd*200):for s=1 to 80:sound int(rnd*800)+280+s2-(s*3),0.0000001:next s:sound 30000,int(rnd*4)+4:next s1:return
7160 rem Opvarmning
7170 for s=2000 to 4500 step 2:sound s,0.000001:sound 4500,0.0000001:sound 500,0.0000001:next s:return
7180 rem Kapsel letter
7190 for s=1 to 2000 step 2:sound 4500,0.000001:sound 4500,0.000001:sound 500+(s*2),0.0000001:sound int(rnd*500)+150,0.000001:sound int(rnd*500)+200,0.000001:sound int(rnd*200)+150,0.00001:next s:return


7500 Rem Tryk tast + rens
7510 locate 25,1:print"Tryk en tast :";:delay 1:while inkey$="":wend:for p=13 to 23:locate p,1:print string$(80," ");:next p:locate 25,1:print"               ";:return

8000 print"Vil du slutte spillet?":cy=25:gosub 14500:if instr(a$,"JA")>0 then 8020
8010 goto 540
8020 cls:locate 10,6:print"Tak fordi du ville spille REALWARE spillet 'Mission til Senturios'!"
8030 print:print"Hvis du er interesseret i at blive registreret bruger m.m., sÜ lës mere om det":print"i filen 'HELP.DOC'."
8040 print:print:print"Tak for nu - og mÜske pÜ gensyn!":while inkey$="":wend:end

9000 fg1=15:fg2=9:fg3=10:fg4=3:fg5=14:fg6=6:fg7=12:fg8=0:fg9=31:bg1=12:bg2=11:bg3=9:bg4=7:return
9010 fg1=2:fg2=2:fg3=2:fg4=2:fg5=2:fg6=2:fg7=10:fg8=0:fg9=18:bg1=0:bg2=0:bg3=0:bg4=7:return


10000 color fg1,bg1:cls:locate 2,31:print"Captain P. Sansoms":locate 4,30:print"M I S S I O N  T I L":locate 6,8:color fg2:print" ∞±±±± ∞±±±±± ∞±±  ∞±± ∞±±±±±± ∞±± ∞±± ∞±±±±±± ∞±± ∞±±±±±±  ∞±±±±"
10010 locate 7,8:print"∞±±    ∞±±    ∞±±± ∞±±   ∞±±   ∞±± ∞±± ∞±± ∞±± ∞±± ∞±± ∞±± ∞±±"
10020 locate 8,8:print"∞±±±±± ∞±±±±  ∞±±∞±∞±±   ∞±±   ∞±± ∞±± ∞±±±±±± ∞±± ∞±± ∞±± ∞±±±±±"
10030 locate 9,8:print"   ∞±± ∞±±    ∞±± ∞±±±   ∞±±   ∞±± ∞±± ∞±± ∞±  ∞±± ∞±± ∞±±    ∞±±"
10040 locate 10,8:print"∞±±±±  ∞±±±±± ∞±±  ∞±±   ∞±±   ∞±±±±±± ∞±±  ∞± ∞±± ∞±±±±±± ∞±±±±"
10050 locate 12,26:color fg3:print"Et DANSK fremtidseventyrspil":locate 14,29:color fg4:print "(C) Peter Ravnholt 1989":locate 16,24:color fg1:print"En produktion fra REALWARE GAMES!"
10055 locate 18,34:print"(Version 1.1)":locate 23,34:color fg5:print"Tryk en tast.":while inkey$="":wend:color ,bg2:cls
10057 locate 5,7:color fg1,bg1:print"⁄"string$(66,"ƒ")"ø":locate 11,7:print"¿"string$(66,"ƒ")"Ÿ"
10060 locate 6,7:print"≥Dette spil fra RealWare Games mÜ frit kopieres og deles ud. Skulle≥";:locate 7,7:print"≥du finde spillet godt, er du velkommen til at sende kr. 60, - til ≥";
10070 locate 8,7:print"≥mig, hvorved du vil blive registreret bruger og fÜ besked om alle ≥";:locate 9,7:print"≥nye programmer, som udkommer fra RealWare. Samtidig vil du hjëlpe ≥";
10080 locate 10,7:print"≥mig med at klare õkonomien og derved lave flere gode programmer.  ≥";
10090 locate 13,31:color ,bg3:print"…"string$(16,"Õ")"ª":locate 14,31:print"∫ REALWARE GAMES ∫":locate 15,31:print"∫  Sõtoften 31   ∫"
10100 locate 16,31:print"∫  DK-8250 EgÜ   ∫":locate 17,31:print"»"string$(16,"Õ")"º":locate 23,29:color fg6,bg2:print"Tryk en tast for start."
10150 while inkey$="":wend:cls:return

11000 print"Senere ......":print:print"Tryk en tast.":while inkey$="":wend:cls
11010 print"Uddrag fra 'International Spaceflight News' nr. 17 - 2058:":print:color fg8,bg4:print string$(80," ");:print"                        Intelligent liv pÜ Senturios!                           ";:print string$(80," ");
11015 print"Under dramatiske begivenheder fandt SIS piloten Captain P. Sansom bÜde          ";
11020 print"intelligente livsformer og reddede to overlevende besëtningsmedlemmer fra det   ";:print"Forulykkede Georgies 52. Alt klarede han alene, da hans kammerater havde fÜet   ";
11025 print"voldsomme anfald af mavekatar. De er nu begge raske igen.                       ";:print string$(80," ");
11030 print"Nërkamp med farlige sumpvësener og et mere fredeligt mõde med nogle bjergvësener";
11035 print"var blot nogle af de ting, som Captain Sansom var igennem pÜ Senturios. Der blev";
11037 print"altsÜ konstateret flere arter intelligente livsformer. De andre SIS-rumskibe,   ";
11040 print"som landede andre steder pÜ planeten fandt ingen intelligente livsformer. Dog   ";
11045 print"mõdte et hold, ledet af Ken Hrista, nogle primitive nësehornslignende vësener.  ";
11046 print"Til at starte med fandt Captain Sansom ingen tegn pÜ intelligent liv, men en....";:print
11047 print"...ren igen. En glad og lettet Captain Sansom ser nu frem til sin nëste mission.";:print
11050 color fg1,bg3:print"Det ser ud til, at du har gennemfõrt spillet! Tilykke!!":gosub 6250:print:print"Tryk en tast.":while inkey$="":wend:goto 8020

14000 for s=800 to 200 step -1:sound s-int(rnd*15),0.0000001:sound 1000,0.01:next s
14005 while inkey$="":wend:cls:locate 12,1:print:print:print"Beklager, men du er desvërre dõd. Captain Sansoms karriere slutter her.":print"Vil du spille igen":cy=25:gosub 14500
14010 if instr(a$,"JA")>0 then CLEAR:run else goto 8020

14500 color fg1:a$="":locate cy,1:print string$(79," ");:locate cy,1:print"> "chr$(219);:cx=3
14510 i$=inkey$:if i$="" then locate cy,cx:goto 14510
14520 if i$=chr$(8) and len(a$)<>0 then a$=left$(a$,len(a$)-1):print" ";:cx=cx-1:locate cy,cx:print chr$(219);:goto 14510
14530 if i$=chr$(13) then print" ";:return
14532 if i$=chr$(145) then i$=chr$(146)
14533 if i$=chr$(155) then i$=chr$(157)
14534 if i$=chr$(134) then i$=chr$(143)
14540 if asc(i$)<32 or asc(i$)>157 then 14510
15550 if asc(i$)>96 and asc(i$)<123 then i$=chr$(asc(i$)-32)
15555 if len(a$)>75 then 14510
15560 print i$;:a$=a$+i$:cx=cx+1:locate cy,cx:print chr$(219);:goto 14510
