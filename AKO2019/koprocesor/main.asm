.686
.model flat
public _main

.code
_main PROC
	push	ebp
	mov		ebp, esp

	finit
	push	eax
	fld1
	fldpi
	faddp
	pop		eax

	mov		esp, ebp
	pop		ebp
	ret
_main ENDP
END