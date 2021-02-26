global _check_for_key

_check_for_key:
    push bp
    mov bp, sp

    mov ax, word [bp+4]

    call os_check_for_key

    pop bp
    ret
