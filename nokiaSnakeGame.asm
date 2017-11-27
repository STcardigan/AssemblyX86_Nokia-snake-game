.model	tiny  	
	org		0100h		
.data 
seed dw  0

;========piano==========
delaynote dw ?

MIDI_CONTROL_PORT dw 0331h
MIDI_DATA_PORT dw 0330h
MIDI_UART_MODE db 3Fh
MIDI_PIANO_INSTRUMENT db 93h

delaytime dw 0

posXhead db 30
posYhead db 20
posValueHead dw 1230
 
posXtail db 30
posYtail db 23
posValueTail dw 1410
count_time dw 0
count_rand_time dw 0

posXrand db 0 
posYrand db 0
posValueRand dw 0

status db 1
statusRand db 0
statusEat db 0

str_score db "score :$",0

score0 db 0
score1 db 0
score2 db 0
score3 db 0

	  ;0                   1                   2                   3                   4                   5                
	  ;0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9
map db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;1
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;2
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;3
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;4
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;5
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;6
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;7
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;8
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;9
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;10
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;11
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;12
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;13
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;14
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;15
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;16
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;17
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;18
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;19
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;20
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;21
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;22
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;23
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;24
	; 1=up 2=down 3=left 4=right 5=wall
	
posXprint db 0
posYprint db 0
posValuePrint dw 0
countPG db 0
zeroPage db 0
			 ;0                   1                   2                   3                   4                   5                   6                   7  
	         ;0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9
firstPage1 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		   db 0,0,0,0,2,4,4,4,4,0,0,1,0,0,0,0,4,0,0,0,5,3,2,0,0,0,5,0,0,1,0,0,3,3,3,3,0,0,0,0,0,0,0,4,4,4,4,0,0,0,4,1,3,0,0,0,4,0,0,0,4,0,0,1,1,1,1,0,0,0,4,4,4,4,4,4,4,4,4,4
			
firstPage2 db 0,0,0,0,2,2,0,0,4,0,0,1,1,0,0,4,0,0,0,5,5,0,2,2,0,0,5,0,1,1,0,0,4,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,4,4,0,3,3,0,0,4,2,0,5,4,0,0,1,0,0,0,0,0,4,4,1,3,4,4,4,4,4,4,4
		   db 0,0,0,0,0,2,0,0,0,0,0,4,1,2,0,0,4,0,0,5,2,0,0,2,0,0,5,5,1,0,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,4,0,0,0,3,0,0,4,2,0,5,4,0,0,4,4,0,0,0,0,4,4,3,3,4,4,4,4,4,4,4
           db 0,0,0,0,0,0,5,0,0,0,0,4,0,2,2,0,4,0,0,4,1,1,1,4,0,0,4,4,3,0,0,0,3,3,0,0,0,0,0,0,0,0,1,0,0,3,3,0,0,5,2,2,2,5,0,0,4,0,3,0,4,0,0,2,2,0,0,0,0,4,4,4,4,4,4,4,4,4,4,4

firstPage3 db 0,0,0,0,0,0,0,5,0,0,0,4,0,0,2,5,4,0,0,4,0,0,0,4,0,0,4,0,3,3,0,0,2,2,0,0,0,0,0,0,0,0,2,0,0,0,3,0,0,5,0,0,0,5,0,0,4,0,0,0,4,0,0,5,5,0,0,0,0,4,4,4,4,4,4,4,4,4,4,4
           db 0,0,0,0,4,0,0,5,5,0,0,4,0,0,0,5,5,0,0,4,0,0,0,4,0,0,4,0,0,3,0,0,5,0,0,0,0,0,0,0,0,0,2,2,0,5,5,0,0,5,0,0,0,5,0,0,4,0,0,0,4,0,0,3,0,0,0,0,0,0,4,4,4,4,4,4,4,4,4,4
           db 0,0,0,0,4,4,4,4,5,0,0,1,0,0,0,0,5,0,0,4,0,0,0,4,0,0,4,0,0,3,0,0,5,5,5,5,0,0,0,0,0,0,0,2,5,5,0,0,0,5,0,0,0,5,0,0,4,0,0,0,4,0,0,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0

firstPage4 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,1,1,0,0,0,4,0,0,4,4,4
           db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,4,0,0,3,0,4,0,5,0,0,0,3

firstPage5 db 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,5,5,0,4,0,0,3,0,0,0,5,0,0,5,0
           db 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,3,4,4,0,0,0,0,5,5,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0,0,4,0,0,3,0,0,0,5,0,0,2,0
           db 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,3,4,4,0,0,0,0,5,5,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,4,0,0,3,0,0,0,5,0,0,2,0

firstPage6 db 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3,3,4,4,0,0,0,0,5,5,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,5,5,0,0,0,0,0,5,0,0,2,0
           db 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,4,4,4,4,4,4,4,4,4,0,0,0,0,5,5,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,4,4,4,4,4,4,4,4,0,0,0,0,5,5,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

firstPage7 db 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,4,4,4,4,4,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

firstPage8 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
SPkey	db	'.. Press spacebar to select map$'
gameover db "Game Over!$",0

memuDraw1 db 9,218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,9,9,9,218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,10,13
		  db 9,179,'                  ',179,9,9,9,179,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,179,10,13
          db 9,179,'                  ',179,9,9,9,179,178,'                ',178,179,10,13
		  db 9,179,'                  ',179,9,9,9,179,178,'                ',178,179,10,13
		  db 9,179,'                  ',179,9,9,9,179,178,'                ',178,179,10,13
		  db 9,179,'                  ',179,9,9,9,179,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,179,10,13
		  db 9,192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,9,9,9,192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,'$'

memuDraw2 db 9,218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,9,9,9,218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,10,13
		  db 9,179,178,178,'              ',178,178,179,9,9,9,179,178,178,'              ',178,178,179,10,13
          db 9,179,178,'                ',178,179,9,9,9,179,178,'                ',178,179,10,13
		  db 9,179,'                  ',179,9,9,9,179,'       ',178,'  ',178,'       ',179,10,13
		  db 9,179,178,'                ',178,179,9,9,9,179,178,'                ',178,179,10,13
		  db 9,179,178,178,'              ',178,178,179,9,9,9,179,178,178,'              ',178,178,179,10,13
		  db 9,192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,9,9,9,192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,'$'
