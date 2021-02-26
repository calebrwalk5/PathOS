global _string_parse

_string_parse:
    push bp
    mov bp, sp
    sub sp, 2

    mov word [bp-2], si

    mov si, [bp+6]

    call os_string_parse

    push bx

    mov bx, [bp+4]
    mov [bx], ax

    pop ax

    mov [bx+2], ax
    mov [bx+4], cx
    mov [bx+6], dx

    mov si, [bp-2]

    mov sp, bp
    pop bp
    ret
