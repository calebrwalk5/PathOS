extern _main
global __start

__start:
    push bp
    mov bp, sp

    ; Make sure the Mike OS API version is 17 or higher.
    ; This will insure that the library doesn't call any
    ; functions that don't exist on older versions.
    call _get_api_version
    mov ah, 17
    cmp al, ah
    jl .api_error

    ; argv
    mov bx, .buffer

    ; argv[0] is always the file's name!
    mov word [bx], 0
    add bx, 2

    ; argc
    mov cx, 1

    ; If si is 0, then there are no args.
    cmp si, 0
    je .done

    ; Decrease because of the upcoming loop.
    dec si

.loop:
    inc si

    ; Skip multiple blank spaces!
    cmp byte [si], ' '
    je .loop

    ; Found an arg.
    mov [bx], si
    inc cx
    add bx, 2

    ; Make sure argv doesn't overflow!
    cmp cx, 12
    je .arg_error

.find:
    ; That's all the args.
    cmp byte [si], 0
    je .done

    ; Go to the next arg!
    cmp byte [si], ' '
    je .next

    inc si

    jmp .find

.next:
    mov byte [si], 0

    jmp .loop

.done:
    ; Push argv and argc respectively.
    push word .buffer
    push cx

    ; Call the main function and clean up after it.
    call _main
    add sp, 4

.exit:
    mov sp, bp
    pop bp
    ret

.arg_error:
    push .arg_str
    call _print_string
    call _wait_for_key
    jmp .exit

.api_error:
    push .api_str
    call _print_string
    call _wait_for_key
    jmp .exit

.arg_str: db "Too many arguments were passed!", 13, 10, 0
.api_str: db "This program will only run on MikeOS 4.6 and up!", 13, 10, 0
.buffer: times 11 dw 0
