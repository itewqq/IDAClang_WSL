# Using IDAClang.exe for Linux 

>This project is meant to make life easier when reversing linux kernel/modules without debug information.

## Requirements

1. Windows WSL installed.
2. [Download the examples.zip from IDA website.](https://hex-rays.com/tutorials/idaclang/examples.zip), `unzip` and `cd` to it.
3. You should also have `idaclang.exe`, `libclang.dll`, `ida.hlp` from IDA Pro, and `tilib64.exe` from IDA SDK. They are **NOT** provided in this repo and figure it out for yourself.

The file tree should be like:

```
.
├── ida.hlp
├── idaclang.exe
├── idaclang.mak
├── libclang.dll
├── linux
│   ├── linux.h
│   ├── linux_kernel_4_9.mak
│   ├── linux_kernel_5_11.mak
│   ├── linux_kernel_5_4.mak
│   └── lkm_example
├── linux-headers
│   ├── kernel-headers
│   └── system-headers
├── tilib64.exe
├── README.MD
```

## Prepare the linux headers

The `.exe` in Windows cannot read WSL filesystem with `/usr/src/xxx` path, so we have to copy the system and kernel headers to Windows filesystem. For example:

```sh
mkdir linux-headers
cd linux-headers
cp -LR /usr/src/linux-headers-5.4.0-159-generic/ kernel-headers/
cp -LR /usr/lib/gcc/x86_64-linux-gnu/9/include system-headers/
```

Don't forget to use `-L` option in `cp` to handle the symbolic/soft links correctly.

## Makefiles

Write a linux_kernel_5_4.mak to include all the required headers:

```makefile
TIL_NAME = linux_kernel_5_4
TIL_DESC = "Linux kernel headers for 5.4.0-159-generic"
INPUT_FILE = linux.h
SYSTEM_HEADERS = C:\Users\hp\Desktop\se\kernel\examples\linux-headers\system-headers
KERNEL_HEADERS = C:\Users\hp\Desktop\se\kernel\examples\linux-headers\kernel-headers

CLANG_ARGV = -target x86_64-pc-linux-gnu                               \
             -nostdinc                                                 \
             -isystem "$(SYSTEM_HEADERS)"         \
             -I"$(KERNEL_HEADERS)\arch\x86\include"                      \
             -I"$(KERNEL_HEADERS)\arch\x86\include\generated"            \
             -I"$(KERNEL_HEADERS)\include"                               \
             -I"$(KERNEL_HEADERS)\arch\x86\include\uapi"                 \
             -I"$(KERNEL_HEADERS)\arch\x86\include\generated\uapi"       \
             -I"$(KERNEL_HEADERS)\include\uapi"                          \
             -I"$(KERNEL_HEADERS)\include\generated\uapi"                \
             -D__KERNEL__                                              \
             -O2                                                       \
             -mfentry                                                  \
             -DCC_USING_FENTRY                                         \
             -Wno-gnu-variable-sized-type-not-at-end

include ../idaclang.mak
```

Change the ldaclang.mak to call Windows binaries from WSL:

```makefile
IDACLANG_ARGS += --idaclang-log-all
IDACLANG_ARGS += --idaclang-tilname $(TIL_NAME)
IDACLANG_ARGS += --idaclang-tildesc $(TIL_DESC)

CLANG_ARGV += -ferror-limit=50

all: $(TIL_NAME)
.PHONY: all $(TIL_NAME) clean
$(TIL_NAME): $(TIL_NAME).til

$(TIL_NAME).til: $(TIL_NAME).mak $(INPUT_FILE)
	/mnt/c/Users/hp/Desktop/se/kernel/examples/idaclang.exe $(IDACLANG_ARGS) $(CLANG_ARGV) $(INPUT_FILE) > $(TIL_NAME).log
	/mnt/c/Users/hp/Desktop/se/kernel/examples/tilib64.exe -ls $(TIL_NAME).til > $(TIL_NAME).til.txt

clean:
	rm -rf *.til *.txt *.log

```

Then just run the make command:

```
$ make -f linux_kernel_5_4.mak
/mnt/c/Users/hp/Desktop/se/kernel/examples/idaclang.exe --idaclang-log-all --idaclang-tilname linux_kernel_5_4 --idaclang-tildesc "Linux kernel headers for 5.4.0-159-generic" -target x86_64-pc-linux-gnu -nostdinc -isystem "C:\Users\hp\Desktop\se\kernel\examples\linux-headers\system-headers" -I"C:\Users\hp\Desktop\se\kernel\examples\linux-headers\kernel-headers\arch\x86\include" -I"C:\Users\hp\Desktop\se\kernel\examples\linux-headers\kernel-headers\arch\x86\include\generated" -I"C:\Users\hp\Desktop\se\kernel\examples\linux-headers\kernel-headers\include" -I"C:\Users\hp\Desktop\se\kernel\examples\linux-headers\kernel-headers\arch\x86\include\uapi" -I"C:\Users\hp\Desktop\se\kernel\examples\linux-headers\kernel-headers\arch\x86\include\generated\uapi" -I"C:\Users\hp\Desktop\se\kernel\examples\linux-headers\kernel-headers\include\uapi" -I"C:\Users\hp\Desktop\se\kernel\examples\linux-headers\kernel-headers\include\generated\uapi" -D__KERNEL__ -O2 -mfentry -DCC_USING_FENTRY -Wno-gnu-variable-sized-type-not-at-end -ferror-limit=50 linux.h > linux_kernel_5_4.log
/mnt/c/Users/hp/Desktop/se/kernel/examples/tilib64.exe -ls linux_kernel_5_4.til > linux_kernel_5_4.til.txt
```

The generated type library is `.til` and you can check the structures it generated in `.til.txt`.

## Use the type library

1. Put the `.til` to your `IDA_INSTALL_LOCATION\til\pc\`
2. In IDA, hit `Shift+F11` to open the type library window and choose the generated lib.
3. Now check the `Local Types` tab and you will see all the structures.
4. There maybe some errors for the imported structures (IDK why but seems to be size-calculation error). Just just manually repair the empty structs with content from .til.txt, for example in my case:

```c
struct mutex
{
  atomic_long_t owner;
  spinlock_t wait_lock;
  optimistic_spin_queue osq;
  list_head wait_list;
};

struct fown_struct
{
  rwlock_t lock;
  pid *pid;
  pid_type pid_type;
  kuid_t uid;
  kuid_t euid;
  int signum;
};
```

If you have any better solutions or problems, PR/issues please :).

## References

- [1] Using the IDAClang plugin for IDA Pro https://hex-rays.com/tutorials/idaclang/
- [2] Type libraries in IDA: https://hex-rays.com/blog/igors-tip-of-the-week-60-type-libraries/