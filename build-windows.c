#include <stdio.h>
#include <Windows.h>

int main() {
  printf("PathOS Build Script For Windows\n");
  printf("Assembling bootloader\n");
  system("cd src/boot/ & nasm -00 -f bin -o bootload.bin bootload.bin");
  printf("Assembling PathOS kernel\n");
  system("cd src & nasm -00 -f -o kernel.bin kernel.asm");
  return 0;
}

main();
