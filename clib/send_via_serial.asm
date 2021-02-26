global _send_via_serial

_send_via_serial:
    push bp
    mov bp, sp

    mov al, byte [bp+4]

    call os_send_via_serial

    and ah, 64
    jnz .error

    mov word [_ioerr], 0
    jmp .skip

.error:
    mov word [_ioerr], 1
 
.skip:
    pop bp
    ret
