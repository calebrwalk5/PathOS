global _port_byte_in

_port_byte_in:
    push bp
    mov bp, sp

    mov dx, [bp+4]

    call os_port_byte_in

    pop bp
    ret
