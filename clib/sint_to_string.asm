global _sint_to_string

_sint_to_string:
    push bp
    mov bp, sp

    mov ax, [bp+4]

    call os_sint_to_string

    pop bp
    ret
