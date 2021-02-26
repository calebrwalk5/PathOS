global _print_2hex

_print_2hex:
    push bp
    mov bp, sp

    mov al, byte [bp+4]

    call os_print_2hex

    pop bp
    ret