NAME := $(shell basename $(PWD))
export MODULE := M2
all: $(NAME)-64 $(NAME)-32
LDFLAGS += -lpthread

$(NAME)-64-debug: $(DEPS) # 64bit binary
	gcc -m64 $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS) -DDEBUG 

run: all
	./plcs-64

debug: $(NAME)-64-debug
	time ./plcs-64-debug 1
	time ./plcs-64-debug 2
	time ./plcs-64-debug 3
	time ./plcs-64-debug 4

include ../Makefile