TIL_NAME = linux_kernel_5_11
TIL_DESC = "Linux kernel headers for 5.11.0-41-generic (Ubuntu 20.04)"
INPUT_FILE = linux.h
KERNEL_HEADERS = /usr/src/linux-headers-5.11.0-41-generic
CLANG_ARGV = -target x86_64-pc-linux-gnu                               \
             -nostdinc                                                 \
             -isystem /usr/lib/gcc/x86_64-linux-gnu/9/include          \
             -I$(KERNEL_HEADERS)/arch/x86/include                      \
             -I$(KERNEL_HEADERS)/arch/x86/include/generated            \
             -I$(KERNEL_HEADERS)/include                               \
             -I$(KERNEL_HEADERS)/arch/x86/include/uapi                 \
             -I$(KERNEL_HEADERS)/arch/x86/include/generated/uapi       \
             -I$(KERNEL_HEADERS)/include/uapi                          \
             -I$(KERNEL_HEADERS)/include/generated/uapi                \
             -include $(KERNEL_HEADERS)/include/linux/compiler_types.h \
             -D__KERNEL__                                              \
             -O2                                                       \
             -mfentry                                                  \
             -DCC_USING_FENTRY                                         \
             -Wno-gnu-variable-sized-type-not-at-end

include ../idaclang.mak
