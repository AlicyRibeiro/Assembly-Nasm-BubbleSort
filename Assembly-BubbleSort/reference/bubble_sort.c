#include <stdio.h>

void bubble_sort(int *array, int size) {
    for (int i = 0; i < size - 1; i++) {
        for (int j = 0; j < size - i - 1; j++) {
            if (array[j] > array[j + 1]) {
                // Troca
                int temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}

int main() {
    int array[] = {5, 8, 1, 2};
    int array_len = sizeof(array)/sizeof(array[0]);
    
    bubble_sort(array, array_len);
    
    for (int i = 0; i < array_len; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
    
    return 0;
}