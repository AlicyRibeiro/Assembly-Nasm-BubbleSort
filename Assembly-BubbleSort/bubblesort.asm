section .data
    array      dw 5, 3, 8, 2 ,74, 34, 97, 25    ; Array de inteiros (16 bits) para ordenar
    array_len  equ ($ - array) / 2   ; Calcula o tamanho do array em elementos (cada elemento ocupa 2 bytes)
    fmt        db "%d ", 0           ; String de formato para imprimir um inteiro seguido de espaço
    newline    db 10, 0              ; Caractere de nova linha (10 em ASCII)

section .text
    global main                      ; Torna o símbolo 'main' visível para o linker
    extern printf                    ; Declara que a função printf está definida externamente

main:
    push ebp                         ; Salva base pointer anterior
    mov ebp, esp                     ; Estabelece novo frame da pilha

    ; ====== Ordenação Bubble Sort ======
    mov ecx, array_len               ; ecx = tamanho do array
    dec ecx                          ; ecx = tamanho - 1 (n-1 comparações externas)
    jle .end_sort                    ; Se tamanho <= 1, pula ordenação

.outer_loop:
    mov edx, ecx                     ; edx = número de comparações internas
    xor esi, esi                     ; esi = 0 (índice j para elementos vizinhos)

.inner_loop:
    mov ax, [array + esi*2]          ; ax = array[j]
    mov bx, [array + esi*2 + 2]      ; bx = array[j+1]
    
    cmp ax, bx                       ; Compara array[j] com array[j+1]
    jle .no_swap                     ; Se já estão em ordem, não faz troca

    ; --- Troca os elementos ---
    mov [array + esi*2], bx          ; array[j] = array[j+1]
    mov [array + esi*2 + 2], ax      ; array[j+1] = array[j]

.no_swap:                            ;o swap troca o conteúdo de duas variáveis ·
    inc esi                          ; j++
    dec edx                          ; número de comparações restantes
    jnz .inner_loop                  ; Continua enquanto edx > 0
    
    loop .outer_loop                 ; ecx-- e repete se ecx > 0

.end_sort:

    ; ====== Impressão do Array Ordenado ======
    xor esi, esi                     ; esi = 0 (índice de impressão)

.print_loop:
    cmp esi, array_len               ; Verifica se já imprimimos todos os elementos
    jge .end_print                   ; Se sim, pula

    movzx eax, word [array + esi*2]  ; Move o valor do array para eax com extensão zero
    push eax                         ; Empilha o valor para passar ao printf
    push fmt                         ; Empilha o ponteiro para o formato "%d "
    call printf                      ; Chama printf para imprimir o valor
    add esp, 8                       ; Desempilha os dois argumentos

    inc esi                          ; i++
    jmp .print_loop                  ; Repete o loop

.end_print:
    push newline                     ; Empilha a nova linha
    call printf                      ; Imprime nova linha
    add esp, 4                       ; Limpa a pilha

    ; ====== Finalização ======
    mov esp, ebp                     ; Restaura ponteiro da pilha
    pop ebp                          ; Restaura base pointer anterior
    xor eax, eax                     ; Valor de retorno = 0 (sucesso)
    ret                              ; Retorna da função main

