global _string_lowercase

_string_lowercase:
    push bp
    mov bp, sp

    mov ax, [bp+4]

    call os_string_lowercase

    pop bp
    ret
