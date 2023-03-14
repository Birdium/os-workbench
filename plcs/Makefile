NAME := $(shell basename $(PWD))
export MODULE := M2
all: $(NAME)-64 $(NAME)-32
LDFLAGS += -lpthread

$(NAME)-64-debug: $(DEPS) # 64bit binary
	gcc -m64 $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS) -DDEBUG

$(NAME)-64-single: $(DEPS) # 64bit binary
	gcc -m64 $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS) -DDEBUG -DSINGLE

run: all
	./plcs-64

debug: $(NAME)-64-debug $(NAME)-64-single
	time -v ./plcs-64-single
	time -v ./plcs-64-debug 1
	time -v ./plcs-64-debug 2
	time -v ./plcs-64-debug 4

include ../Makefile