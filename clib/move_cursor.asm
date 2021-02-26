global _move_cursor

_move_cursor:
    push bp
    mov bp, sp

    mov dx, word [bp+4]

    call os_move_cursor

    pop bp
    ret
