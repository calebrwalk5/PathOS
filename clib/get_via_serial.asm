global _get_via_serial

_get_via_serial:
    push bp
    mov bp, sp

    call os_get_via_serial

    and ah, 64
    jnz .error

    mov word [_ioerr], 0
    jmp .skip

.error:
    mov word [_ioerr], 1
 
.skip:
    pop bp
    ret
