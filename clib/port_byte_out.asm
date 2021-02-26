global _port_byte_out

_port_byte_out:
    push bp
    mov bp, sp

    mov dx, [bp+4]
    mov al, byte [bp+6]

    call os_port_byte_out

    pop bp
    ret
