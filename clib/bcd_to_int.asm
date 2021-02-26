global _bcd_to_int

_bcd_to_int:
    push bp
    mov bp, sp

    mov al, byte [bp+4]

    call os_bcd_to_int

    pop bp
    ret
