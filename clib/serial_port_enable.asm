global _serial_port_enable

_serial_port_enable:
    push bp
    mov bp, sp

    mov ax, [bp+4]

    call os_serial_port_enable

    and ah, 64
    jnz .error

    mov word [_ioerr], 0
    jmp .skip

.error:
    mov word [_ioerr], 1
 
.skip:
    pop bp
    ret
