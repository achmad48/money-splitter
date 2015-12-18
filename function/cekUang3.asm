section .data

section .bss

section .text

;Hasil
value3:    
    mov [hasil3], ecx
ret

cekUang3:
    mov ecx, [input3]
    
    ;if(input >= 20000)
    cmp ecx, [pecahanUang+28]
    jge nc20000
    
    ;if(input >= 10000)
    cmp ecx, [pecahanUang+24]
    jge nc10000
    
    ;if(input >= 5000)
    cmp ecx, [pecahanUang+20]
    jge nc5000
    
    ;if(input >= 2000)
    cmp ecx, [pecahanUang+16]
    jge nc2000
    
    ;if(input >= 1000)
    cmp ecx, [pecahanUang+12]
    jge nc1000
    
    ;if(input >= 500)
    cmp ecx, [pecahanUang+8]
    jge nc500
    
    ;if(input >= 200)
    cmp ecx, [pecahanUang+4]
    jge nc200
    
    ;if(input >= 100)
    cmp ecx, [pecahanUang+0]
    jge nc100
    
nc100:
    ;if(input >= 100 && input < 200)
    cmp ecx, [pecahanUang+4]
    mov ecx, [pecahanUang+0]    ; ecx = 100
    jl value3

nc200:
    ;if(input >= 200 && input < 500)
    cmp ecx, [pecahanUang+8]
    mov ecx, [pecahanUang+4]    ; ecx = 200
    jl value3

nc500:
    ;if(input >= 500 && input < 1000)
    cmp ecx, [pecahanUang+12]
    mov ecx, [pecahanUang+8]    ; ecx = 500
    jl value3
    
nc1000:
    ;if(input >= 1000 && input < 2000)
    cmp ecx, [pecahanUang+16]
    mov ecx, [pecahanUang+12]    ; ecx = 1000
    jl value3

nc2000:
    ;if(input >= 2000 && input < 5000)
    cmp ecx, [pecahanUang+20]
    mov ecx, [pecahanUang+16]    ; ecx = 2000
    jl value3

nc5000:
    ;if(input >= 5000 && input < 10000)
    cmp ecx, [pecahanUang+24]
    mov ecx, [pecahanUang+20]    ; ecx = 5000
    jl value3
    
nc10000:
    ;if(input >= 10000 && input < 20000)
    cmp ecx, [pecahanUang+28]
    mov ecx, [pecahanUang+24]    ; ecx = 10000
    jl value3

nc20000:
    ;if(input >= 20000)
    mov ecx, [pecahanUang+28]    ; ecx = 20000
    JMP value3
ret
