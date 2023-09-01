TIL_NAME = xnu_ios
TIL_DESC = "Darwin Kernel Headers for arm64e iOS"
INPUT_FILE = xnu.h
SDK = /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.0.sdk
CLANG_ARGV = -target arm64e-apple-ios15-macabi                           \
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
