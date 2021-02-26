global _string_copy

_string_copy:
    push bp
    mov bp, sp

    mov si, [bp+4]
    mov di, [bp+6]

    call os_string_copy

    mov ax, di

    pop bp
    ret
