TIL_NAME = mfc
TIL_DESC = "Microsoft Foundation Class library for x86"
INPUT_FILE = mfc.h
CLANG_ARGV = -x c++ -target i386-pc-win32
include ../idaclang.mak
