global _print_horiz_line

_print_horiz_line:
    push bp
    mov bp, sp

    mov ax, word [bp+4]

    call os_print_horiz_line

    pop bp
    ret
