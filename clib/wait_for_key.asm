global _wait_for_key

_wait_for_key:
    push bp
    mov bp, sp

    mov ax, word [bp+4]

    call os_wait_for_key

    pop bp
    ret
