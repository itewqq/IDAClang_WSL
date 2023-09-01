import sys
import ida_pro
import ida_auto
import ida_srclang

clang_argv = {
  "-target x86_64-pc-linux",
  "-x c++",
  "-std=c++11",
  "-I./boost_1_77_0",
  # NOTE: include paths were copied from the output of `cpp -v`. they might differ on your machine.
  "-I/usr/lib/gcc/x86_64-linux-gnu/6/include",
  "-I/usr/local/include",
  "-I/usr/lib/gcc/x86_64-linux-gnu/6/include-fixed",
  "-I/usr/include/x86_64-linux-gnu",
  "-I/usr/include",
}

# invoke the clang parser
ida_srclang.set_parser_argv("clang", " ".join(clang_argv))
ida_srclang.parse_decls_with_parser("clang", None, "./chat_server.cpp", True)

# analyze the input file
ida_auto.auto_mark_range(0, BADADDR, AU_FINAL)
ida_auto.auto_wait()

# save and exit
ida_pro.qexit(0)