map12 db "Map 1                                    Map 2$"
map34 db "Map 3                                    Map 4$"
posMenuX db 13 ;54
posMenuY db 11 ;22
mode db 1 ;1,2,3,4


			 
.code
org     0100h
			
		
main:
	mov ah, 00h     ; Set back to 80x25
	mov al, 03h
	int 10h 
	
	call startpage
	ret
;===========================Piano Sound=====================================

PauseIt proc near uses ax cx es
        mov  cx, delaynote
        mov  ax,0040h
        mov  es,ax

        ; wait for it to change the first time
        mov  al,es:[006Ch]
@a:     cmp  al,es:[006Ch]
        je   short @a

        ; wait for it to change again
loop_it:mov  al,es:[006Ch]
@b:     cmp  al,es:[006Ch]
 		
        je   short @b

        sub  cx,55
        jns  short loop_it
        ret
PauseIt endp
	
play_note:
    add al, ch;             apply the octave
    out dx, al;             DX will already contain MIDI_DATA_PORT from the setup_midi function
    mov al, 7Fh;            note duration
    out dx, al
    ret
	
setup_midi:
    push ax

    mov dx, MIDI_CONTROL_PORT
    mov al, MIDI_UART_MODE; play notes as soon as they are recieved
    out dx, al

    mov dx, MIDI_DATA_PORT
    mov al, MIDI_PIANO_INSTRUMENT
    out dx, al

    pop ax
    ret	

;octave 4 = 0*12 + 60 = 60
;octave 5 = 1*12 + 60 = 72
;octave 6 = 2*12 + 60 = 84
;octave 7 = 3*12 + 60 = 96


;=======================================================================================================================

C0: call setup_midi
    mov ch, 0;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 0
    call play_note
    call PauseIt
    ret

C1: call setup_midi
    mov ch, 24;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 0
    call play_note
    call PauseIt
    ret

D1: call setup_midi
    mov ch, 24;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 2
    call play_note
    call PauseIt
    ret

E1: call setup_midi
    mov ch, 24;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 4
    call play_note
    call PauseIt
    ret

F1: call setup_midi
    mov ch, 24;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 5
    call play_note
    call PauseIt
    ret

G1: call setup_midi
    mov ch,24;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 7
    call play_note
    call PauseIt
    ret

A1: call setup_midi
    mov ch, 24;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 9
    call play_note
    call PauseIt
    ret

B1: call setup_midi
    mov ch, 24;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 11
    call play_note
    call PauseIt
    ret

C1s: call setup_midi
     mov ch, 24;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 1
     call play_note
     call PauseIt
     ret

D1s: call setup_midi
     mov ch, 24;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 3
     call play_note
     call PauseIt
     ret

E1s: jmp F1
     ret

F1s: call setup_midi
     mov ch, 24;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves 
     mov al, 6
     call play_note
     call PauseIt
     ret

G1s: call setup_midi
     mov ch, 24;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 8
     call play_note
     call PauseIt
     ret

A1s: call setup_midi
     mov ch, 24;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 10
     call play_note
     call PauseIt
     ret

B1s: jmp B1
     ret
     ;====1

C2: call setup_midi
    mov ch, 36;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 0
    call play_note
    call PauseIt
    ret

D2: call setup_midi
    mov ch, 36;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 2
    call play_note
    call PauseIt
    ret

E2: call setup_midi
    mov ch, 36;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 4
    call play_note
    call PauseIt
    ret

F2: call setup_midi
    mov ch, 36;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 5
    call play_note
    call PauseIt
    ret

G2: call setup_midi
    mov ch,36;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 7
    call play_note
    call PauseIt
    ret

A2: call setup_midi
    mov ch, 36;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 9
    call play_note
    call PauseIt
    ret

B2: call setup_midi
    mov ch, 36;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 11
    call play_note
    call PauseIt
    ret

C2s: call setup_midi
     mov ch, 36;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 1
     call play_note
     call PauseIt
     ret

D2s: call setup_midi
     mov ch, 36;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 3
     call play_note
     call PauseIt
     ret

E2s: jmp F2
     ret

F2s: call setup_midi
     mov ch, 36;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves 
     mov al, 6
     call play_note
     call PauseIt
     ret

G2s: call setup_midi
     mov ch, 36;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 8
     call play_note
     call PauseIt
     ret

A2s: call setup_midi
     mov ch, 36;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 10
     call play_note
     call PauseIt
     ret

B2s: jmp B2
     ret
     ;====2

	
C3: call setup_midi
    mov ch, 48;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 0
    call play_note
    call PauseIt
    ret

D3: call setup_midi
    mov ch, 48;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 2
    call play_note
    call PauseIt
    ret

E3: call setup_midi
    mov ch, 48;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 4
    call play_note
    call PauseIt
    ret

F3: call setup_midi
    mov ch, 48;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 5
    call play_note
    call PauseIt
    ret

G3: call setup_midi
    mov ch,48;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 7
    call play_note
    call PauseIt
    ret

A3: call setup_midi
    mov ch, 48;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 9
    call play_note
    call PauseIt
    ret

B3: call setup_midi
    mov ch, 48;             default octave(0)
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 11
    call play_note
    call PauseIt
    ret

C3s: call setup_midi
     mov ch, 48;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 1
     call play_note
     call PauseIt
     ret

D3s: call setup_midi
     mov ch, 48;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 3
     call play_note
     call PauseIt
     ret

E3s: jmp F3
     ret

F3s: call setup_midi
     mov ch, 48;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves 
     mov al, 6
     call play_note
     call PauseIt
     ret

G3s: call setup_midi
     mov ch, 48;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 8
     call play_note
     call PauseIt
     ret

A3s: call setup_midi
     mov ch, 48;             default octave(0)
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 10
     call play_note
     call PauseIt
     ret

B3s: jmp B3
     ret
	 


;=======================================================================================================================
C4: call setup_midi
    mov ch, 60;            
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 0
    call play_note
    call PauseIt
    ret

D4: call setup_midi
    mov ch, 60;             
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 2
    call play_note
    call PauseIt
    ret

E4: call setup_midi
    mov ch, 60;           
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 4
    call play_note
    call PauseIt
    ret

F4: call setup_midi
    mov ch, 60;             
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 5
    call play_note
    call PauseIt
    ret

G4: call setup_midi
    mov ch, 60;             
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 7
    call play_note
    call PauseIt
    ret

