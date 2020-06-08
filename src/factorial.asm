global    _main
default   rel

section   .text

factorial_entry:
    cmp       rdi, 1               ; Check if n <= 1 and store ate `rdi`
    jnbe      factorial_recursive  ; If not, perform a recursive call
    mov       rax, 1               ; Return 1, stored at `rax`
    ret
factorial_recursive:
    push      rdi                  ; Push `n` on stack
    dec       rdi                  ; `n-1`
    call      factorial_entry      ; `f(n-1)`, stored in `rax`
    pop       rdi                  ; Pop `n` from stack
    imul      rax, rdi             ; `n * f(n-1)`, stored in `rax`
    ret

_main:
    mov       rdi, 100             ; Factorial of 10
    call      factorial_entry      ; Make the call
    mov       [value], rax

    mov       rax, 0x02000004      ; SYS_write setup (SYS_write at 4 bits offset from 0x02000000)
    mov       rdi, 1               ; SYS_write use STDOUT
    mov       rsi, value           ; SYS_write argument
    mov       rdx, 3               ; SYS_write argument size (bytes)
    syscall                        ; perform SYS_write

    mov       rax, 0x02000001      ; SYS_exit setup  (SYS_write at 1 bit  offset from 0x02000000)
    xor       rdi, rdi             ; SYS_exit argument (return zero)
    syscall                        ; perform SYS_exit

section   .data
value:
    db        0x00, 0x0A
