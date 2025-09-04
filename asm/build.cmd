@echo off

REM ; ELF64
REM nasm -f elf64 -o breeze.o breeze.asm
REM ar rcs libbreeze.a breeze.o
REM gcc -c app.c -o app.o
REM gcc -o app_elf64.exe breeze.o app.o

REM ; WIN64
REM -L"C:\Program Files (x86)\Intel\oneAPI\vtune\latest\lib64" -littnotify

nasm -f win64 -o breeze.obj breeze.asm
gcc -c app.c -o app.o -O3 -mavx -msse2 -march=x86-64
gcc -o app_win64.exe breeze.obj app.o