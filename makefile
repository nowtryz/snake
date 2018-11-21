INCDIR := include src lib
ODIR :=bin
LDIR :=lib
SDIR :=src

CC     :=gcc
CFLAGS := $(addprefix -I,$(INCDIR)) -Wall
LIBS   :=-lm

DEPS    := $(shell find ./ -type f -name '*.h')
SRCS    := $(shell find ${SDIR}/ -type f -name '*.c')
VENDORS := $(shell find ${LDIR}/ -type f -name '*.c')
BINS    := $(SRCS:${SDIR}/%.c=%.o) $(VENDORS:${LDIR}/%.c=%.o)




%.o: ${SDIR}/%.c $(DEPS)
	@echo "Source: Compiling $< to ${ODIR}/$@..."
	@${CC} -c -o $(ODIR)/$@ $< $(CFLAGS)

%.o: ${LDIR}/%.c $(DEPS)
	@echo "Librairy: Compiling $< to ${ODIR}/$@..."
	@${CC} -c -o $(ODIR)/$@ $< $(CFLAGS)

snake: $(BINS)
	@echo "Compiling $@..."
	@$(CC) -o $@ $(BINS:%.o=${ODIR}/%.o) $(CFLAGS) $(LIBS)

.PHONY: clean list

list:
	@echo INCDIR: ${INCDIR}
	@echo CFLAGS: ${CFLAGS}
	@echo DEPS:
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