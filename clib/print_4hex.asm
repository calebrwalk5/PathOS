global _print_4hex

_print_4hex:
    push bp
    mov bp, sp

    mov ax, word [bp+4]

    call os_print_4hex

    pop bp
    ret