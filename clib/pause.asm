global _pause

_pause:
    push bp
    mov bp, sp

    mov ax, word [bp+4]

    call os_pause

    pop bp
    ret