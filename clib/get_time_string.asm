global _get_time_string

_get_time_string:
    push bp
    mov bp, sp

    mov bx, [bp+4]

    call os_get_time_string

    mov ax, bx

    pop bp
    ret
