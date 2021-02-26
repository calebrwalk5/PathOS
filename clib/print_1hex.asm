global _print_1hex

_print_1hex:
    push bp
    mov bp, sp

    mov al, byte [bp+4]

    call os_print_1hex

    pop bp
    ret