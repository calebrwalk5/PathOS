global _string_charchange

_string_charchange:
    push bp
    mov bp, sp

    mov si, [bp+4]
    mov al, byte [bp+6]
    mov bl, byte [bp+8]

    call os_string_charchange

    pop bp
    ret
