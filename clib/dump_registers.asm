global _dump_registers

_dump_registers:
    push bp
    mov bp, sp

    call os_dump_registers

    pop bp
    ret
