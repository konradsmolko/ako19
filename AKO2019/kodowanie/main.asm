.686
.model flat
extern	_ExitProcess@4	: PROC
extern	_MessageBoxA@16	: PROC	; MessageBoxA(HWND, title, text, options)
extern	_MessageBoxW@16	: PROC
extern	__write			: PROC
public _main

.data
tekst_ascii		db	'Zwykly tekst do wyswietlenia w konsoli.',0

tytul_Unicode	dw	'T','e','k','s','t',' ','U','T','F','-','1','6',0
tekst_Unicode	dw	'B','l','a',' ','b','l','a','.',0
;					Zażółć gęślą jaźń.
tekst_polski	dw	'Z','a',017Ch,00F3h,0142h,0107h,' ','g',0119h,015Bh,'l',0105h,' ','j','a',017Ah,0144h,'.',0
.code
_main PROC
	push	ebp
	mov		ebp, esp

	push	0
	push	OFFSET tytul_Unicode
	push	OFFSET tekst_polski
	;push	OFFSET tekst_Unicode
	push	0
	;call	_MessageBoxA@16
	call	_MessageBoxW@16

	push	dword PTR (tytul_Unicode - tekst_ascii)
	push	dword PTR OFFSET tekst_ascii
	push	dword PTR 1
	call	__write
	add		esp, 12

	mov		esp, ebp
	pop		ebp

	push	0
	call	_ExitProcess@4
_main ENDP
end