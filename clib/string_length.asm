global _string_length

_string_length:
    push bp
    mov bp, sp

    mov ax, [bp+4]

    call os_string_length

    pop bp
    ret
