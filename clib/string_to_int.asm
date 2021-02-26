global _string_to_int

_string_to_int:
    push bp
    mov bp, sp

    mov si, [bp+4]

    call os_string_to_int

    pop bp
    ret
