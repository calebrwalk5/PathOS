global _input_string

_input_string:
    push bp
    mov bp, sp
    sub sp, 2

    mov [bp-2], bx

    mov ax, [bp+4]
    mov bx, [bp+6]

    call os_input_string

    mov bx, [bp-2]

    mov sp, bp
    pop bp
    ret