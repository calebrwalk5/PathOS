global _get_cursor_pos

_get_cursor_pos:
    push bp
    mov bp, sp

    call os_get_cursor_pos

    mov ax, dx

    pop bp
    ret
