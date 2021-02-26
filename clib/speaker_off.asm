global _speaker_off

_speaker_off:
    push bp
    mov bp, sp

    call os_speaker_off

    pop bp
    ret
