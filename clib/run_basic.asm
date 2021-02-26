global _run_basic

_run_basic:
    push bp
    mov bp, sp
    sub sp, 4

    mov [bp-2], bx
    mov [bp-4], si

    mov ax, word [bp+4]
    mov bx, word [bp+6]
    mov si, word [bp+8]

    call os_run_basic

    mov si, word [bp-4]
    mov bx, word [bp-2]

    mov sp, bp
    pop bp
    ret
