global _hide_cursor

_hide_cursor:
    push bp
    mov bp, sp

    call os_hide_cursor

    pop bp
    ret
