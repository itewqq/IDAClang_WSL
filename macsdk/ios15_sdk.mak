TIL_NAME = ios15_sdk
TIL_DESC = "iPhoneOS15.0.sdk headers for arm64"
INPUT_FILE = ios15_sdk.h
SDK = /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk
TOOLCHAIN = /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain
CLANG_ARGV = -target arm64-apple-darwin                  \
             -x objective-c++                            \
             -isysroot $(SDK)                            \
             -I$(TOOLCHAIN)/usr/lib/clang/13.0.0/include

include ../idaclang.mak
