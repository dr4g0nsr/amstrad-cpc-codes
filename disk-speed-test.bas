10 ' Load the code
20 MEMORY &4000
30 LOAD "rpm.bin"
40 MODE 2:BORDER 0:INK 0,0:INK 1,19
50 PRINT "RPM v1.1  (c)2013 Brice Rive."
60 PRINT "Measure drive rotation speed."
70 PRINT "From an idea by Philippe Depre and Simon Owen."
90 ' get pointers
100 rpm1=PEEK(&4003)+256*PEEK(&4004)
110 rpm2=PEEK(&4005)+256*PEEK(&4006)
120 DrivePt=PEEK(&4007)+256*PEEK(&4008)
130 TimePt=PEEK(&4009)+256*PEEK(&400A)
140 TrackPt=PEEK(&400B)+256*PEEK(&400C)
150 LOCATE 1,9: PRINT "Drive: "
160 LOCATE 1,10: PRINT "Track: "
170 PRINT "  Use arrow keys to change drive/track"
180 IF track<0 THEN track=0
190 IF track>40 THEN track=40
200 IF drive<0 THEN drive=0
210 IF drive>1 THEN drive=1
220 LOCATE 7,9:PRINT drive
230 LOCATE 7,10:PRINT track
250 POKE DrivePt,drive
260 POKE TrackPt,track
270 CALL rpm1
280 CALL rpm2
290 count=PEEK(timept)+256*PEEK(timept+1)
300 ' count is the number of times the 20us looped
310 rpm=1000000/(count*20)*120
320 REM LOCATE 2,12:PRINT "Cnt: ",count
330 LOCATE 2,13:PRINT "Rpm: ",rpm
340 IF INKEY(0)=0 THEN track=track+1
350 IF INKEY(2)=0 THEN track=track-1
360 IF INKEY(1)=0 THEN drive=drive+1
370 IF INKEY(8)=0 THEN drive=drive-1
380 GOTO 180
