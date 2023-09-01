IDACLANG_ARGS += --idaclang-log-all
IDACLANG_ARGS += --idaclang-tilname $(TIL_NAME)
IDACLANG_ARGS += --idaclang-tildesc $(TIL_DESC)

CLANG_ARGV += -ferror-limit=50

all: $(TIL_NAME)
.PHONY: all $(TIL_NAME) clean
$(TIL_NAME): $(TIL_NAME).til

$(TIL_NAME).til: $(TIL_NAME).mak $(INPUT_FILE)
	/mnt/c/Users/hp/Desktop/se/kernel/examples/idaclang.exe $(IDACLANG_ARGS) $(CLANG_ARGV) $(INPUT_FILE) > $(TIL_NAME).log
	/mnt/c/Users/hp/Desktop/se/kernel/examples/tilib64.exe -ls $(TIL_NAME).til > $(TIL_NAME).til.txt

clean:
	rm -rf *.til *.txt *.log
