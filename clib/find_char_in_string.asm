global _find_char_in_string

_find_char_in_string:
    push bp
    mov bp, sp

    mov si, [bp+4]
    mov al, byte [bp+6]

    call os_find_char_in_string

    pop bp
    ret
