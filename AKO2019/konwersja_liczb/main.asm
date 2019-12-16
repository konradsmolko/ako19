.686
.model flat
extern	_ExitProcess@4	: PROC
;extern	__read			: PROC ; read(n, *buf, handle) // changes EAX, ECX, EDX. handle = 0 for keyboard.
extern	__write			: PROC ; write(n, *buf, handle)
public _main

.data
	znaki	db 10 dup (20h)
			db 0Ah
.code
_main PROC
	push	ebp
	mov		ebp, esp

	;mov		eax, 0FFFFFFFFh
	;call	wyswietl_EAX

	mov		ecx, 50
	mov		eax, 1
	mov		edx, 0
ptl:
	add		eax, edx
	inc		edx
	push	eax
	push	ecx
	push	edx
	call	wyswietl_EAX
	pop		edx
	pop		ecx
	pop		eax
	loop	ptl

	mov		esp, ebp
	pop		ebp

	push	0
	call	_ExitProcess@4
_main ENDP

wyswietl_EAX PROC
	push	ebp
	mov		ebp, esp

	call	konwertuj

	push	11
	push	OFFSET znaki
	push	1
	call	__write
	add		esp, 16

	mov		esp, ebp
	pop		ebp
	ret
wyswietl_EAX ENDP

konwertuj PROC
	push	ebp
	mov		ebp, esp
	push	esi
	push	ebx
	
	mov		esi, 9
	mov		ebx, 10
konwersja:
	mov		edx, 0
	div		ebx

	add		dl, 30h

	mov		znaki[esi], dl
	dec		esi
	cmp		eax, 0
	jne konwersja

wypeln:
	cmp		esi, 0
	je		koniec
	cmp		esi, 9
	ja		koniec
	mov		BYTE PTR znaki[esi], 20h
	dec		esi
	jmp		wypeln

koniec:
	pop		ebx
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret
konwertuj ENDP
end