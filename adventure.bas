!- Advanture game for the unexpanded VIC-20
!- Variables:
!- TI$: standard time
!- A: count of items collected
!- A$: player input
!- S: player location in overworld map
!- SS: player location in subgames.
!- OS: previous player location in maze game
!- W: start of active forcefield line
!- P: for loop (used for position of current forcefield hold), delay in cavein, number of dinos killed in final game.
!- T: number of traps in cavein, for loop in maze game, number of key pieces collected, loop in dino
!- R: random position for dinos and key pieces in maze
!- Q: delay for forcefield movement, dino bow firing loop
!- BS: previous player location in overworld map
!- IV: collected items in BITS: (first item bit 1, second item in bit 2, ...)
!- MT: TIME LIMIT (in seconds)
!- CD: time left (in secconds)
!- PT: previous time left (in seconds) determines when to update the status bar
!- initialize game
1pO36879,27:A=0:S=8185:TI$="000000":IV=0:MT=180:PT=0
!- draw overworld map subroutine
2?"{clear}{black}{space*9}{reverse on}{sh pound}Q{cm asterisk}{reverse off}":?"{green}{down}{cm p}{cm o}{cm i}{cm o}{cm p*2}{cm o}{cm i}{cm o}{cm p*2}{cm o}{cm i}{cm o}{cm p*2}{cm o}{cm i}{cm o}{cm p*2}^":?"{down} {purple}{reverse on}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}{cm asterisk}{sh pound}":?"{reverse on}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{sh pound} {cm asterisk}{reverse off}":?"{down*2}{blue}{reverse on}{space*6}{reverse off} {reverse on}{space*14}W{space*6}{reverse off} {reverse on}{space*15}":?"{down*5}{green}X{space*3}X{space*4}L {sh @}{space*2}X{space*3}X{space*7}X{space*4}OQP{space*4}X{space*3}A{space*2}X{space*2}X X X{space*4}X X {blue}"
!- store previous location, display status bar and handle player input for movement by updating player position
3BS=S:goS70:gEA$:ifA$="l"aNS<8164tHS=S+22
4ifA$="p"aNS>7702tHS=S-22
5ifA$="a"aNS>7680tHS=S-1
6ifA$="d"aNS<8185tHS=S+1
!- if player goes to spaceship go to forcefield minigame.
7ifpE(S)=81tH15
!- if player goes to special tree go to cavein minigame.
8ifpE(S)=65tH25
!- if player goes to whirlpool go to maze minigame.
9ifpE(S)=128+87tH34
!- if player goes to final location go to minigame.
10ifpE(S)=128+81tH52
!- if player picks up arrow go to pick up sound and mark as picked up.
11ifpE(S)=30tHA=A+1:goS78:gO13
!- if player collides with anything else, don't move.
12ifpE(S)<>32tHS=BS
!- if player has moved, then erase previous location
13ifBS<>StHpOBS,32
!- draw players new position and continue overworld game loop.
14pOS,38:pOS+30720,0:gO3
!- forcefield subroutine, exit if already got the item.
15ifIVaN1tH69
!- draw forcefield and initialize player position, active forcefield and delay
16PT=0:pO36879,8:?"{clear}{down*5}{white}";:fOT=1to4:?">>>>>>>>>>>>>>>>>>>>>>":nE:?tA10)"UI":?tA10)"{sh -}{sh -}PPP":?tA10)"JK":pO36878,3:SS=7778:W=7790:Q=4
!- loop through forcefield.
17pO36875,0:fOP=0to21:goS70:pOSS,38:pO36874,135+P:pOW+P,32:ifP<>0tHpOW+P-1,62
!- look for user input inside the "delay"
18fOT=1to2*Q:gEA$:ifA$="l"tHSS=SS+22
!- if player moves down in to the force field gap, animate him moving to next level, activate next forcefield and reduce the delay.
19ifpE(SS)=32tHSS=SS-22:pOSS,32:SS=SS+44:W=W+44:Q=Q-1:pO36875,240:gO17
!- If moved past all forcefield, moved the forcefield line.
20ifW>7943tHW=7790
!- if player hit forcefield, go to failed and boot out to overworld subroutine.
21ifpE(SS)=62tHpO36879,27:goS77:gO69
!- if player hit the key, turn on item flag and add to score and go to success subroutine.
22ifpE(SS)=85tHA=A+1:IV=IV+1:pO36879,27:goS78:gO69
!- if nothing happened, draw player in position and continue looping the forcefoeld.
23pOSS,38:nE:nE
24gO17
!- cavein minigame
!- if item was already received boot out to overworld.
25ifIVaN2tH69
!- draw level.
26PT=0:?"{clear}{white}{down}UKJI{space*5}UKJI{space*3}UKJI":pO36879,8:?"{cm t*22}":?"{down*7}A{down}{left}{cm +} {cm u} {cm u} {cm u*2} {cm u*2} {cm u*2} {cm u*6}{cm +}":?"{down*5}{reverse on}{sh pound}{reverse off}{space*6}{reverse on}{cm asterisk}{reverse off}{space*5}{reverse on}{sh pound}{reverse off}{space*5}{reverse on}{sh pound}{reverse off}{space*2}{reverse on}{space*22}"
!- initialize player position, number of traps and sound
27SS=7943:T=6:pO36878,2:pO36877,135
!- draw boulder, status bar and start delay loop and handle user input
28pOSS+1,102:goS70:fOP=1to10:gEA$:ifA$<>""aNT>0tHpO36875,24:pOSS+21,120:T=T-1
!- what was this? 30ifA$<>""andT>0thenG=10
29nE
!- move player to next place and if player is over hole fall subroutine
30SS=SS-1:ifpE(SS+22)=32tH33
!- if player gets to the end, add the item to inventory, go to succes subroutine.
31ifpE(SS)=65tHA=A+1:IV=IV+2:pO36879,27:goS78:gO69
!- otherwise draw player in new position and loop.
32pO36875,0:pOSS,38:gO28
!- failing subroutine.
33fOT=1to8:SS=SS+22:pOSS,38:pOSS-22,32:pO36878,15-T:pO36876,240-T:nE:pO36876,0:pO36878,0:pO36879,27:goS77:gO69
!- maze minigame
!- if item already collected boot to overworld.
34ifIVaN4tH69
!- draw cave and place random key pieces
!- 55 PT=0:POKE36879,8:PRINT"{clear}{white}{down}{cm+*5}{^*2}{cma}{shasterisk}{cms}{cm+*12}{space*4}{cm+}{^*2}J{shasterisk}K{cm+}{space*15}{cm+*7}"
!- place random blocks
!- 56 FORT=1TO((10-A)*20):R=INT(RND(1)*(21*17))+7790:POKER,102:NEXT
35PT=0:pO36879,8:?"{clear}{white}{home}{down}{166}{166}{166}{166}{166}^^{176}{sh asterisk}{174}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}    {166}^^JFK{166}":?"{166}{166}{166} {166}{166}{166}{166}{166}{166}{166} {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166} {166}          {166}{166}      {166}{166} {166}{166}{166}{166}{166} {166}{166}{166}{166}{166}{166}  {166} {166}  {166}{166} {166}          {166}{166}{166}{166}{166}{166}{166} {166}";
36?"{white}{166} {166}{166} {166}{166}  {166}{166}{166}  {166}      {166}{166}  {166}  {166}{166} {166} {166}  {166}{166}{166} {166} {166}{166}{166} {166}{166}{166}  {166}{166}{166} {166}  {166} {166}   {166}{166}{166} {166} {166}{166} {166}   {166}    {166} {166}{166}{166}{166}{166}    {166} {166} {166}{166}{166} {166}{166}{166}{166}   {166}{166}{166} {166}{166}{166}{166} {166}  {166}         {166}{166}{166} {166}    {166}  {166} {166} {166}{166}{166}{166}{166} {166}{166}{166} {166}{166}{166} {166}{166}  {166}   {166}     {166}{166}";
37?"{white}{166}   {166}  {166}  {166} {166}{166}{166}     {166}{166}{166} {166} {166}{166} {166}  {166} {166}   {166}{166}{166} {166}{166}{166}    {166} {166}  {166} {166}{166} {166}{166} {166} {166}{166}{166} {166}{166} {166}    {166}  {166}    {166} {166}{166}{166}  {166} {166}{166}  {166}{166}  {166} {166}{166} {166} {166}{166}{166}  {166}         {166}    {166}  {166}{166}{166} {166}{166}{166}{166}{166} {166}{166}{166} {166}{166}{166}{166}{166}{166}  {166}{166}";
38PT=0:fOT=0to2:
39R=int(rN(1)*(21*18))+7724:ifpE(R)<>32tH39
40pOR,79+T:nE
!- initialize location and number of keys to zero
41SS=8185:T=0
!- store previous location, display status bar and handle player inputs
42OS=SS:goS70:pO36875,0:pO36878,0:gEA$:ifA$="p"aNSS>7702tHSS=SS-22
43ifA$="l"aNSS<8142tHSS=SS+22
44ifA$="a"aNSS>7680tHSS=SS-1
45ifA$="d"aNSS<8185tHSS=SS+1
!- if player hits blocks or door without keys get booted out with fail subroutine
46ifpE(SS)=102orpE(SS)=104aNT<3tHpO36879,27:goS77:gO69
!- if player collects key, keep track and play tone and see if they collected all of the keys
47ifpE(SS)=81orpE(SS)=79orpE(SS)=80tHT=T+1:pO36875,240+T:pO36878,7:ifT>2tHgoS51
!- if player hits the door and has the keys, collect item and invoke success subroutine
48ifpE(SS)=104tHA=A+1:IV=IV+4:pO36879,27:goS78:gO69
!- draw player in new position and if player move, erase old position and loop
49ifOS<>SStHpOOS,32
50pOSS,38:gO42
!- handle keys found subroutine sound chime and show the door.
51pO36877,240:pO7753,104:goS76:pO36877,0:reT
!- final game
!- draw level and initialize dino counter.
52pO36879,8:?"{clear}{white}":P=0
!- if missing items then display failure message and exit
53ifA<4tH?"you are missing items!":gO75
!- position dinos randomly and make sure they don't overlap
54PT=0:fOT=0to20
55R=int(rN(1)*(21*19))+7702:ifpE(R)<>32tH55
56pOR,94:nE
!- initi user and down.
57SS=8174:pO36878,7
!- display status bar
58goS70
!- draw player's bow and6handle user input
59pOSS,64:pOSS-1,85:pOSS+1,73:gEA$:ifA$="a"aNSS>8165tHpOSS+1,32:SS=SS-1
60ifA$="d"aNSS<8184tHpOSS-1,32:SS=SS+1
61ifA$="p"tHpO36875,240:goS64
!- all creatures dead, display success. otherwise loop.
62ifP>20tHgO73
63gO58
!- bow firing subroutine draw "wave" and make sure that to count and dinos hit and play sound when hit.
64pO36875,0:fOQ=SS-22toSS-(22*21)stE-22
65ifpE(Q+1)=94tHP=P+1:pO36877,145
66ifpE(Q-1)=94tHP=P+1:pO36877,135
67ifpE(Q)=94tHP=P+1:pO36877,150
68pO36877,0:pOQ,99:pOQ-1,78:pOQ+1,77:pOQ+22,32:pOQ+21,32:pOQ+23,32:nE:pOQ+22,32:pOQ+21,32:pOQ+23,32:pO36877,0:reT
!- routine to go back to main screen, position character to previous location and go back to overworld map to the redraw.
69S=BS:A$="":gO2
!- status bar, first calculate the time left, display status bar and if time runs out go to failure message.
70CD=(MT-int(TI/60)+1):if(CD<>PT)tH?"{home}items:{left}";A;"{home}items:{right*8}time:{space*3}{left*4}";CD;"{home}{right*14}time:":PT=CD
71ifCD<1tHgO74
72reT
!- success message
73?"{clear}{white}congrats! you saved   the village!":gO75
!- failure message (timeout)
74?"{clear}the dinos destroyed    the village!":gO75
!- wait to restart subroutine
75goS79:?"press any key...":wA198,1:pO198,0:gO1
!- wait 5 jiffies subroutine
76fOt=1to50:nE:reT
!-76SW=TI+5
!-77ifTI<SWthen77
!-78return
!- failure sound.
77pO36877,128:fOP=15to0stE-1:pO36878,P:nE:goS79:reT
!- item get sound
78pO36878,7:pO36875,195:goS76:pO36875,225:goS76:goS79:reT
!- shutoff sound subroutine
79pO36877,0:pO36875,0:pO36576,0:pO36874,0:pO36878,0:reT