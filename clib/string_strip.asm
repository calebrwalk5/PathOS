global _string_strip

_string_strip:
    push bp
    mov bp, sp

    mov si, [bp+4]
    mov al, byte [bp+6]

    call os_string_strip

    pop bp
    ret
