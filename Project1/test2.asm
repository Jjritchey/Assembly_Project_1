; Justin Ritchey
; Program 3
; 10/31/2020
; Program is meant to gather a int from the keyboard and return a letter grade

INCLUDE Irvine32.inc


.data
score dWORD 0                                                     ;variable to hold the score
str1 BYTE "Please enter your number score from 0 to 100: ", 0     ;string to print out
str7 BYTE "E", 0                                                  ;strings to hold Letter grades
str2 BYTE "D", 0
str3 BYTE "C", 0
str4 BYTE "B", 0
str5 BYTE "A", 0
str6 BYTE "Your Number is greater than 100", 0                     ;strings to print out info for the user
str8 BYTE "Your score of: ", 0
str9 BYTE " gives you a ", 0

.code
main proc
    mov edx, OFFSET str1                                            ;printing out to user to enter a number grade
	call WriteString
	
	call ReadInt                                                    ;reading in number grade to ecx and then storing into score
	mov ecx, score
	call Crlf

	mov score, eax                  

	
	CMP eax, 100                                                    ;comparing the number entered with percentages for the grades 
	JG L0                                                           ;and then jumping to that correspoinding letter grade label below
	CMP eax, 90                                                     ;This includes another over 100 and less than 60
	JGE L4                                                       
	CMP eax, 80
	JGE L3
	CMP eax, 70
    JGE L2
	CMP eax, 60
	JGE L1
	CMP eax, 60
	JL L5
	
	
	

	L0:                                                            ;label for anything over 100
		 mov edx, OFFSET str6
		 call WriteString
		 JMP _exit

	L1:                                                            ;label for anything between 60 and 69
		 mov edx, OFFSET str8
		 call WriteString
		 call WriteInt
		 mov edx, OFFSET str9
		 call WriteString
		 mov edx, OFFSET str2
		 call WriteString
		 JMP _exit
	
	L2:                                                            ;label for anything between 70 and 79
		 mov edx, OFFSET str8
		 call WriteString
		 call WriteInt
		 mov edx, OFFSET str9
		 call WriteString
		 mov edx, OFFSET str3
		 call WriteString
		 JMP _exit

	L3:                                                           ;label for anything between 80 and 89
		 mov edx, OFFSET str8
		 call WriteString
		 call WriteInt
		 mov edx, OFFSET str9
		 call WriteString
		 mov edx, OFFSET str4
		 call WriteString
		 JMP _exit

	L4:                                                           ;label for anything between 90 and 100
		 mov edx, OFFSET str8
		 call WriteString
		 call WriteInt
		 mov edx, OFFSET str9
		 call WriteString
		 mov edx, OFFSET str5
		 call WriteString
		 JMP _exit

	 L5:                                                          ;label for anything below 60
		 mov edx, OFFSET str8
		 call WriteString
		 call WriteInt
		 mov edx, OFFSET str9
		 call WriteString
		 mov edx, OFFSET str7
		 call WriteString
		 JMP _exit
	 

	
	
	
	_exit:                                                        ;label to be called when exiting the program
		call Crlf
		exit
	 invoke ExitProcess,0
main endp
end main