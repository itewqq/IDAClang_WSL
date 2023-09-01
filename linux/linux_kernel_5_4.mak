TIL_NAME = linux_kernel_5_4
TIL_DESC = "Linux kernel headers for 5.4.0-159-generic"
INPUT_FILE = linux.h
# WSL_PREFIX = C:\Users\hp\Desktop\se\kernel\examples\linux-headers\linux-headers-5.4.0-159-generic
SYSTEM_HEADERS = C:\Users\hp\Desktop\se\kernel\examples\linux-headers\system-headers
KERNEL_HEADERS = C:\Users\hp\Desktop\se\kernel\examples\linux-headers\kernel-headers

# KERNEL_HEADERS = /usr/src/linux-headers-5.4.0-159-generic
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
