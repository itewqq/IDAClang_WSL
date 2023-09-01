TIL_NAME = xnu_x64
TIL_DESC = "Darwin Kernel Headers for x64 macOS"
INPUT_FILE = xnu.h
SDK = /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.0.sdk
CLANG_ARGV = -target x86_64-apple-macos12.0                              \
             -x c++                                                      \
             -isysroot $(SDK)                                            \
             -I$(SDK)/System/Library/Frameworks/Kernel.framework/Headers \
             -nostdinc                                                   \
             -std=gnu++1z                                                \
             -stdlib=libc++                                              \
             -mkernel                                                    \
             -DKERNEL                                                    \
             -DAPPLE                                                     \
             -DNeXT

include ../idaclang.mak
