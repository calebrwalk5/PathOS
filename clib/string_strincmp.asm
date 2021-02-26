global _string_strincmp

_string_strincmp:
    push bp
    mov bp, sp

    mov si, [bp+4]
    mov di, [bp+6]
    mov cl, byte [bp+8]

    call os_string_strincmp

    jc .same

    xor ax, ax
    jmp .skip

.same:
    mov ax, 1

.skip:

    pop bp
    ret
