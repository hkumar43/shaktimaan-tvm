#include <stdio.h>

void add_one(int *input, int *output, int size);

int main() {
  int size = 10;
  int input[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  int output[10];
  add_one(input, output, size);
  for (int i = 0; i < size; ++i) {
    printf("%d ", output[i]);
  }
  printf("\n");
  return 0;
}
