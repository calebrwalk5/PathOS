global _file_selector

_file_selector:
    push bp
    mov bp, sp

    call os_file_selector

    jnc .skip

    xor ax, ax

.skip:
    pop bp
    ret
