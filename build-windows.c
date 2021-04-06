#include <stdio.h>
#include <Windows.h>

int main() {
  printf("You need need NASM, if you don't have it (go to nasm.us)\n");
  printf("PathOS Build Script For Windows\n");
  printf("Assembling bootloader\n");
  system("cd src/boot/ & nasm -00 -f bin -o bootload.bin bootload.bin");
  printf("Assembling PathOS kernel\n");
  system("cd src & nasm -00 -f -o kernel.bin kernel.asm");
  printf("Compiling libraries\n");
  system("cd clib & nasm -f elf -o ../mlib.a mlib.asm");
  system("start https://www.nasm.us/");
  return 0;
}

main();
