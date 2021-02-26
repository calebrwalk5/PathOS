global _set_time_fmt

_set_time_fmt:
    push bp
    mov bp, sp

    mov al, byte [bp+4]

    call os_set_time_fmt

    pop bp
    ret
