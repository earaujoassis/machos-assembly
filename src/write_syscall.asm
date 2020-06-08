global    _main

section   .text
_main:
    mov       rax, 0x02000004 ; SYS_write setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 1          ; SYS_write use STDOUT
    mov       rsi, message    ; SYS_write argument
    mov       rdx, 12         ; SYS_write argument size (bytes)
    syscall                   ; perform SYS_write

    mov       rax, 0x02000001 ; SYS_exit setup  (SYS_write at 1 bit  offset from 0x02000000)
    xor       rdi, rdi        ; SYS_exit argument
    syscall                   ; perform SYS_exit

section   .data
message:
    db        "Write call!", 0xA
