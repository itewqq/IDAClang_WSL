TIL_NAME = qt_mac
TIL_DESC = "Qt 5.15.2 headers for x64 macOS"
INPUT_FILE = qt.h
QTDIR = /Users/Shared/Qt/5.15.2-x64
SDK = /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk
TOOLCHAIN = /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/
CLANG_ARGV = -target x86_64-apple-darwin                           \
             -x objective-c++                                      \
             -isysroot $(SDK)                                      \
             -I$(TOOLCHAIN)/usr/include/c++/v1                     \
             -I$(TOOLCHAIN)/usr/lib/clang/11.0.3/include           \
             -F$(QTDIR)/lib/                                       \
             -I$(QTDIR)/lib/QtCore.framework/Headers               \
             -I$(QTDIR)/lib/QtGui.framework/Headers                \
             -I$(QTDIR)/lib/QtWidgets.framework/Headers            \
             -I$(QTDIR)/lib/QtPrintSupport.framework/Headers       \
             -I$(QTDIR)/lib/QtNetwork.framework/Headers            \
             -I$(QTDIR)/lib/QtCLucene.framework/Headers            \
             -I$(QTDIR)/lib/QtConcurrent.framework/Headers         \
             -I$(QTDIR)/lib/QtDBus.framework/Headers               \
             -I$(QTDIR)/lib/QtDesigner.framework/Headers           \
             -I$(QTDIR)/lib/QtDesignerComponents.framework/Headers \
             -I$(QTDIR)/lib/QtHelp.framework/Headers               \
             -I$(QTDIR)/lib/QtOpenGL.framework/Headers             \
             -I$(QTDIR)/lib/QtSql.framework/Headers                \
             -I$(QTDIR)/lib/QtTest.framework/Headers               \
             -I$(QTDIR)/lib/QtUiPlugin.framework/Headers           \
             -I$(QTDIR)/lib/QtXml.framework/Headers

include ../idaclang.mak
