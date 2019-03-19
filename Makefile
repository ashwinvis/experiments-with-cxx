dir ?= hello
std ?= c++14
gcc := g++ -Wall -std=$(std)

define STR_HELP
Compile and run each case.

Examples
--------
# Simple
$ make dir=lambda
# Other commands
$ make help
$ make compile
$ make run
$ make clean

endef

export STR_HELP

sources := $(wildcard $(dir)/*.cpp)
objects := $(patsubst %.cpp,%.o,$(sources))
asm := $(patsubst %.cpp,%.s,$(sources))
target := $(dir)/main.out

.PHONY: compile clean help run 


run: compile
	$(target)


help:
	@echo "$$STR_HELP"
	@echo sources=$(sources)
	@echo objects=$(objects)
	@echo compiler=$(gcc)


%.o: %.cpp
	$(gcc) $< -c -o $@

%.s: %.cpp
	$(gcc) $< -O0 -S -o $@

$(target): $(objects)
	$(gcc) $< -o $@


clean:
	@rm -f $(objects) $(target) $(asm)


compile: $(target)


asm: $(asm)
	cat $(asm) | c++filt | vim -R +'set ft=asm' -


clang-format:
	find -iname '*.hpp' -o -iname '*.cpp' | xargs clang-format -i