A4: call setup_midi
    mov ch, 60;       
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 9
    call play_note
    call PauseIt
    ret

B4: call setup_midi
    mov ch, 60;             
    mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 11
    call play_note
    call PauseIt
    ret

C4s: call setup_midi
     mov ch, 60;             
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 1
     call play_note
     call PauseIt
     ret

D4s: call setup_midi
     mov ch, 60;             
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 3
     call play_note
     call PauseIt
     ret

E4s: jmp F4
     ret

F4s: call setup_midi
     mov ch, 60;             
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves 
     mov al, 6
     call play_note
     call PauseIt
     ret

G4s: call setup_midi
     mov ch, 60;             
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 8
     call play_note
     call PauseIt
     ret

A4s: call setup_midi
     mov ch, 60;            
     mov cl, 5;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 10
     call play_note
     call PauseIt
     ret

B4s: jmp B4
     ret
	 

	
;=============================================================================================================
C5: call setup_midi
    mov ch, 72;             
    mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 0
    call play_note
    call PauseIt
    ret

D5: call setup_midi
    mov ch, 72;            
    mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 2
    call play_note
    call PauseIt
    ret
E5: call setup_midi
    mov ch, 72;             
    mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 4
    call play_note
    call PauseIt
    ret
F5: call setup_midi
    mov ch, 72;             default octave(1)
    mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 5
    call play_note
    call PauseIt
    ret
G5: call setup_midi
    mov ch, 72;             default octave(1)
    mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 7
    call play_note
    call PauseIt
    ret
A5: call setup_midi
    mov ch, 72;             default octave(1)
    mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 9
    call play_note
    call PauseIt
    ret

B5: call setup_midi
    mov ch, 72;             default octave(1)
    mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 11
    call play_note
    call PauseIt
    ret

C5s: call setup_midi
     mov ch, 72;             default octave(1)
     mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 1
     call play_note
     call PauseIt
     ret

D5s: call setup_midi
     mov ch, 72;             
     mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 3
     call play_note
     call PauseIt
     ret

E5s: jmp F5
     ret

F5s: call setup_midi
     mov ch, 72;             
     mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves 
     mov al, 6
     call play_note
     call PauseIt
     ret
G5s: call setup_midi
     mov ch, 72;             
     mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 8
     call play_note
     call PauseIt
     ret

A5s: call setup_midi
     mov ch, 72;             
     mov cl, 6;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 10
     call play_note
     call PauseIt
     ret

B5s: jmp B5
     ret


	
;=====================================================================================================================
C6: call setup_midi
    mov ch, 84;             
    mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 0
    call play_note
    call PauseIt
    ret

D6: call setup_midi
    mov ch, 84;            
    mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 2
    call play_note
    call PauseIt
    ret
E6: call setup_midi
    mov ch, 84;             
    mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 4
    call play_note
    call PauseIt
    ret
F6: call setup_midi
    mov ch, 84;            
    mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 5
    call play_note
    call PauseIt
    ret
G6: call setup_midi
    mov ch, 84;             
    mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 7
    call play_note
    call PauseIt
    ret
A6: call setup_midi
    mov ch, 84;             
    mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 9
    call play_note
    call PauseIt
    ret

B6: call setup_midi
    mov ch, 84;            
    mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 11
    call play_note
    call PauseIt
    ret

C6s: call setup_midi
     mov ch, 84;            
     mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 1
     call play_note
     call PauseIt
     ret

D6s: call setup_midi
     mov ch, 84;             
     mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 3
     call play_note
     call PauseIt
     ret

E6s: jmp F6
     ret

F6s: call setup_midi
     mov ch, 84;             
     mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves 
     mov al, 6
     call play_note
     call PauseIt
     ret
G6s: call setup_midi
     mov ch, 84;            
     mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 8
     call play_note
     call PauseIt
     ret

A6s: call setup_midi
     mov ch, 84;             
     mov cl, 7;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 10
     call play_note
     call PauseIt
     ret

B6s: jmp B6
     ret


;=====================================================================

C7: call setup_midi
    mov ch, 96;             
    mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 0
    call play_note
    call PauseIt
    ret

D7: call setup_midi
    mov ch, 96;           
    mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 2
    call play_note
    call PauseIt
    ret
E7: call setup_midi
    mov ch, 96;            
    mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 4
    call play_note
    call PauseIt
    ret
F7: call setup_midi
    mov ch, 96;             
    mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 5
    call play_note
    call PauseIt
    ret
G7: call setup_midi
    mov ch, 96;             
    mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 7
    call play_note
    call PauseIt
    ret
A7: call setup_midi
    mov ch, 96;             
    mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 9
    call play_note
    call PauseIt
    ret

B7: call setup_midi
    mov ch, 96;            
    mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves
    mov al, 11
    call play_note
    call PauseIt
    ret

C7s: call setup_midi
     mov ch, 96;             
     mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 1
     call play_note
     call PauseIt
     ret

D7s: call setup_midi
     mov ch, 96;            
     mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 3
     call play_note
     call PauseIt
     ret

E7s: jmp F7
     ret

F7s: call setup_midi
     mov ch, 96;            
     mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves 
     mov al, 6
     call play_note
     call PauseIt
     ret
G7s: call setup_midi
     mov ch, 96;             
     mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 8
     call play_note
     call PauseIt
     ret

A7s: call setup_midi
	 mov ch, 96;            
     mov cl, 8;              used for making sure that the user does not go too low or too high with the octaves
     mov al, 10
     call play_note
     call PauseIt
     ret

B7s: jmp B7
     ret

;======================================================================================
music_intro:  ; intro music gen by F above
	
	mov delaynote,100
	call C6
	call D6
	call E6
	mov delaynote,10
	call G3
	call D4
	call E4
	call G5
	call E5
	mov delaynote,100
	call E6
	call G6
	call F6
	call E6
	call D6
	mov delaynote,10
	call B5
	call G5
	call G3
	call B3
	call D4
	mov delaynote,100
	call G5
	call B3
	call C4
	call D4
	call G4
	mov delaynote,100
	call B5
	call C6
	call D6
	call E6
	call F6
	mov delaynote,10
	call B3
	call G5s
	call E6
	mov delaynote,100
	call E6
	call D6
	mov delaynote,80
	call D6
	call C6
	call C6
	mov delaynote,100
	call G6
	mov delaynote,80
	call F6
	call E6
	call D6
	mov delaynote,100
	call C6
	call D6
	call G6
	mov delaynote,80
	call F6
	call E6
	mov delaynote,100
	call C6
	call D6
	mov delaynote,10
	call D6
	call D6
	call D6
	call D6
	
    ret	
	
