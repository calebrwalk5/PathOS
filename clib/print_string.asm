global _print_string

_print_string:
    push bp
    mov bp, sp

    mov si, word [bp+4]

    call os_print_string

    pop bp
    ret
