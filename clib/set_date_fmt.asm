global _set_date_fmt

_set_date_fmt:
    push bp
    mov bp, sp

    mov ax, [bp+4]

    call os_set_date_fmt

    pop bp
    ret
