global _print_space

_print_space:
    push bp
    mov bp, sp

    call os_print_space

    pop bp
    ret