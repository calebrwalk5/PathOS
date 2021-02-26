global _string_truncate

_string_truncate:
    push bp
    mov bp, sp

    mov si, [bp+4]
    mov ax, [bp+6]

    call os_string_truncate

    mov ax, si

    pop bp
    ret
