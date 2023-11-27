TIL_NAME = libstl_cpp
TIL_DESC = "Linux stl"
INPUT_FILE = stl_example.h

SYSTEM_HEADERS = C:\Users\hp\Desktop\se\kernel\examples\linux-headers\system-headers
USR_INCLUDE_HEADERS = C:\Users\hp\Desktop\se\kernel\examples\linux-headers\usr_include_headers
CLANG_ARGV = -target x86_64-pc-linux-gnu                               \
            -x c++                                                 \
            -I"$(SYSTEM_HEADERS)" \
            -I"$(USR_INCLUDE_HEADERS)\include\linux" \
            -I"$(USR_INCLUDE_HEADERS)\include\c++\9" \
            -I"$(USR_INCLUDE_HEADERS)\include\x86_64-linux-gnu" \
            -I"$(USR_INCLUDE_HEADERS)\include\x86_64-linux-gnu\c++\9" \
            -I"$(USR_INCLUDE_HEADERS)\include"
            


include ../idaclang.mak