music_over:  ; end music gen by F above
	mov delaynote,0
	call G1
	call B2
	call G3
	call G1
	call B2
	call G3
	call G1
	call B2
	call G3
	call G1
	call B2
	call G3
	mov delaynote,80
	call G1
	call B2
	call G3
	mov delaynote,90
	call F5
	mov delaynote,10
	call A2
	mov delaynote,0
	call B2
	call F5
	mov delaynote,80
	call F5
	mov delaynote,10
	mov delaynote,0
	call B2
	call F5
	mov delaynote,100
	call F5
	call E5
	call C5
	ret
;======================================================================================
;--------------------------------------------------------
	
white :
  call setCursor
    mov     ah, 09h
    mov     al, ' '
    mov     cx, 1
    mov     bl, 0FFh  ; F- white
    int     10h
ret
brown :
  call setCursor
    mov     ah, 09h
    mov     al, ' '
    mov     cx, 1
    mov     bl, 066h    ; 1,9-BBlue 2-green
    int     10h
ret
orange :
  call setCursor
    mov     ah, 09h
    mov     al, ' '
    mov     cx, 1
    mov     bl, 0EEh  ;; 6,E-Orange 3,B-WBlue  ,5-violet
    int     10h
ret
green :
  call setCursor
    mov     ah, 09h
    mov     al, ' '
    mov     cx, 1
    mov     bl, 022h    ; 1,9-BBlue 2-green
    int     10h
ret
red :
  call setCursor
    mov     ah, 09h
    mov     al, ' '
    mov     cx, 1
    mov     bl, 044h  ;; 6,E-Orange 3,B-WBlue  ,5-violet
    int     10h
ret
	
startpage:
	mov ah, 00h     ; Set back to 80x25
	mov al, 03h
	int 10h 

	Looppage:

		mov bx, posValuePrint
		
		cmp countPG,1
		je PG1
		cmp countPG,2
		je PG2
		cmp countPG,3
		je PG3
		cmp countPG,4
		je PG4
		cmp countPG,5
		je PG5
		cmp countPG,6
		je PG6
		cmp countPG,7
		je PG7
		
		PG0:
		mov dh,firstPage1[bx]
		mov zeroPage,dh
		jmp EndsetzeroPage
		PG1:
		mov dh,firstPage2[bx]
		mov zeroPage,dh
		jmp EndsetzeroPage
		PG2:
		mov dh,firstPage3[bx]
		mov zeroPage,dh
		jmp EndsetzeroPage
		PG3:
		mov dh,firstPage4[bx]
		mov zeroPage,dh
		jmp EndsetzeroPage
		PG4:
		mov dh,firstPage5[bx]
		mov zeroPage,dh
		jmp EndsetzeroPage
		PG5:
		mov dh,firstPage6[bx]
		mov zeroPage,dh
		jmp EndsetzeroPage
		PG6:
		mov dh,firstPage7[bx]
		mov zeroPage,dh
		jmp EndsetzeroPage
		PG7:
		mov dh,firstPage8[bx]
		mov zeroPage,dh
		jmp EndsetzeroPage
		
		EndsetzeroPage:
		mov dh, posYprint      ;y  ; set side wall
		mov dl, posXprint     ;x  
		
		cmp zeroPage,0
		je  nextPrint
		cmp zeroPage,1
		je  printBrown
		cmp zeroPage,2
		je  printOrange
		cmp zeroPage,3
		je  printWhite
		cmp zeroPage,4
		je  printGreen
		cmp zeroPage,5
		je  printRed
		
        printBrown : call brown
        jmp nextPrint

        printOrange : call orange
        jmp nextPrint

        printWhite : call white
        jmp nextPrint

        printGreen : call green
        jmp nextPrint

        printRed : call red
        jmp nextPrint

        nextPrint :
		inc posXprint
		inc posValuePrint
		cmp posXprint, 79
		jle incol
		
		mov posXprint, 0
		inc posYprint
		cmp posYprint, 24
		jae endprintpage
		
		incol:
		cmp posValuePrint, 240
		jl NOchPG
		
		mov posValuePrint,0
		inc countPG
		
		NOchPG:
		jmp Looppage
		
		endprintpage:
		
		mov ah,02h     ; set curcor position
		mov bh,00h
		mov dh,20
		mov dl,24
		int 10h
	
		call music_intro
		
		mov ah, 09h													
		mov dx, offset SPkey
		int 21h
		
		jmp waitforKey
				
waitforKeyCHK :
		mov		ah, 00h
		int		16h
		cmp		ah,	39h
		jz		menu

waitforKey:		
	mov		ah, 01h		; key press?
	int		16h
	jnz		waitforKeyCHK
	
	jmp waitforKey

menu: 
		mov ah, 00h     ; Set back to 80x25
		mov al, 03h
		int 10h 
		
		mov	ah, 02h
		mov	bh, 00h
		mov	dh, 3
		mov	dl, 3
		int	10h
		
		mov	ah, 09h
		mov	dx, offset memuDraw1	;print
		int	21h	
		
		mov	ah, 02h
		mov	bh, 00h
		mov	dh, 11
		mov	dl, 15
		int	10h
		
		mov	ah, 09h
		mov	dx, offset map12	;print
		int	21h	
		
		mov	ah, 02h
		mov	bh, 00h
		mov	dh, 14
		mov	dl, 3
		int	10h
		
		mov	ah, 09h
		mov	dx, offset memuDraw2	;print
		int	21h	
		
		mov	ah, 02h
		mov	bh, 00h
		mov	dh, 22
		mov	dl, 15
		int	10h
		
		mov	ah, 09h
		mov	dx, offset map34	;print
		int	21h	
		
		mov dh, posMenuY     ;y  ; set begin snake
		mov dl, posMenuX     ;x
		call setCursor
		mov al, 254
		mov bl, 0Ch
		call printCHAR	
		

selectMenu:
		mov		ah, 01h		; key press?
		int		16h
		jnz		checkKeyMenu
		
		mov dh, posMenuY     ;y  ; set begin snake
		mov dl, posMenuX     ;x
		call setCursor
		mov al, 254
		mov bl, 0Ch
		call printCHAR	
		
		jmp selectMenu
		
		
