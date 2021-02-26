global _fatal_error

_fatal_error:
    push bp
    mov bp, sp

    mov ax, word [bp+4]

    call os_fatal_error

    pop bp
    ret