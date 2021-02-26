global _show_cursor

_show_cursor:
    push bp
    mov bp, sp

    call os_show_cursor

    pop bp
    ret
