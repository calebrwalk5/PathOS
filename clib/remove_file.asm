global _remove_file

_remove_file:
    push bp
    mov bp, sp

    mov ax, word [bp+4]

    call os_remove_file

    jc .error

    mov word [_ioerr], 0
    jmp .skip

.error:
    mov word [_ioerr], 1
 
.skip:

    pop bp
    ret
