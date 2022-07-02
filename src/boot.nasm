; Directives
org 0x7C00  ; tells assembler that variables and labels in this code
            ; should be calculated with the offset 0x7C00 (origin)
bits 16     ; tells assembler to emit 16-bit code
    
; Instructions
main:
    hlt ; end program

; Infinite loop in case CPU starts again after hlt
.halt:
    jmp .halt

; $  = memory location of beginning of current instruction
; $$ = memory location of beginning of current section of instructions
; therefore, $-$$ = size of section so far (in bytes)
times 510-($-$$) db 0 ; db = define byte(s)
dw 0AA55h             ; dw = define word(s) (little endian)