;====================================		
checkKeyMenu: ;check what the key was 
		mov		ah, 00h
		int		16h
		;cmp		al, 1Bh
		;jz		setscreentmp
		cmp		al, 0Dh
		jz		setselecttmp ;enter
		cmp		ah, 4bh
		jz		leftKeyMenu
		cmp		ah,	4dh
		jz		rightKeyMenu
		cmp		ah, 48h
		jz		upKeyMenu
		cmp		ah,	50h
		jz		downKeyMenu
		cmp		ah,	39h     ;space
		jz		selectMenu
	
		jmp     selectMenu
;--------------------------------------------------------	
	
leftKeyMenu:
	cmp posMenuX,13
	je checkKeyMenu

	mov dh,posMenuY
	mov dl,posMenuX
	call setCursor
	mov al, 00h ;Print null
	mov bl, 06h ;black color
	call printCHAR
	
	dec mode
	mov posMenuX, 13
	
	jmp selectMenu
		
rightKeyMenu:
	cmp posMenuX,54
	je checkKeyMenu
	
	mov dh,posMenuY
	mov dl,posMenuX
	call setCursor
	mov al, 00h ;Print null
	mov bl, 06h ;black color
	call printCHAR
	
	inc mode
	mov posMenuX, 54
	jmp selectMenu
;--------------------------------------------------	
setselecttmp: jmp setselect
checkKeyMenutmp : jmp checkKeyMenu
;--------------------------------------------------
upKeyMenu:
	cmp posMenuY,11
	je checkKeyMenu
	
	mov dh,posMenuY
	mov dl,posMenuX
	call setCursor
	mov al, 00h ;Print null
	mov bl, 06h ;black color
	call printCHAR
	
	sub mode,2
	mov posMenuY, 11
	jmp selectMenu

downKeyMenu:
	cmp posMenuY,22
	je checkKeyMenutmp
	
	mov dh,posMenuY
	mov dl,posMenuX
	call setCursor
	mov al, 00h ;Print null
	mov bl, 06h ;black color
	call printCHAR
	
	add mode,2
	mov posMenuY, 22
	jmp selectMenu
	
setselect:
	cmp mode,1
	je map1Gen
	cmp mode,2
	je map2Gen
	cmp mode,3
	je map3Gen
	cmp mode,4
	je map4Gen

map1Gen: 
		mov ah, 00h     ; Set back to 80x25
		mov al, 03h
		int 10h 
		jmp setscreen
		
map2Gen: 
		call map2GenBuild
		jmp setscreen
map3Gen: 
		call map3GenBuild
		jmp setscreen
map4Gen: 
		call map4GenBuild
		jmp setscreen


	setscreen:

			
		mov dh, 0      ;y  ; set side wall
		mov dl, 60     ;x
		
		MOV	CL, 25
		mov al, 186
		mov bl, 0Ch
		
		
		L1:             ; print edge
			call setCursor
			call printCHAR
			inc dh
			DEC	CL
			JNZ	L1
			
		mov dh, 23      ;y  ; set begin snake
		mov dl, 30     ;x
		
		MOV	CL, 4
		mov al, 254
		mov bl, 0Ch
		
		L2:             ; print edge
			call setCursor
			call printCHAR
			dec dh
			DEC	CL
			JNZ	L2
			
		mov ah,02h     ; set curcor position
		mov bh,00h
		mov dh,21
		mov dl,64
		int 10h
		
		mov ah, 09h													
		mov dx, offset str_score
		int 21h
		call printScore
		jmp begingame

;===================================
map2GenBuild:
		mov ah, 00h     ; Set back to 80x25
		mov al, 03h
		int 10h 
		
		;-----print--------
		;mov dh, 0      ;y  ; set side wall
		mov dl, 0     ;x	
		
		mov al, 178
		mov bl, 09h
		
		MOV	CL, 60
		M2_1: 
			mov dh, 0      ;y  ; set side wall; print edge
			call setCursor
			call printCHAR
			
			mov dh, 24
			call setCursor
			call printCHAR
			
			inc dl
			
			DEC	CL
			JNZ	M2_1
			
			
		mov dh, 0      ;y  ; set side wall	
		
		mov al, 178
		mov bl, 09h
		
		MOV	CL, 25
		M2_2: 
			mov dl, 0      ;y  ; set side wall; print edge
			call setCursor
			call printCHAR
			
			mov dl, 59
			call setCursor
			call printCHAR
			
			inc dh
			
			DEC	CL
			JNZ	M2_2
			
		;------val-------
		mov bx, 0
		MOV	CL, 60
		M2_3: 
			mov map[bx],5 ;up
			inc bx
		
			DEC	CL
			JNZ	M2_3	
		
		mov bx, 1440
		MOV	CL, 60
		M2_4: 
			mov map[bx],5 ;down
			inc bx
		
			DEC	CL
			JNZ	M2_4
			
		mov bx, 60
		MOV	CL, 23
		M2_5: 
			mov map[bx],5 ;left
			add bx,60
		
			DEC	CL
			JNZ	M2_5		
			
		mov bx, 119
		MOV	CL, 23
		M2_6: 
			mov map[bx],5 ;right
			add bx,60
		
			DEC	CL
			JNZ	M2_6
	
		ret
