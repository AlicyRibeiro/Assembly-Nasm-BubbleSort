# Bubble Sort em Assembly x86 (32-bit)

Este repositório contém uma implementação do algoritmo de ordenação **Bubble Sort** desenvolvida em **Assembly x86 (32-bit)**, utilizando o montador **NASM (Netwide Assembler)**. O projeto serve como um exercício prático e demonstração de programação de baixo nível.

##  Objetivo

O principal objetivo deste código foi desenvolver uma implementação direta do algoritmo Bubble Sort em Assembly x86.

##  Características da Implementação

| Recurso | Detalhes |
| :--- | :--- |
| **Montador** | NASM (Netwide Assembler). |
| **Arquitetura** | x86 32-bit (formato ELF32). |
| **Algoritmo** | Bubble Sort (dois *loops* aninhados: `.outer_loop` e `.inner_loop`). |
| **Tipo de Dados** | O array é definido usando `dw` (Word de 16 bits), permitindo números negativos. |
| **I/O** | Utiliza a função `printf` da biblioteca C (`libc`) para imprimir o array ordenado. |

### Array Inicial

O array pode ser modificado no arquivo `bubblesort.asm` na seção `.data`. O código lida com arrays em ordem decrescente, crescente, ou com números negativos.

**Array Exemplo (em `bubblesort.asm`):**
```assembly
array      dw 5, 3, 8, 2 ,74, 34, 97, 25    ; Array de inteiros (16 bits) para ordenar
array_len  equ ($ - array) / 2   ; Calcula o tamanho do array
```


### Outros Casos de Teste Sugeridos

* **Array decrescente:** `array dw 10, 9, 8, 7, 6, 5, 4, 3, 2, 1`
* **Array com negativos:** `array dw 100, -50, 0, 25, -25`

## Compilação e Execução (Linux 32-bit)

Para compilar e executar este código, você precisará ter o **NASM** e o **GCC** instalados, com suporte para compilação de binários de 32 bits (`-m32`).

### Pré-requisitos (No Linux, baseado em Debian/Ubuntu)

```bash
sudo apt update
sudo apt install nasm gcc-multilib build-essential
```
### Passos de Compilação

Execute os comandos na ordem:

1.  **Montar (Assemble):** Converte o Assembly (`.asm`) para um arquivo objeto (`.o`).
    ```bash
    $ nasm -f elf32 bubblesort.asm -o bubble.o
    ```
2.  **Ligar (Link):** Cria o executável final, linkando o arquivo objeto com a `libc` (para usar o `printf`).
    ```bash
    $ gcc -m32 -no-pie bubble.o -o bubble -fno-pie
    ```
3.  **Executar:**
    ```bash
    $ ./bubble
    ```
    O programa imprimirá o array ordenado na saída padrão.

### Código de Referência

O código C equivalente para o Bubble Sort está disponível no arquivo `reference/bubble_sort.c` para comparação da lógica do algoritmo.
