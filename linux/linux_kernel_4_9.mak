TIL_NAME = linux_kernel_4_9
TIL_DESC = "Linux kernel headers for 4.9.0-16-amd64 (Debian 9.13)"
INPUT_FILE = linux.h
KERNEL_HEADERS1 = /usr/src/linux-headers-4.9.0-16-common
KERNEL_HEADERS2 = /usr/src/linux-headers-4.9.0-16-amd64
CLANG_ARGV = -target x86_64-pc-linux-gnu                          \
             -nostdinc                                            \
             -isystem /usr/lib/gcc/x86_64-linux-gnu/6/include     \
             -I$(KERNEL_HEADERS1)/arch/x86/include                \
             -I$(KERNEL_HEADERS1)/include                         \
             -I$(KERNEL_HEADERS1)/arch/x86/include/uapi           \
             -I$(KERNEL_HEADERS1)/include/uapi                    \
             -I$(KERNEL_HEADERS2)/arch/x86/include/generated/uapi \
             -I$(KERNEL_HEADERS2)/arch/x86/include/generated      \
             -I$(KERNEL_HEADERS2)/include                         \
             -I$(KERNEL_HEADERS2)/include/generated/uapi          \
             -D__KERNEL__                                         \
             -O2                                                  \
             -mfentry                                             \
             -DCC_USING_FENTRY                                    \
             -Wno-gnu-variable-sized-type-not-at-end

include ../idaclang.mak
