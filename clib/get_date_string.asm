global _get_date_string

_get_date_string:
    push bp
    mov bp, sp

    mov bx, [bp+4]

    call os_get_date_string

    mov ax, bx

    pop bp
    ret
