global _string_reverse

_string_reverse:
    push bp
    mov bp, sp

    mov si, [bp+4]

    call os_string_reverse

    pop bp
    ret
