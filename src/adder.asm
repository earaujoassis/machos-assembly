global    _main
default   rel

section   .text
_main:
    mov       rax, 0x02000004    ; SYS_write setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 1             ; SYS_write use STDOUT
    mov       rsi, warning_msg   ; SYS_write argument
    mov       rdx, 33            ; SYS_write argument size (bytes)
    syscall                      ; perform SYS_write

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
    mov       rsi, number_2nd    ; SYS_write argument
    mov       rdx, 21            ; SYS_write argument size (bytes)
    syscall                      ; perform SYS_write

    mov       rax, 0x02000003    ; SYS_read setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 0             ; SYS_read use STDIN
    mov	      rsi, number_2nd_b  ; SYS_read store the byte at `number_1st_b`
    mov       rdx, 2             ; SYS_read read up to 1 byte only
    syscall

    mov       rbx, [number_1st_b]
    mov       rcx, [number_2nd_b]
    add       rbx, rcx
    sub       rbx, 48
    mov       [added], rbx
    mov       rax, 0x02000004    ; SYS_write setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 1             ; SYS_write use STDOUT
    mov       rsi, added         ; SYS_write argument
    mov       rdx, 2             ; SYS_write argument size (bytes)
    syscall                      ; perform SYS_write

    mov       rax, 0x02000004    ; SYS_write setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 1             ; SYS_write use STDOUT
    mov       rsi, new_line      ; SYS_write argument
    mov       rdx, 1             ; SYS_write argument size (bytes)
    syscall                      ; perform SYS_write

    mov       rax, 0x02000001    ; SYS_exit setup  (SYS_write at 1 bit  offset from 0x02000000)
    xor       rdi, rdi           ; SYS_exit argument (check if it's zero)
    syscall                      ; perform SYS_exit

section   .data
warning_msg:
    db        "This only works from 0-9 numbers", 0xA
number_1st:
    db        "Read the 1st number: "
number_2nd:
    db        "Read the 2nd number: "
new_line:
    db        0xA
number_1st_b:
    db        0x0, 0x0
number_2nd_b:
    db        0x0, 0x0
added:
    db        0x0, 0xA
