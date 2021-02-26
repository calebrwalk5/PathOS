global _draw_block

_draw_block:
    push bp
    mov bp, sp
    sub sp, 6

    mov [bp-2], bx
    mov [bp-4], si
    mov [bp-6], di

    mov bl, byte [bp+4]
    mov dl, byte [bp+6]
    mov dh, byte [bp+8]
    movzx si, byte [bp+10]
    movzx di, byte [bp+12]

    call os_draw_block

    mov bx, word [bp-2]
    mov si, word [bp-4]
    mov di, word [bp-6]

    mov sp, bp
    pop bp
    ret
