global _dialog_box

_dialog_box:
    push bp
    mov bp, sp

    mov ax, word [bp+4]
    mov bx, word [bp+6]
    mov cx, word [bp+8]
    movzx dx, byte [bp+10]

    call os_dialog_box

    pop bp
    ret