TIL_NAME = qt_win
TIL_DESC = "Qt 5.15.2 headers for x64 Windows"
INPUT_FILE = qt.h
QTDIR = C:\Qt\5.15.2-x64
CLANG_ARGV = -target x86_64-pc-win32                   \
             -x c++                                    \
             -I"$(QTDIR)\include"                      \
             -I"$(QTDIR)\include\QtCore"               \
             -I"$(QTDIR)\include\QtGui"                \
             -I"$(QTDIR)\include\QtWidgets"            \
             -I"$(QTDIR)\include\QtPrintSupport"       \
             -I"$(QTDIR)\include\QtNetwork"            \
             -I"$(QTDIR)\include\QtConcurrent"         \
             -I"$(QTDIR)\include\QtDBus"               \
             -I"$(QTDIR)\include\QtDesigner"           \
             -I"$(QTDIR)\include\QtDesignerComponents" \
             -I"$(QTDIR)\include\QtHelp"               \
             -I"$(QTDIR)\include\QtOpenGL"             \
             -I"$(QTDIR)\include\QtSql"                \
             -I"$(QTDIR)\include\QtTest"               \
             -I"$(QTDIR)\include\QtUiPlugin"           \
             -I"$(QTDIR)\include\QtXml"

include ../idaclang.mak
