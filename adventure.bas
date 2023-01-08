!--------------------------------------------------
!- Saturday, January 7, 2023 11:17:11 PM
!- Import of : 
!- c:\users\user\onedrive\documents\github\vic20-adventure\adventure\adventure.prg
!- Unexpanded VIC20 / C16 / Plus4
!--------------------------------------------------
0 poke36879,27
1 a=0
5 print"{clear}{black}{space*9}{reverse on}{sh pound}Q{cm asterisk}{reverse off}"
7 print"{green}{down}{cm p}{cm o}{cm i}{cm o}{cm p*2}{cm o}{cm i}{cm o}{cm p*2}{cm o}{cm i}{cm o}{cm p*2}{cm o}{cm i}{cm o}{cm p*2}^"
10 print"{down} {purple}{reverse on}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}"
20 print"{reverse on}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{reverse off}"
30 print"{down*2}{blue}{reverse on}{space*6}{reverse off} {reverse on}{space*14}W{space*6}{reverse off} {reverse on}{space*15}"
40 print"{down*5}{green}X{space*3}X{space*4}L {sh @}{space*2}X{space*3}X{space*7}X{space*4}OQP{space*4}X{space*3}A{space*2}X{space*2}X X X{space*4}X X {blue}"
50 s=8185:ti$="000000"
60 pokes,32
65 print"{home}";a
70 geta$
75 ifa$="{f7}"ands<8164thens=s+22
77 ifa$="{f1}"ands>7702thens=s-22
79 ifa$="a"ands>7680thens=s-1
80 ifa$="d"ands<8185thens=s+1
90 ifpeek(s)=81then1000
92 ifpeek(s)=65then2000
94 ifpeek(s)=128+87then3000
96 ifpeek(s)=128+81then4000
98 ifpeek(s)=30thena=a+1:goto110
100 ifpeek(s)<>32thens=8185
110 pokes,38:pokes+30720,0:goto 60
1000 poke36879,8:print"{clear}{down*5}{white}>>>>>>>>>>>>>>>>>>>>>>{down}>>>>>>>>>>>>>>>>>>>>>>";
1010 print"{down}>>>>>>>>>>>>>>>>>>>>>>{down}>>>>>>>>>>>>>>>>>>>>>>"
1020 printtab(10)"UI"
1030 printtab(10)"{sh -}{sh -}PPP"
1040 printtab(10)"JK"
1045 s=7778:w=7790:q=4
1047 forp=0to21
1050 pokes,38
1052 pokew+p,32:pokew+p-1,62
1054 fort=1to2*q:geta$
1056 ifa$="{f7}"thens=s+22
1058 ifpeek(s)=32thenpokes,38:pokes,32:s=s+22:w=w+44:q=q-1:goto1047
1059 ifw>7943thenw=7790
1060 ifpeek(s)=62thenpoke36879,27:goto5
1062 ifpeek(s)=85thena=a+1:poke36879,27:goto5
1064 pokes,38:next
1066 next
1068 goto1047
2000 print"{clear}{white}UKJI{space*5}UKJI{space*3}UKJI"
2010 poke36879,8:print"{cm t*22}"
2012 print"{down*8}A{down}{left}{cm +} {cm u} {cm u} {cm u*2} {cm u*2} {cm u*2} {cm u*6}{cm +}""
2013 PRINT"{down*5}{reverse on}{sh pound}{reverse off}{space*6}{reverse on}{cm asterisk}{reverse off}{space*5}{reverse on}{sh pound}{reverse off}{space*5}{reverse on}{sh pound}{reverse off}{space*2}{reverse on}{space*22}"
2016 S=7943:T=6
2018 POKES+1,102
2020 FORP=1TO10:GETA$
2022 IFA$<>""ANDT>0THENPOKES+21,120:T=T-1
2026 IFA$<>""ANDT>0THENG=10
2028 NEXT
2029 S=S-1
2030 IFPEEK(S+22)=32THEN2100
2032 IFPEEK(S)=65THENA=A+1:POKE36879,27:GOTO5
2034 POKES,38:GOTO2018
2100 FORT=1TO8:S=S+22:POKES,38:POKES-22,32:NEXT:POKE36879,27:GOTO5
3000 POKE36879,8:PRINT"{clear}{white}{space*4}{cm +}{^*2}{cm a}{sh asterisk}{cm s}{cm +}{space*15}{cm +}{^*2}j{sh asterisk}k{cm +}{space*15}{cm +*3}{cm pound}{cm +*3}"
3005 FORT=1TO((10-A)*20):R=INT(RND(1)*373)+7769:POKER,102:NEXT
3010 FORT=0TO2:R=INT(RND(1)*373)+7669:POKER,79+T:NEXT
3015 S=8185:T=0
3016 POKES,32
3017 GETA$:IFA$="{f1}"ANDS>7702THENS=S-22
3019 IFA$="{f7}"ANDS<8142THENS=S+22
3020 IFA$="a"ANDS>7680THENS=S-1
3022 IFA$="d"ANDS<8185THENS=S+1
3024 IFPEEK(S)=102ORPEEK(S)=104ANDT<3THENPOKE36879,27:GOTO5
3026 IFPEEK(S)=81ORPEEK(S)=79ORPEEK(S)=80THENT=T+1
3028 IFPEEK(S)=104ANDT=3THENA=A+1:POKE36879,27:GOTO5
3030 POKES,38:GOTO 3016
4000 POKE36879,8:PRINT"{clear}{white}":TI$="000000":P=0
4003 IFA<4THENPRINT"you don't have all thethings you need!!":END
4005 FORT=0TO20:R=INT(RND(1)*(21*19))+7702:POKER,94:NEXT
4010 S=8174
4015 PRINT"{home}"INT(TI/60)+1
4020 POKES,64:POKES-1,85:POKES+1,73
4030 GETA$:IFA$="a"ANDS>8165THENPOKES+1,32:S=S-1
4040 IFA$="d"ANDS<8184THENPOKES-1,32:S=S+1
4045 IFA$="{f1}"THENGOSUB4100
4050 IFP>18THENGOTO4500
4055 IFINT(TI/60)+1>20THEN5000
4060 GOTO 4015
4100 FORQ=S-22TOS-(22*21)STEP-22:IFPEEK(Q)=94ORPEEK(Q-1)=94ORPEEK(Q+1)=94THENP=P+1
4105 POKEQ,99:POKEQ-1,78:POKEQ+1,77:POKEQ+22,32:POKEQ+21,32:POKEQ+23,32:NEXT
4110 RETURN
4500 PRINT"{clear}{white}you destroyed all the creatures in time.{space*4}you saved the village!!":END
5000 PRINT"{clear}the creatures had{space*5}enough time to destroythe village!"
