global _string_join

_string_join:
    push bp
    mov bp, sp

    mov ax, [bp+4]
    mov bx, [bp+6]
    mov cx, [bp+8]

    call os_string_join

    mov ax, cx

    pop bp
    ret
