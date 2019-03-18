dir ?= lambda
std ?= c++14
gcc := g++ -std=$(std)

define STR_HELP
Compile and run each case.

Examples
--------
$ make run
$ make run dir=lambda

endef

export STR_HELP

sources := $(wildcard $(dir)/*.cpp)
objects := $(patsubst %.cpp,%.o,$(sources))

.PHONY: help compile run clean

help:
	@echo "$$STR_HELP"
	@echo sources=$(sources)
	@echo objects=$(objects)
	@echo compiler=$(gcc)


%.o: %.cpp
	$(gcc) $< -c -o $@


$(dir)/%.out: $(objects)
	$(gcc) $< -o $@


clean:
	@rm -f $(objects)


compile: $(dir)/main.out


run: compile
	@$(dir)/main.out

