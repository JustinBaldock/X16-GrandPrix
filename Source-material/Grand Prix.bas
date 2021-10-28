10 print chr$(147)
20 print "-= grand prix =-" 
25 print "use < and > to steer" 
30 gosub 1000 : rem set up sprite
40 print
50 input "level 1 to 5";d
60 if d < 1 or d > 5 then 50
70 l=9+d:r=31-d
80 print chr$(147)
85 for t= 1 to 1000 : next t
90 for t = 1 to 15
100 print tab(l);"**";tab(r);"**" 
110 next t
120 ti$="000000" 
130 poke v+31,0
200 print tab(l);"**";tab(r);"**" 
210 q=int(3*rnd(0))-1
220 if l+q<0 or r+q > 38 then q=0
230 l=l+q:r=r+q
240 gosub 2000 : rem read keyboard
250 goto 200
999 rem sprite
1000 v=53248
1010 DATA 0,248,0,1,4,0,0,248,0,29,37,192
1020 DATA 31,87,192,31,87,192,29,253,192,1,4,0
1030 DATA 0,168,0,0,168,0,0,168,0,0,168,0
1040 DATA 0,136,0,0,136,0,14,83,128,15,223,128
1050 DATA 15,223,128,14,83,128,1,252,0,1,4,0
1060 DATA 0,248,0
1070 poke 2041,13 : rem sprite 1 in block 13
1080 for g = 0 to 62 : rem set up data
1090 read h
1100 poke 832+g,h
1110 next g
1120 poke v+21,2 : rem enable sprite 1
1130 poke v+40,7 : rem colour it yellow
1140 poke v+23,2 : rem expand vertically
1150 poke v+29,2 : rem expand horizontally
1160 x=168 : rem horizontal coordinate
1170 poke v+2,x:poke v+3,100 : rem position it
1180 return
2000 rem read keyboard
2010 p = peek(197)
2020 if p=47 then x=x-3 : rem move left if < hit
2030 if p=44 then x=x+3 : rem move right if > hit
2040 gosub 3000 : rem move sprite
2050 if (peek(v+31) and 2) = 2 then 4000 : rem test for crash
2060 return
3000 rem move sprite sideways
3010 if x>255 then of = 1
3020 poke v+2,x-256*of
3030 if of = 0 then poke v+16,0
3040 if of = 1 then poke v+16,2
3050 of=0
3060 return
4000 rem finish
4010 m$=ti$ : rem read clock
4020 for n=1 to 25 : rem flash screen
4030 poke 53281,15*rnd(0)
4040 next n
4050 poke 53281,6 : rem screen to blue
4060 print chr$(19)
4070 print : print
4080 print "-------------" 
4090 print "crashed after" 
4100 print val(left$(m$,2));"hours        " 
4110 print val(mid$(m$,3,2));"minutes      " 
4120 print val(right$(m$,2));"seconds      " 
4130 print "-------------" 
4140 stop