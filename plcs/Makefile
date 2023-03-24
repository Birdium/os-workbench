NAME := $(shell basename $(PWD))
export MODULE := M2
all: $(NAME)-64 $(NAME)-32
LDFLAGS += -lpthread

$(NAME)-64-debug: $(DEPS) # 64bit binary
	gcc -m64 $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS) -DDEBUG 

run: all
	./plcs-64

debug: $(NAME)-64-debug
	./plcs-64-debug 1
	./plcs-64-debug 2
	./plcs-64-debug 3
	./plcs-64-debug 4

time: $(NAME)-64-debug
	/usr/bin/time ./plcs-64-debug 1
	/usr/bin/time ./plcs-64-debug 2
	/usr/bin/time ./plcs-64-debug 3
	/usr/bin/time ./plcs-64-debug 4

flame: $(NAME)-64-debug
	sudo perf record -g ./plcs-64-debug 1
	sudo perf script -f | stackcollapse-perf.pl | flamegraph.pl > perf.svg

include ../Makefile