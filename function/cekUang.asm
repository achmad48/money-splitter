section .data

section .bss

section .text

;Hasil
value:    
    mov [hasil], ecx
ret

cekUang:
    mov ecx, [input1]
    
    ;if(input >= 100000)
    cmp ecx, [pecahanUang+36]
    jge n100000
    
    ;if(input >= 50000)
    cmp ecx, [pecahanUang+32]
    jge n50000
    
    ;if(input >= 20000)
    cmp ecx, [pecahanUang+28]
    jge n20000
    
    ;if(input >= 10000)
    cmp ecx, [pecahanUang+24]
    jge n10000
    
    ;if(input >= 5000)
    cmp ecx, [pecahanUang+20]
    jge n5000
    
    ;if(input >= 2000)
    cmp ecx, [pecahanUang+16]
    jge n2000
    
    ;if(input >= 1000)
    cmp ecx, [pecahanUang+12]
    jge n1000
    
    ;if(input >= 500)
    cmp ecx, [pecahanUang+8]
    jge n500
    
    ;if(input >= 200)
    cmp ecx, [pecahanUang+4]
    jge n200
    
    ;if(input >= 100)
    cmp ecx, [pecahanUang+0]
    jge n100
    
n100:
    ;if(input >= 100 && input < 200)
    cmp ecx, [pecahanUang+4]
    mov ecx, [pecahanUang+0]    ; ecx = 100
    jl value

n200:
    ;if(input >= 200 && input < 500)
    cmp ecx, [pecahanUang+8]
    mov ecx, [pecahanUang+4]    ; ecx = 200
    jl value

n500:
    ;if(input >= 500 && input < 1000)
    cmp ecx, [pecahanUang+12]
    mov ecx, [pecahanUang+8]    ; ecx = 500
    jl value
    
n1000:
    ;if(input >= 1000 && input < 2000)
    cmp ecx, [pecahanUang+16]
    mov ecx, [pecahanUang+12]    ; ecx = 1000
    jl value

n2000:
    ;if(input >= 2000 && input < 5000)
    cmp ecx, [pecahanUang+20]
    mov ecx, [pecahanUang+16]    ; ecx = 2000
    jl value

n5000:
    ;if(input >= 5000 && input < 10000)
    cmp ecx, [pecahanUang+24]
    mov ecx, [pecahanUang+20]    ; ecx = 5000
    jl value
    
n10000:
    ;if(input >= 10000 && input < 20000)
    cmp ecx, [pecahanUang+28]
    mov ecx, [pecahanUang+24]    ; ecx = 10000
    jl value

n20000:
    ;if(input >= 20000 && input < 50000)
    cmp ecx, [pecahanUang+32]
    mov ecx, [pecahanUang+28]    ; ecx = 20000
    jl value

n50000:
    ;if(input >= 50000 && input < 100000)
    cmp ecx, [pecahanUang+36]
    mov ecx, [pecahanUang+32]    ; ecx = 50000
    jl value
    
n100000:
    mov ecx, [pecahanUang+36]    ; ecx = 100000
    JMP value
    
ret
