section .data

section .bss

section .text

;Hasil
value2:    
    mov [hasil2], ecx
ret

cekUang2:
    mov ecx, [input2]
    
    ;if(input >= 50000)
    cmp ecx, [pecahanUang+32]
    jge nb50000
    
    ;if(input >= 20000)
    cmp ecx, [pecahanUang+28]
    jge nb20000
    
    ;if(input >= 10000)
    cmp ecx, [pecahanUang+24]
    jge nb10000
    
    ;if(input >= 5000)
    cmp ecx, [pecahanUang+20]
    jge nb5000
    
    ;if(input >= 2000)
    cmp ecx, [pecahanUang+16]
    jge nb2000
    
    ;if(input >= 1000)
    cmp ecx, [pecahanUang+12]
    jge nb1000
    
    ;if(input >= 500)
    cmp ecx, [pecahanUang+8]
    jge nb500
    
    ;if(input >= 200)
    cmp ecx, [pecahanUang+4]
    jge nb200
    
    ;if(input >= 100)
    cmp ecx, [pecahanUang+0]
    jge nb100
    
nb100:
    ;if(input >= 100 && input < 200)
    cmp ecx, [pecahanUang+4]
    mov ecx, [pecahanUang+0]    ; ecx = 100
    jl value2

nb200:
    ;if(input >= 200 && input < 500)
    cmp ecx, [pecahanUang+8]
    mov ecx, [pecahanUang+4]    ; ecx = 200
    jl value2

nb500:
    ;if(input >= 500 && input < 1000)
    cmp ecx, [pecahanUang+12]
    mov ecx, [pecahanUang+8]    ; ecx = 500
    jl value2
    
nb1000:
    ;if(input >= 1000 && input < 2000)
    cmp ecx, [pecahanUang+16]
    mov ecx, [pecahanUang+12]    ; ecx = 1000
    jl value2

nb2000:
    ;if(input >= 2000 && input < 5000)
    cmp ecx, [pecahanUang+20]
    mov ecx, [pecahanUang+16]    ; ecx = 2000
    jl value2

nb5000:
    ;if(input >= 5000 && input < 10000)
    cmp ecx, [pecahanUang+24]
    mov ecx, [pecahanUang+20]    ; ecx = 5000
    jl value2
    
nb10000:
    ;if(input >= 10000 && input < 20000)
    cmp ecx, [pecahanUang+28]
    mov ecx, [pecahanUang+24]    ; ecx = 10000
    jl value2

nb20000:
    ;if(input >= 20000 && input < 50000)
    cmp ecx, [pecahanUang+32]
    mov ecx, [pecahanUang+28]    ; ecx = 20000
    jl value2

nb50000:
    ;if(input >= 50000)
    mov ecx, [pecahanUang+32]    ; ecx = 50000
    JMP value2
ret
