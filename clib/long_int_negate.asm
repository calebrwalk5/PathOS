global _long_int_negate

_long_int_negate:
    push bp
    mov bp, sp
    sub sp, 2

    mov word [bp-2], bx

    mov bx, [bp+4]
    mov dx, [bx]
    mov ax, [bx+2]

    call os_long_int_negate

    mov bx, [bp+4]
    mov [bx], dx
    mov [bx+2], ax

    mov sp, bp
    pop bp
    ret
