global    _main

section   .text
_main:
    mov       rax, 0x02000004    ; SYS_write setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 1             ; SYS_write use STDOUT
    mov       rsi, number_1st    ; SYS_write argument
    mov       rdx, 21            ; SYS_write argument size (bytes)
    syscall                      ; perform SYS_write

    mov       rax, 0x02000003    ; SYS_read setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 0             ; SYS_read use STDIN
    mov	      rsi, number_1st_b  ; SYS_read store the byte at `number_1st_b`
    mov       rdx, 2             ; SYS_read read up to 1 byte only
    syscall

    mov       rax, 0x02000004    ; SYS_write setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 1             ; SYS_write use STDOUT
    mov       rsi, new_line      ; SYS_write argument
    mov       rdx, 1             ; SYS_write argument size (bytes)
    syscall                      ; perform SYS_write

    mov       rax, 0x02000004    ; SYS_write setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 1             ; SYS_write use STDOUT
    mov       rsi, number_2nd    ; SYS_write argument
    mov       rdx, 21            ; SYS_write argument size (bytes)
    syscall                      ; perform SYS_write

    mov       rax, 0x02000003    ; SYS_read setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 0             ; SYS_read use STDIN
    mov	      rsi, number_2nd_b  ; SYS_read store the byte at `number_1st_b`
    mov       rdx, 2             ; SYS_read read up to 1 byte only
    syscall

    mov       rax, 0x02000004    ; SYS_write setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 1             ; SYS_write use STDOUT
    mov       rsi, new_line      ; SYS_write argument
    mov       rdx, 1             ; SYS_write argument size (bytes)
    syscall                      ; perform SYS_write

    mov       added, number_1st_b
    add       added, number_2nd_b
    mov       rax, 0x02000004    ; SYS_write setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 1             ; SYS_write use STDOUT
    mov       rsi, added         ; SYS_write argument
    mov       rdx, 2             ; SYS_write argument size (bytes)
    syscall                      ; perform SYS_write

    mov       rax, 0x02000001    ; SYS_exit setup  (SYS_write at 1 bit  offset from 0x02000000)
    xor       rdi, rdi           ; SYS_exit argument (check if it's zero)
    syscall                      ; perform SYS_exit

section   .data
number_1st:
    db        "Read the 1st number: ", 10
number_2nd:
    db        "Read the 2nd number: ", 10
new_line:
    db        0xA

section   .bss
number_1st_b:
    resw      4
number_2nd_b:
    resw      4
added:
    resw      4
