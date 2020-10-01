%INCLUDE 'mikedev.inc'
org 32768
bits 16

call mouselib_setup

call os_hide_cursor

; reset the mouse position
mov cx, 0
mov dx, 0
call mouselib_move

mouse_loop:
	call os_clear_screen
	call mouselib_locate
	
	; Print Mouse X
	mov ax, cx
	mov si, mouse_x_string
	call os_print_string
	call os_int_to_string
	mov si, ax
	call os_print_string
	call os_print_newline
	
	; Print Mouse Y
	mov ax, dx
	mov si, mouse_y_string
	call os_print_string
	call os_int_to_string
	mov si, ax
	call os_print_string
	call os_print_newline
	
	mov si, exit_msg
	call os_print_string

	; Show the cursor
	call mouselib_show
	
	; Wait for input
	call mouselib_input_wait
	
	; If the input was keyboard input, check the key
	jc key_pressed
	
	; If it was a mouse click then finish program
	call mouselib_anyclick
	jc exit
	
	; Otherwise hide the cursor and loop
	call mouselib_hide
	jmp mouse_loop
	
key_pressed:
	call os_check_for_key

	; Was the escape key pressed?
	cmp al, 27
	je exit
	
	; If not hide the cursor and loop
	call mouselib_hide
	
	jmp mouse_loop
	
exit:
	call mouselib_hide
	call os_clear_screen
	call os_show_cursor
	call mouselib_remove_driver
	ret
	
mouse_x_string				db 'Mouse X: ', 0
mouse_y_string				db 'Mouse Y: ', 0
exit_msg				db 'Press the escape key or click any mouse button to exit.', 0

%INCLUDE 'mouse.lib'