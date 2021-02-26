global _get_random

_get_random:
    push bp
    mov bp, sp
    sub sp, 2

    mov [bp-2], bx

    mov ax, [bp+4]
    mov bx, [bp+6]

    call os_get_random

    mov ax, cx

    mov bx, word [bp-2]

    mov sp, bp
    pop bp
    ret
