global _speaker_tone

_speaker_tone:
    push bp
    mov bp, sp

    mov ax, word [bp+4]

    call os_speaker_tone

    pop bp
    ret
