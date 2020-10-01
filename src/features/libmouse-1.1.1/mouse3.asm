; Mouse Demo 3
; An example of event mode

bits 16
org 32768
%include 'mikedev.inc'
%include 'mouse.lib'

%ifndef MOUSE_DRIVER_VERSION
	%error 'Invalid mouse driver version'
%else
	%if MOUSE_DRIVER_VERSION < 110
		%error 'Invalid mouse driver version'
	%endif
%endif

call os_hide_cursor
call os_clear_screen
call mouselib_setup

; Install event handlers before entering event mode
mov ax, keyboard_handler
mov cl,  MOUSELIB_EVENT_KEYBOARD
call mouselib_eventmode_assignhandler

mov ax, move_handler
mov cl, MOUSELIB_EVENT_MOVE
call mouselib_eventmode_assignhandler

mov ax, leftclick_handler
mov cl, MOUSELIB_EVENT_LEFTCLICK
call mouselib_eventmode_assignhandler

mov ax, rightrelease_handler
mov cl, MOUSELIB_EVENT_RIGHTRELEASE
call mouselib_eventmode_assignhandler

; Enter interactive code, this will not return until interactive mode is exited
call mouselib_eventmode_start
call os_clear_screen
call os_show_cursor
ret

keyboard_handler:
	; Draw the character pressed at the cursor position
	call os_move_cursor
	
	mov ah, 0Ah
	mov bh, 0
	mov cx, 1
	int 10h
	
	ret

move_handler:
	; Draw red area wherever the cursor moves
	call os_move_cursor

	mov ah, 09h
	mov al, 32
	mov bh, 0
	mov bl, 64
	mov cx, 1
	int 10h
	
	ret
	
leftclick_handler:
	call os_move_cursor
	
	mov ah, 09h
	mov al, 1
	mov bh, 0
	mov bl, 64
	mov cx, 1
	int 10h
	
	ret
	

rightrelease_handler:
	; Exit interactive mode when the right mouse button is released
	call mouselib_eventmode_stop
	ret
