import ida_srclang

clang_argv = [
  "-target x86_64-apple-darwin",
  "-x c++",
  "-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk",
  "-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1",
  "-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/11.0.3/include",
  ]
ida_srclang.set_parser_argv("clang", " ".join(clang_argv))

decl = """
#include <string>
#include <vector>
#include <map>
#include <set>

struct stl_example_t
{
  std::string str;
  std::vector<int> vec;
  std::map<std::string, int> map;
  std::set<char> set;
};
"""
ida_srclang.parse_decls_with_parser("clang", None, decl, False)
