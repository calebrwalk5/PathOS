global _load_file

_load_file:
    push bp
    mov bp, sp
    sub sp, 2

    mov [bp-2], bx

    mov ax, word [bp+4]
    mov cx, word [bp+6]

    call os_load_file

    mov ax, bx

    jc .error

    mov word [_ioerr], 0
    jmp .skip

.error:
    mov word [_ioerr], 1
 
.skip:
    mov bx, word [bp-2]

    mov sp, bp
    pop bp
    ret
