global _print_newline

_print_newline:
    push bp
    mov bp, sp

    call os_print_newline

    pop bp
    ret
