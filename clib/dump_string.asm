global _dump_string

_dump_string:
    push bp
    mov bp, sp

    mov si, word [bp+4]

    call os_dump_string

    pop bp
    ret