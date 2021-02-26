global _string_chomp

_string_chomp:
    push bp
    mov bp, sp

    mov ax, [bp+4]

    call os_string_chomp

    pop bp
    ret
