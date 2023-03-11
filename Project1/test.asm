; Justin Ritchey
; Program 2
; 10/17/2020
; Program is meant to find the mean and variacne of the a set of numbers

INCLUDE Irvine32.inc


.data
RAW WORD 10, 12, 8, 17, 9, 22, 18, 11, 23, 7, 30, 22, 19, 6, 7  ;creating the array for with the numbers to be used
var WORD 0                          ;to hold the mean             
var2 WORD 0                         ;used to sqaure the number when finding the variance
var3 WORD 0                         ;used to hold the values of the numbers for the variance
str2 BYTE "MEAN: ", 0               ;strings to print out for display
str1 BYTE "VAR: ", 0


.code
;main proc
    mov edi, OFFSET RAW             ;used as a pointer in the array
	mov ax, 0                       ;setting ax to 0
    mov ecx, LENGTHOF RAW           ;setting the loop to stop after the 15 members of the array

    L1:
    add ax, [edi]                   ;using a loop to gather each member of the array and add them together
    add edi, TYPE RAW               ;goes to the next spot in the array
    loop L1

    mov dx, 0                       ;dividing the result by 15 to get the mean, not using after the decimal but
    mov cx, 15                      ;would be 14.733333, so just 14.
    div cx

    movzx eax, ax                   ;moving from 16 to 32 bit for printing purposes

    mov edx, OFFSET str2            ;printing out the mean to the display
    call WriteString
    call Writeint
    call Crlf

    mov var, ax                     ;setting var to the mean
    mov ax, 0                       ;setting ax to 0 again
    mov edi, OFFSET RAW             ;setting pointer to first spot in the array

    L2:
    add ax, [edi]                   ;gathering each spot in the array in the loop
    add edi, TYPE RAW               ;moves to the next spot in the array
    sub ax, var                     ;subtracting mean from the current number
    mov var2, ax                    ;multiplying the current number by itself
    mul var2
    add var3, ax                    ;adding sqaured number to var3 to hold all values
    mov ax, 0                       ;setting ax to 0 again
    loop L2
    
    mov ax, var3                    ;handing off the value of the loop to ax

    mov dx, 0                       ;diving this number by the amount of array members to get the variance
    mov cx, 15
    div cx

    movzx eax, ax                   ;moving 16 bit to 32 bit for printing

    mov edx, OFFSET str1            ;printing off variance numbers which is 51. Actual value is 50.59555
    call WriteString
    call Writeint

	invoke ExitProcess,0
main endp
end main