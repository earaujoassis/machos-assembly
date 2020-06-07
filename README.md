# machos kernel + x86-64 architecture assembly

> Working with the mach kernel + x86-64 architecture assembly

The main purpose of this project is to study the mach kernel and the Mach-O Executable.
There's alreay an example on how to perform a `SYS_write` + `SYS_exit` calls for the
mach kernel at [`src/write_syscall.asm`](src/write_syscall.asm).

## Building steps

```sh
$ nasm -f macho64 src/write_syscall.asm
$ ld -macosx_version_min 10.15.0 -lSystem -no_pie -o bin/hello_world src/write_syscall.o
$ bin/hello_world
```

## License

[MIT License](http://earaujoassis.mit-license.org/) &copy; Ewerton Carlos Assis