;--------------------------------------------------		
map3GenBuild:
		mov ah, 00h     ; Set back to 80x25
		mov al, 03h
		int 10h 
		
		;-----print--------
		;mov dh, 0      ;y  ; set side wall
		mov dl, 0     ;x	
		mov al, 178
		mov bl, 09h
		
		MOV	CL, 15
		M3_1: 
			mov dh, 0      ;y  ; set side wall; print edge
			call setCursor
			call printCHAR
			
			mov dh, 24
			call setCursor
			call printCHAR
			
			inc dl
			
			DEC	CL
			JNZ	M3_1
			
		mov dl, 45     ;x	
		mov al, 178
		mov bl, 09h
		
		MOV	CL, 15
		
		M3_2: 
			mov dh, 0      ;y  ; set side wall; print edge
			call setCursor
			call printCHAR
			
			mov dh, 24
			call setCursor
			call printCHAR
			
			inc dl
			
			DEC	CL
			JNZ	M3_2
			
		mov dh, 1    ;x	
		mov al, 178
		mov bl, 09h
		
		MOV	CL, 5
		
		M3_3: 
			mov dl, 0      ;y  ; set side wall; print edge
			call setCursor
			call printCHAR
			
			mov dl, 59
			call setCursor
			call printCHAR
			
			inc dh
			
			DEC	CL
			JNZ	M3_3
			
		mov dh, 19    ;x	
		mov al, 178
		mov bl, 09h
		
		MOV	CL, 5
		
		M3_4: 
			mov dl, 0      ;y  ; set side wall; print edge
			call setCursor
			call printCHAR
			
			mov dl, 59
			call setCursor
			call printCHAR
			
			inc dh
			
			DEC	CL
			JNZ	M3_4
			
		;------val-------
		mov bx, 0
		MOV	CL, 15
		M3_1v: 
			mov map[bx], 5
			inc bx
			
			DEC	CL
			JNZ	M3_1v
			
		mov bx, 45
		MOV	CL, 15
		M3_2v: 
			mov map[bx], 5
			inc bx
			
			DEC	CL
			JNZ	M3_2v
		
		;----------------		
		mov bx, 60
		MOV	CL, 5
		M3_3v: 
			mov map[bx], 5
			add bx, 60
			
			DEC	CL
			JNZ	M3_3v
			
		mov bx, 119
		MOV	CL, 5
		M3_4v: 
			mov map[bx], 5
			add bx, 60
			
			DEC	CL
			JNZ	M3_4v
		
		mov bx, 1140
		MOV	CL, 5
		M3_5v: 
			mov map[bx], 5
			add bx, 60
			
			DEC	CL
			JNZ	M3_5v
			
		mov bx, 1079
		MOV	CL, 5
		M3_6v: 
			mov map[bx], 5
			add bx, 60
			
			DEC	CL
			JNZ	M3_6v	
		;------------------
		mov bx, 1440
		MOV	CL, 15
		M3_7v: 
			mov map[bx], 5
			inc bx
			
			DEC	CL
			JNZ	M3_7v
			
		mov bx, 1485
		MOV	CL, 15
		M3_8v: 
			mov map[bx], 5
			inc bx
			
			DEC	CL
			JNZ	M3_8v
			
		ret
;--------------------------------------------------		
;--------------------------------------------------		
map4GenBuild:
		mov ah, 00h     ; Set back to 80x25
		mov al, 03h
		int 10h 
		
		;-----print--------
		;mov dh, 0      ;y  ; set side wall
		mov dl, 0     ;x	
		mov al, 178
		mov bl, 09h
		
		MOV	CL, 15
		M4_1: 
			mov dh, 0      ;y  ; set side wall; print edge
			call setCursor
			call printCHAR
			
			mov dh, 24
			call setCursor
			call printCHAR
			
			inc dl
			
			DEC	CL
			JNZ	M4_1
			
		mov dl, 45     ;x	
		mov al, 178
		mov bl, 09h
		
		MOV	CL, 15
		
		M4_2: 
			mov dh, 0      ;y  ; set side wall; print edge
			call setCursor
			call printCHAR
			
			mov dh, 24
			call setCursor
			call printCHAR
			
			inc dl
			
			DEC	CL
			JNZ	M4_2
			
		mov dh, 1    ;x	
		mov al, 178
		mov bl, 09h
		
		MOV	CL, 5
		
		M4_3: 
			mov dl, 0      ;y  ; set side wall; print edge
			call setCursor
			call printCHAR
			
			mov dl, 59
			call setCursor
			call printCHAR
			
			inc dh
			
			DEC	CL
			JNZ	M4_3
			
		mov dh, 19    ;x	
		mov al, 178
		mov bl, 09h
		
		MOV	CL, 5
		
		M4_4: 
			mov dl, 0      ;y  ; set side wall; print edge
			call setCursor
			call printCHAR
			
			mov dl, 59
			call setCursor
			call printCHAR
			
			inc dh
			
			DEC	CL
			JNZ	M4_4
			
		mov dh, 8    ;y
		mov al, 178
		mov bl, 09h
		
		MOV	CL, 8
		
		M4_5: 
			mov dl, 17      ;y  ; set side wall; print edge
			call setCursor
			call printCHAR
			
			mov dl, 42
			call setCursor
			call printCHAR
			
			inc dh
			
			DEC	CL
			JNZ	M4_5
			
		;------val-------
		mov bx, 0
		MOV	CL, 15
		M4_1v: 
			mov map[bx], 5
			inc bx
			
			DEC	CL
			JNZ	M4_1v
			
		mov bx, 45
		MOV	CL, 15
		M4_2v: 
			mov map[bx], 5
			inc bx
			
			DEC	CL
			JNZ	M4_2v
		
		;----------------		
		mov bx, 60
		MOV	CL, 5
		M4_3v: 
			mov map[bx], 5
			add bx, 60
			
			DEC	CL
			JNZ	M4_3v
			
		mov bx, 119
		MOV	CL, 5
		M4_4v: 
			mov map[bx], 5
			add bx, 60
			
			DEC	CL
			JNZ	M4_4v
		
		mov bx, 1140
		MOV	CL, 5
		M4_5v: 
			mov map[bx], 5
			add bx, 60
			
			DEC	CL
			JNZ	M4_5v
			
		mov bx, 1079
		MOV	CL, 5
		M4_6v: 
			mov map[bx], 5
			add bx, 60
			
			DEC	CL
			JNZ	M4_6v	
		;------------------
		mov bx, 1440
		MOV	CL, 15
		M4_7v: 
			mov map[bx], 5
			inc bx
			
			DEC	CL
			JNZ	M4_7v
			
		mov bx, 1485
		MOV	CL, 15
		M4_8v: 
			mov map[bx], 5
			inc bx
			
			DEC	CL
			JNZ	M4_8v
		;-----------------
		mov bx, 497
		MOV	CL, 8
		M4_9v: 
			mov map[bx], 5
			add bx, 60
			
			DEC	CL
			JNZ	M4_9v
			
		mov bx, 522
		MOV	CL, 8
		M4_10v: 
			mov map[bx], 5
			add bx, 60
			
			DEC	CL
			JNZ	M4_10v
			
		ret
		
