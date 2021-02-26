global _get_file_list

_get_file_list:
    push bp
    mov bp, sp
    sub sp, 2

    mov [bp-2], bx

    mov ax, word [bp+4]

    call os_get_file_list

    mov bx, ax
    cmp byte [bx], 0
    je .error

    mov word [_ioerr], 0
    jmp .skip

.error:
    mov word [_ioerr], 1

.skip:
    mov bx, word [bp-2]

    mov sp, bp
    pop bp
    ret
