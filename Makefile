all:
    as -o program1.o program1.s
    gcc -o program1 program1.o

run: all
    qemu-arm ./program1