;--------------------------------------------------	
printScore:
		mov dh, 21
		mov dl, 72
		call setCursor
		mov al, score3
		add al, 30h
		mov bl, 02h
		call printCHAR	
		
		mov dh, 21
		mov dl, 73
		call setCursor
		mov al, score2
		add al, 30h
		mov bl, 02h
		call printCHAR	
		
		mov dh, 21
		mov dl, 74
		call setCursor
		mov al, score1
		add al, 30h
		mov bl, 02h
		call printCHAR	
		
		mov dh, 21
		mov dl, 75
		call setCursor
		mov al, score0
		add al, 30h
		mov bl, 02h
		call printCHAR	
		ret

;===================================	
begingame:

	

	mov		ah, 01h		; key press?
	int		16h
	jnz		checkKeytmp
	checkReady:
	
	delay:		
	mov 	ah, 86h		; delay
	mov 	cx, 00h
	mov		dx, 05h
	int 	15h
	
	inc count_time
	inc count_rand_time
	
	cmp count_time,100
	jae moveHeadtmp
	finMove:
	
	cmp statusRand,1
	jne finprizecmp
	
	mov dh, posYhead     ;y  ; chk prize
	cmp dh, posYrand
	jne finprizecmp
	mov dl, posXhead     ;x
	cmp dl, posXrand
	jne finprizecmp

	;score++
	
	inc score0
	cmp score0, 10
	jae j1
	jmp endScore

moveHeadtmp: jmp moveHead
checkKeytmp: jmp checkKey

	j1:
	mov score0, 0
	inc score1
	cmp score1, 10
	jae j2
	jmp endScore
	
	j2:
	mov score1, 0
	inc score2
	cmp score2, 10
	jae j3
	jmp endScore
	
	j3:
	mov score2, 0
	inc score3
	
	endScore:
	call printScore
	
	mov statusEat, 1
	
	mov statusRand,0
	
	finprizecmp:
	
	cmp count_rand_time,400
	jl finRand
	cmp statusRand, 0
	jne finRand
	call rand
	
	finRand:
	
	cmp statusRand, 1
	jne noprintprize
	
	mov dh, posYrand    ;y  ; set prize
	mov dl, posXrand    ;x
	call setCursor
	mov al, 254
	mov bl, 0Ah
	call printCHAR
	
	noprintprize:
	
	jmp begingame
	

	
moveHead:
		mov count_time,0
		jmp cheackStatus ;mov head
		finStatus:
		call blankTail
		jmp finMove
		

;====================================		
checkKey: ;check what the key was 
		mov		ah, 00h
		int		16h
		cmp		ah, 4bh
		jz		leftKey
		cmp		ah,	4dh
		jz		rightKey
		cmp		ah, 48h
		jz		upKey
		cmp		ah,	50h
		jz		downKey
		cmp		al, 1Bh
		jz		exitSeltmp	
		jmp     checkReadytmp
;--------------------------------------------------------
checkReadytmp: jmp checkReady
;--------------------------------------------------------
upKey: ; ship above 2 space
	mov bx,posValueHead ;if down before cant up
	cmp map[bx],2
	je checkReadytmp
	mov status, 1
	jmp checkReady
	
downKey: ; ship down 2 space
	mov bx,posValueHead ;if up before cant down
	cmp map[bx],1
	je checkReadytmp
	mov status, 2
	jmp checkReady
	
leftKey: ; ship above 2 space
	mov bx,posValueHead ;if left before cant right
	cmp map[bx],4
	je checkReadytmp
	mov status, 3
	jmp checkReady
	
rightKey: ; ship down 2 space
	mov bx,posValueHead ;if right before cant left
	cmp map[bx],3
	je checkReadytmp
	mov status, 4
	jmp checkReadytmp

;--------------------------------------------------------	
cheackStatus:
	cmp status, 1
	je up
	
	cmp status, 2
	je down
	
	cmp status, 3
	je lefttmp
	
	cmp status, 4
	je righttmp
	
	jmp begingame
;--------------------------------------------------------		
exitSeltmp: jmp exitSel	
;--------------------------------------------------------
up:		
		mov bx,posValueHead
		mov map[bx],1
		
		cmp posYhead,0
		jne inscreenUp
		mov posYhead,24
		add posValueHead,1440 ; chk out of screen 
		jmp notinscreenUp
		
		inscreenUp:
		sub posValueHead,60 ;move up
		dec posYhead
		
		notinscreenUp:
		mov bx,posValueHead
		cmp map[bx],0
		jne exitSeltmp2     ;check collison
		
		mov bx,posValueHead
		mov map[bx],1

		mov dh, posYhead     ;y  ; set begin snake
		mov dl, posXhead     ;x
		call setCursor
		mov al, 254
		mov bl, 0Ch
		call printCHAR	

		jmp finStatus
;----------------------
lefttmp: jmp left
righttmp: jmp right		
;----------------------
down:	
		mov bx,posValueHead
		mov map[bx],2
		
		cmp posYhead,24
		jne inscreenDown
		mov posYhead,0
		sub posValueHead,1440 ; chk out of screen 
		jmp notinscreenDown
		
		inscreenDown:
		add posValueHead,60  ;move down
		inc posYhead
		
		notinscreenDown:
		mov bx,posValueHead
		cmp map[bx],0
		jne exitSeltmp2       ;check collison
		
		mov bx,posValueHead
		mov map[bx],2
		mov dh, posYhead     ;y  ; set begin snake
		mov dl, posXhead     ;x
		call setCursor
		mov al, 254
		mov bl, 0Ch
		call printCHAR	
		jmp finStatus	
;--------------------------	
exitSeltmp2: jmp exitSel
;--------------------------
left:		
		mov bx,posValueHead
		mov map[bx],3
		
		cmp posXhead,0
		jne inscreenLeft
		mov posXhead,59
		add posValueHead,59 ; chk out of screen 
		jmp notinscreenLeft
		
		inscreenLeft:
		dec posXhead          ;move left
		sub posValueHead,1
		
		notinscreenLeft:
		mov bx,posValueHead
		cmp map[bx],0
		jne exitSeltmp2          ;check collison
		
		mov bx,posValueHead
		mov map[bx],3
		
		mov dh, posYhead     ;y  ; set begin snake
		mov dl, posXhead     ;x
		call setCursor
		mov al, 254
		mov bl, 0Ch
		call printCHAR	
		jmp finStatus	
		
exitSeltmp3: jmp exitSeltmp2
		
