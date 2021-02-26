global _print_digit

_print_digit:
    push bp
    mov bp, sp

    mov ax, word [bp+4]

    call os_print_digit

    pop bp
    ret