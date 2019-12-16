.686
.model flat

public _szukaj4_max
public _szukajn_max

.code
_szukaj4_max PROC
	push	ebp
	mov		ebp, esp
	push	esi

	mov		ecx, 3
	lea		esi, [ebp+8]
	mov		eax, [esi+4*ecx]
ptl:
	dec		ecx
	mov		edx, [esi+4*ecx]
	cmp		eax, edx
	jge		dalej
	mov		eax, edx
dalej:
	cmp		ecx, 0
	jne		ptl
	
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret
_szukaj4_max ENDP

_szukajn_max PROC
	push	ebp
	mov		ebp, esp
	push	esi

	mov		ecx, [ebp+8]	; n
	dec		ecx
	mov		esi, [ebp+12]	; adres tablicy intów
	mov		eax, [esi+4*ecx]
ptl:
	dec		ecx
	mov		edx, [esi+4*ecx]
	cmp		eax, edx
	jge		dalej
	mov		eax, edx
dalej:
	cmp		ecx, 0
	jne		ptl

	pop		esi
	mov		esp, ebp
	pop		ebp
	ret
_szukajn_max ENDP
END