global _list_dialog

_list_dialog:
    push bp
    mov bp, sp
    sub sp, 2

    mov [bp-2], bx

    mov ax, word [bp+4]
    mov bx, word [bp+6]
    mov cx, word [bp+8]

    call os_list_dialog

    jnc .skip

    xor ax, ax

.skip:
    mov bx, word [bp-2]

    mov sp, bp
    pop bp
    ret
