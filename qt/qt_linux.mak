TIL_NAME = qt_linux
TIL_DESC = "Qt 5.15.2 headers for x64 Linux"
INPUT_FILE = qt.h
QTDIR = /usr/local/Qt/5.15.2-x64
GCC_VERSION = $(shell expr `gcc -dumpversion | cut -f1 -d.`)
CLANG_ARGV = -target x86_64-pc-linux                                      \
             -x c++                                                       \
             -I/usr/lib/gcc/x86_64-linux-gnu/$(GCC_VERSION)/include       \
             -I/usr/local/include                                         \
             -I/usr/lib/gcc/x86_64-linux-gnu/$(GCC_VERSION)/include-fixed \
             -I/usr/include/x86_64-linux-gnu                              \
             -I/usr/include                                               \
             -I$(QTDIR)/include                                           \
             -I$(QTDIR)/include/QtCore                                    \
             -I$(QTDIR)/include/QtGui                                     \
             -I$(QTDIR)/include/QtWidgets                                 \
             -I$(QTDIR)/include/QtPrintSupport                            \
             -I$(QTDIR)/include/QtNetwork                                 \
             -I$(QTDIR)/include/QtConcurrent                              \
             -I$(QTDIR)/include/QtDBus                                    \
             -I$(QTDIR)/include/QtDesigner                                \
             -I$(QTDIR)/include/QtDesignerComponents                      \
             -I$(QTDIR)/include/QtHelp                                    \
             -I$(QTDIR)/include/QtOpenGL                                  \
             -I$(QTDIR)/include/QtSql                                     \
             -I$(QTDIR)/include/QtTest                                    \
             -I$(QTDIR)/include/QtUiPlugin                                \
             -I$(QTDIR)/include/QtXml

include ../idaclang.mak
