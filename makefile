INCDIR = include $(LDIR)
CC    :=gcc
CFLAGS = $(addprefix -I,$(INCDIR)) -Wall $(LIBS)
LIBS  :=-lm

ODIR :=bin
LDIR :=lib
SDIR :=src


DEPS    := $(shell find $(INCDIR:%=%/) -type f -name '*.h')
SRCS    := $(shell find ${SDIR}/ -type f -name '*.c')
VENDORS := $(shell find ${LDIR}/ -type f -name '*.c')
BINS    := $(SRCS:${SDIR}/%.c=%.o) $(VENDORS:${LDIR}/%.c=%.o)

vpath %.c $(SDIR) $(LDIR)
vpath %.o $(ODIR)
vpath %.h $(INCDIR)

%.o: %.c $(DEPS)
	@echo "Compiling $< to ${ODIR}/$@..."
	@mkdir -p $(ODIR)/$(@D)
	@${CC} -c -o $(ODIR)/$@ $< $(CFLAGS)

snake: $(BINS)
	@echo "Compiling $@..."
	@$(CC) -o $@ $(BINS:%.o=${ODIR}/%.o) $(CFLAGS) $(LIBS)

.PHONY: clean list

list:
	@echo INCDIR: ${INCDIR}
	@echo CFLAGS: ${CFLAGS}
	@echo DEPS: in $(INCDIR:%=%/)
	@printf " $(DEPS:%=  %\n)"
	@echo SRC:
	@printf " $(SRCS:%=  %\n)"
	@echo VENDORS:
	@printf " $(VENDORS:%=  %\n)"
	@echo BINS:
	@printf " $(BINS:%=  %\n)"


clean:
	@echo "Cleaning binaries..."
	@rm -f $(ODIR)/*.o