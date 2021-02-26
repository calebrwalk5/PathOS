global _string_compare

_string_compare:
    push bp
    mov bp, sp

    mov si, [bp+4]
    mov di, [bp+6]

    call os_string_compare

    jc .same

    xor ax, ax
    jmp .skip

.same:
    mov ax, 1

.skip:

    pop bp
    ret
