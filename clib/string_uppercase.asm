global _string_uppercase

_string_uppercase:
    push bp
    mov bp, sp

    mov ax, [bp+4]

    call os_string_uppercase

    pop bp
    ret
