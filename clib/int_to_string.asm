global _int_to_string

_int_to_string:
    push bp
    mov bp, sp

    mov ax, [bp+4]

    call os_int_to_string

    pop bp
    ret
