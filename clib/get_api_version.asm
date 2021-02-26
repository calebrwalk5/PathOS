global _get_api_version

_get_api_version:
    push bp
    mov bp, sp

    call os_get_api_version

    pop bp
    ret