right:		
		mov bx,posValueHead
		mov map[bx],4
		
		cmp posXhead,59
		jne inscreenRight
		mov posXhead,0
		sub posValueHead,59 ; chk out of screen 
		jmp notinscreenRight
		
		inscreenRight:
		inc posXhead         ;move right
		add posValueHead,1
		
		notinscreenRight:
		mov bx,posValueHead
		cmp map[bx],0
		jne exitSeltmp3         ;check collison
		
		mov bx,posValueHead
		mov map[bx],4
		
		mov dh, posYhead     ;y  ; set begin snake
		mov dl, posXhead     ;x
		call setCursor
		mov al, 254
		mov bl, 0Ch
		call printCHAR	
		jmp finStatus	
;--------------------------------------------------------
blankTail:
		cmp statusEat,0
		je noeat
		
		mov statusEat,0
		jmp endblank
		
		noeat:
		mov dh,posYtail
		mov dl,posXtail
		call setCursor
		mov al, 00h ;Print null
		mov bl, 06h ;black color
		call printCHAR
		mov dh,posYhead
		mov dl,posXhead
		call setCursor
		mov bx,posValueTail
		
		cmp map[bx], 1
		je blankUp
		cmp map[bx], 2
		je blankDown
		cmp map[bx], 3
		je blankLeft
		cmp map[bx], 4
		je blankRight
		endblank:
		
		ret
;--------------------------------------------------------
blankUp:
		mov map[bx], 0
		
		cmp posYtail,0     ;chk out of screen
		jne inscreenblankUp
		mov posYtail,24
		add posValueTail,1440
		jmp endblankUp
		
		inscreenblankUp:
		dec posYtail
		sub posValueTail,60
		endblankUp:
		ret
blankDown:
		mov map[bx], 0
		
		cmp posYtail,24     ;chk out of screen
		jne inscreenblankDown
		mov posYtail,0
		sub posValueTail,1440
		jmp endblankDown
		
		inscreenblankDown:
		inc posYtail
		add posValueTail,60
		endblankDown:
		ret
blankLeft:
		mov map[bx], 0
		
		cmp posXtail,0     ;chk out of screen
		jne inscreenblankLeft
		mov posXtail,59
		add posValueTail,59
		jmp endblankLeft
		
		inscreenblankLeft:
		dec posXtail
		sub posValueTail,1
		
		endblankLeft:
		ret
blankRight:
		mov map[bx], 0
		
		cmp posXtail,59    ;chk out of screen
		jne inscreenblankRight
		mov posXtail,0
		sub posValueTail,59
		jmp endblankRight
		
		inscreenblankRight:
		inc posXtail
		add posValueTail,1
		
		endblankRight:
		ret
;--------------------------------------------------------
rand: 

		mov statusRand, 1
		mov count_rand_time,0
		
		call rand_column
		mov posXrand, dl
		call rand_row
		mov posYrand, dl
		
		
		mov bx, 0
		cmp posYrand,0
		jne nomul
		MOV	CL, posYrand
		R1: 
			add bx, 60
			
			DEC	CL
			JNZ	R1
		nomul:
		
		mov al, posXrand
		sub ah, ah
		add bx, ax

		cmp map[bx], 0
		ja randfall
		
		mov dh, posYrand    ;y  ; set prize
		mov dl, posXrand    ;x
		call setCursor
		mov al, 254
		mov bl, 0Ah
		call printCHAR	
		jmp endrand
		
		randfall:
		mov statusRand, 0
		
		endrand:
		ret

		
;--------------------------------------------------------
rand_column: ; random mode
		
		mov ax, [seed]
		mov bx, 997
		mul bx                  ; RAND = RAND*P1
		add ax, 65519            ; RAND += P2      
		and ax, 65535          ; RAND %= RAND_MAX
		mov [seed], ax

		xor dx, dx      
		mov bx, 58
		div bx

		cmp dl,59
		ja rand_column
		add dl, 1					; dl now between 0 and 59
		ret
;--------------------------------------------------------	
rand_row: ; random mode
		mov ax, [seed]
		mov bx, 997
		mul bx                  ; RAND = RAND*P1
		add ax, 65519            ; RAND += P2      
		and ax, 65535          ; RAND %= RAND_MAX
		mov [seed], ax

		xor dx, dx      
		mov bx, 23
		div bx 

		cmp dl,22
		ja rand_row
		add dl,1					; dl now between 0 and 24
		ret
;--------------------------------------------------------
setCursor: ; use to set cursor position
		   ; input x=dl,y=dh
	 push dx
	 push bx
	 push ax
	 mov ah, 02h 
	 mov bh, 00h
	 int 10h
	 ; Move cursor position
	 pop ax
	 pop bx
	 pop dx
	 RET
;--------------------------------------------------------
printCHAR: ; use to print a character
	 ; input: al = char
	 ;        bl = color
	 push cx
	 push ax

	 mov ah, 09h
	 mov bh, 00h
	 mov cx, 0001h
	 int 10h

	 pop ax
	 pop cx
	 RET
;--------------------------------------------------------

exitSel:
		mov ah, 00h     ; Set back to 80x25
		mov al, 03h
		int 10h 
		
		mov ah,02h     ; set curcor position
		mov bh,00h
		mov dh,10
		mov dl,33
		int 10h
		
		mov ah, 09h													
		mov dx, offset gameover
		int 21h
		
		mov ah,02h     ; set curcor position
		mov bh,00h
		mov dh,12
		mov dl,32
		int 10h
		
		mov ah, 09h													
		mov dx, offset str_score
		int 21h
		
		mov dh, 12
		mov dl, 40
		call setCursor
		mov al, score3
		add al, 30h
		mov bl, 02h
		call printCHAR	
		
		mov dh, 12
		mov dl, 41
		call setCursor
		mov al, score2
		add al, 30h
		mov bl, 02h
		call printCHAR	
		
		mov dh, 12
		mov dl, 42
		call setCursor
		mov al, score1
		add al, 30h
		mov bl, 02h
		call printCHAR	
		
		mov dh, 12
		mov dl, 43
		call setCursor
		mov al, score0
		add al, 30h
		mov bl, 02h
		call printCHAR	
		
		;call music_over

	mov ah,4Ch          ;DOS "terminate" function
	MOV AL, 0 
    int 21
	ret
	
	
	
	
ret
end main 