global    _main

section   .data
message:
    db        "Write call!", 10

section   .text
_main:
    mov       rax, 0x02000004 ; SYS_write setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 1          ; SYS_write use STDOUT
    mov       rsi, message    ; SYS_write argument
    mov       rdx, 11         ; SYS_write argument size (bytes)
    syscall                   ; perform SYS_write
    mov       rax, 0x02000001 ; SYS_exit setup
    xor       rdi, rdi        ; SYS_exit argument
    syscall                   ; perform SYS_exit
