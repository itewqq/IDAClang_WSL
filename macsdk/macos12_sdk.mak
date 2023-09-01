TIL_NAME = macos12_sdk
TIL_DESC = "MacOSX12.0.sdk headers for x64"
INPUT_FILE = macos12_sdk.h
SDK = /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.0.sdk
TOOLCHAIN = /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain
CLANG_ARGV = -target x86_64-apple-darwin                 \
             -x objective-c++                            \
             -isysroot $(SDK)                            \
             -I$(TOOLCHAIN)/usr/lib/clang/13.0.0/include

include ../idaclang.mak
