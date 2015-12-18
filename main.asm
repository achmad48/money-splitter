%include    'function/scanNum.asm'
%include    'function/printNum.asm'
%include    'function/printString.asm'
%include    'function/printChar.asm'
%include    'function/newLine.asm'

%include    'function/cekUang.asm'
%include    'function/cekUang2.asm'
%include    'function/cekUang3.asm'
extern	printf

SECTION .data
    kata5   db  "******************************************************",0xa,0
    kata1   db  "*                Program memecah uang                *",0xa,0
    kata6   db  "******************************************************",0xa,0
    kata2   db  0xa,"Silakan masukkan nominal uang yang diinginkan : ",0,
    kata3   db  "%d ada sebanyak %d",0xa,0
    kata4   db "Apakah anda ingin mengulang ? (1. Ya, 2. Tidak)", 10,0
    
    kata7   db  0xa,"****Kemungkinan 1****",0xa,0
    kata8   db  0xa,"****Kemungkinan 2****",0xa,0
    kata9   db  0xa,"****Kemungkinan 3****",0xa,0
    
    ;Array
    pecahanUang     dd 100
                    dd 200
                    dd 500
                    dd 1000
                    dd 2000
                    dd 5000
                    dd 10000
                    dd 20000
                    dd 50000
                    dd 100000
                    
SECTION .bss
    input1 resd 1
    input2 resd 1
    input3 resd 1
    
    hasil resd 1
    hasil2 resd 1
    hasil3 resd 1
    
    count resd 1
    count2 resd 1
    count3 resd 1
    
    temp resd 1

SECTION .text
global main
main:
    memecahUang:    
        ;inisialisasi count = 1
    	mov dword [count], 1
    	mov dword [count2], 1
    	mov dword [count3], 1
    	
    	;Cetak string
        mov eax, kata5
    	mov ebx, 1
    	call printStr
    	
        ;Cetak string
        mov eax, kata1
    	mov ebx, 1
    	call printStr
    	
    	;Cetak string
        mov eax, kata6
    	mov ebx, 1
    	call printStr
    	
    	;Cetak string
        mov eax, kata2
    	mov ebx, 1
    	call printStr
    	
    	;Baca input
    	call scanNum
    	mov dword[temp], eax
    	push dword[temp]
    	
    	;****************KEMUNGKINAN 1*****************;
    	mov ecx, eax    ;eax = input, kemudian eax disimpan di ecx
    	
    	push ecx        ;Masukkan nilai ecx ke stack
    	
    	;Cetak string
        mov eax, kata7
    	mov ebx, 1
    	call printStr
    	
	    ;fungsi perulanagan
    	loopingUang : 
    	    ;ambil nilai stack, masukkan ke ecx
    	    mov ecx, dword[esp+0]
    	    
    	    ;cek ecx apakah kurang dari sama dengan 0
            cmp ecx, 0
                jle kemungkinan2
            
            ;inisialisasi input1 = ecx    
        	mov dword [input1], ecx
            
            ;panggil fungsi cekUang
        	call cekUang
        	
        	;keluarin nilai ecx dari stack
            pop  ecx   
            
            ;cek ecx lebih dari 0
            cmp  ecx, 0
    	    jg compare
    	    
    	    ;akhir program
    	    jmp kemungkinan2
    	    
            compare:
                sub ecx, dword[hasil]       ; sisa = input uang - hasil(cekUang)    
        	    cmp ecx, dword[hasil]       ; sisa >= hasil(cekUang)
        	    push ecx
        	    jge countPlus
        	    jl cetak                    ; sisa < hasil(cekUang)
        	    countPlus:
        	        inc dword[count]        ; count++
        	        jmp loopingUang
                cetak:
                    push dword[count]       ; cetak count
                    push dword[hasil]       ; cetak hasil(cekUang)
                    push kata3              ; cetak kata3
                    call printf
                    add  esp,12
                    
                    mov dword[count], 1     ; count = 1
                    jmp loopingUang
    ;****************AKHIR KEMUNGKINAN 1*****************;
        
    ;****************KEMUNGKINAN 2*****************;
    kemungkinan2: 
        pop ecx
        pop eax         ; dword[temp] dimasukkan ke eax
        
        mov dword[temp], eax
        push dword[temp]
        
    	;Masukkan nilai ecx ke stack
    	mov ecx, eax
    	push ecx
    	
    	;Cetak string
        mov eax, kata8
    	mov ebx, 1
    	call printStr
    	
	    ;fungsi perulanagan
    	loopingUang2 : 
    	    ;ambil nilai stack, masukkan ke ecx
    	    mov ecx, dword[esp+0]
    	    
    	    ;cek ecx apakah kurang dari sama dengan 0
            cmp ecx, 0
                jle kemungkinan3
            
            ;inisialisasi input1 = ecx    
        	mov dword [input2], ecx
            
            ;panggil fungsi cekUang
        	call cekUang2
        	
        	;keluarin nilai ecx dari stack
            pop  ecx   
            
            ;cek ecx lebih dari 0
            cmp  ecx, 0
    	    jg compare2
    	    
    	    ;akhir program
    	    jmp kemungkinan3
    	    
            compare2:
                sub ecx, dword[hasil2]  
        	    cmp ecx, dword[hasil2]
        	    push ecx
        	    jge countPlus2
        	    jl cetak2
        	    countPlus2:
        	        inc dword[count2]
        	        jmp loopingUang2
                cetak2:
                    push dword[count2]
                    push dword[hasil2]
                    push kata3
                    call printf
                    add  esp,12
                    
                    mov dword[count2], 1
                    jmp loopingUang2
                    
    ;****************KEMUNGKINAN 3*****************;
    kemungkinan3: 
        pop ecx
        pop eax         ; dword[temp] dimasukkan ke eax
        
        ;Masukkan nilai ecx ke stack
        mov ecx, eax
        push ecx
        
        ;Cetak string
        mov eax, kata9
        mov ebx, 1
        call printStr
        
        ;fungsi perulanagan
        loopingUang3 : 
            ;ambil nilai stack, masukkan ke ecx
            mov ecx, dword[esp+0]
            
            ;cek ecx apakah kurang dari sama dengan 0
            cmp ecx, 0
                jle ulang
            
            ;inisialisasi input1 = ecx    
            mov dword [input3], ecx
            
            ;panggil fungsi cekUang
            call cekUang3
            
            ;keluarin nilai ecx dari stack
            pop  ecx   
            
            ;cek ecx lebih dari 0
            cmp  ecx, 0
            jg compare3
            
            ;akhir program
            jmp ulang
            
            compare3:
                sub ecx, dword[hasil3]  
                cmp ecx, dword[hasil3]
                push ecx
                jge countPlus3
                jl cetak3
                countPlus3:
                    inc dword[count3]
                    jmp loopingUang3
                cetak3:
                    push dword[count3]
                    push dword[hasil3]
                    push kata3
                    call printf
                    add  esp,12
                    
                    mov dword[count3], 1
                    jmp loopingUang3
    
    ulang:                
        mov eax, 10
    	mov ebx, 1
    	call printChar
    	
    	mov eax, kata4
    	mov ebx, 1
    	call printStr
    	
     	call scanNum
    	cmp eax, 1
    	je memecahUang
    	jmp exit
    	
    	call newline
exit:
        mov eax, 1
        mov ebx, 0
        int 0x80
    
