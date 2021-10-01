bits 16
org 32768
%include "mikedev.inc"

mov ah, 09h
mov al, ' '
mov bx, 0004h
mov cx, 42
int 10h
mov si, i_tr   ; 42
call os_print_string
mov dh, 24
mov dl, 0
call os_move_cursor
mov ah, 09h
mov al, ' '
mov bx, 0004h
mov cx, 79
int 10h
mov si, footer ; 79
call os_print_string
mov dh, 1
mov dl, 0
call os_move_cursor
mov ah, 09h
mov al, ' '
mov bx, 0002h
mov cx, 80
int 10h
mov ax, input
mov bx, 80
call os_input_string
call os_print_newline
mov ah, 09h
mov al, ' '
mov bx, 0004h
mov cx, 6
int 10h
mov si, sonuc
call os_print_string
mov ah, 09h
mov al, ' '
mov bx, 0002h
mov cx, 80
int 10h
mov si, input
jmp lp
lp:
	pusha
	mov ah, 0Eh

.tekrar:
	lodsb
	cmp al, 0
	je .done

	cmp al, 'a'
	je .sesli
	cmp al, 'e'
	je .sesli
	cmp al, 'i'
	je .sesli
	cmp al, 'u'
	je .sesli
	cmp al, 'o'
	je .sesli
	cmp al, 'A'
	je .sesli_b
	cmp al, 'E'
	je .sesli_b
	cmp al, 'I'
	je .sesli_b
	cmp al, 'U'
	je .sesli_b
	cmp al, 'O'
	je .sesli_b
	int 10h
	jmp .tekrar

.sesli:
	int 10h
	pusha
	mov al, 'g'
    int 10h
	popa
	int 10h
    jmp .tekrar

.sesli_b:
	int 10h
	pusha
	mov al, 'G'
    int 10h
	popa
	int 10h
    jmp .tekrar

.done:
	call os_print_newline
	call os_wait_for_key
	ret

input times 80 db 0
i_tr db 'Turkce metin girin (en fazla 80 karakter):', 0
footer db 'GH: Comrade-Otaku/kd-mikeos                                     Made by Camroku', 0
sonuc db 'Sonuc:', 13, 10, 0
