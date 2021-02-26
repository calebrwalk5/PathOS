global _long_int_to_string

_long_int_to_string:
    push bp
    mov bp, sp
    sub sp, 4

    mov word [bp-2], bx
    mov word [bp-4], di

    mov bx, [bp+4]
    mov dx, [bx]
    mov ax, [bx+2]

    mov bx, [bp+6]
    mov di, [bp+8]

    call os_long_int_to_string

    mov ax, di

    mov bx, [bp-2]
    mov di, [bp-4]

    mov sp, bp
    pop bp
    ret
