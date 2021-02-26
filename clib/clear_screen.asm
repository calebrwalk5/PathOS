global _clear_screen

_clear_screen:
    push bp
    mov bp, sp

    call os_clear_screen

    pop bp
    ret
