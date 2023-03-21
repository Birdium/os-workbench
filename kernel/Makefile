export MODULE  := L1
NAME           := kernel
SRCS           := framework/main.c $(shell find -L ./src/ -name "*.c")
INC_PATH       := include/ framework/

export AM_HOME := $(PWD)/../abstract-machine
export TOKEN := AszQxQZP
ifeq ($(ARCH),)
export ARCH := x86_64-qemu
endif

include $(AM_HOME)/Makefile
include ../Makefile.lab
image: git

mrs: mrs.jpeg
	convert mrs.jpeg mrs.rgb
	xxd -i mrs.rgb > mrs.c
	rm mrs.rgb