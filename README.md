# machos kernel + x86-64 architecture assembly

> Working with the mach kernel + x86-64 architecture assembly

The main purpose of this project is to study the mach kernel and the Mach-O
Executable, alongside the System V Application Binary Interface (ABI).
There's alreay an example on how to perform a `SYS_write` + `SYS_exit` calls
for the mach kernel at [`src/write_syscall.asm`](src/write_syscall.asm).

The code is written using the Netwide Assembler (NASM) format.

## Building steps

```sh
$ nasm -f macho64 src/write_syscall.asm
$ ld -macosx_version_min 10.15.0 -lSystem -no_pie -o bin/hello_world src/write_syscall.o
$ bin/hello_world
```

## References

- [x86 and amd64 instruction reference](https://www.felixcloutier.com/x86/index.html)
- [NASM Tutorial](https://cs.lmu.edu/~ray/notes/nasmtutorial/)
- [Mach-O Executables](https://www.objc.io/issues/6-build-tools/mach-o-executables/)
- [Mach-O Programming Topics](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/MachOTopics/0-Introduction/introduction.html#//apple_ref/doc/uid/TP40001827-SW1)
- [OS X Assembler Reference](https://developer.apple.com/library/archive/documentation/DeveloperTools/Reference/Assembler/000-Introduction/introduction.html#//apple_ref/doc/uid/TP30000851-CH211-SW1)
- [Introduction to x64 Assembly](https://software.intel.com/content/www/us/en/develop/articles/introduction-to-x64-assembly.html)

## License

[MIT License](http://earaujoassis.mit-license.org/) &copy; Ewerton Carlos Assis
