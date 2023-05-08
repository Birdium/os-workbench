include $(AM_HOME)/scripts/isa/x86_64.mk
include $(AM_HOME)/scripts/platform/qemu.mk

AM_SRCS := x86/qemu/start64.S \
           x86/qemu/trap64.S \
           x86/qemu/trm.c \
           x86/qemu/cte.c \
           x86/qemu/ioe.c \
           x86/qemu/vme.c \
           x86/qemu/mpe.c

run: build-arg
	@qemu-system-x86_64 $(QEMU_FLAGS)

.gdbinit: $(AM_HOME)/scripts/.gdbinit.tmpl-x86_64
    $(info $^)
    # sed "s/:1234/:$(GDBPORT)/" < $^ > $@

QEMU = qemu-system-x86_64
# try to generate a unique GDB port
GDBPORT = $(shell expr `id -u` % 5000 + 25000)
# QEMU's gdb stub command line changed in 0.11
QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
	then echo "-gdb tcp::$(GDBPORT)"; \
	else echo "-s -p $(GDBPORT)"; fi)

gdb: build-arg .gdbinit
	@qemu-system-x86_64 $(QEMU_FLAGS) -S $(QEMUGDB)
