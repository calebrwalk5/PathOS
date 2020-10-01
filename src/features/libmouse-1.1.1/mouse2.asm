BITS 16
ORG 32768
%include 'mikedev.inc'
%include 'mouse.lib'

call mouselib_setup

main:
	call mouselib_freemove
	jc keypress
	
	push dx
	mov dx, 0
	call os_move_cursor
	mov si, filler
	call os_print_string
	call os_move_cursor
	pop dx
	
	
	mov si, message
	call os_print_string
	mov ax, cx
	call os_int_to_string
	mov si, ax
	call os_print_string
	mov si, seperator
	call os_print_string
	mov ax, dx
	call os_int_to_string
	mov si, ax
	call os_print_string
	
	jmp main

keypress:
	cmp al, 27
	je exit
	
	jmp main

exit:
	call mouselib_remove_driver
	ret

filler db '                          ', 0
message db 'Mouse click at X: ', 0
seperator db ' Y: ', 0
