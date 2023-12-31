TIL_NAME = idasdk_win
TIL_DESC = "IDA SDK headers for x64 Windows"
INPUT_FILE = idasdk.h
CLANG_ARGV = -target x86_64-pc-win32       \
             -x c++                        \
             -I./idasdk77/include          \
             -D__NT__                      \
             -D__EA64__                    \
             -Wno-nullability-completeness

include ../idaclang.mak
