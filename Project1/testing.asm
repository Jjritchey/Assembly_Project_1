INCLUDE Irvine32.inc


.data
opx WORD 0


.code
main proc
	
	mov eax, 0
	mov ebx, 3


	L1:
	CMP eax, ebx
	JL L2
	JMP L3

    L2:
	add eax, 1
	JMP L1

	L3:
	call WriteInt
	invoke ExitProcess,0
main endp
end main