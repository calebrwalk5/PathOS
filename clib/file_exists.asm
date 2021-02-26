global _file_exists

_file_exists:
    push bp
    mov bp, sp

    mov ax, word [bp+4]

    call os_file_exists

    jc .failed

    xor ax, ax
    jmp .skip

.failed:
    mov ax, 1

.skip:
    mov [_ioerr], ax

    pop bp
    ret
