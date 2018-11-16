INCDIR =include
ODIR=bin
LDIR=lib
SDIR=src

CC=gcc
CFLAGS=-I$(INCDIR) -Wall
LIBS=-lm

INCDIR =include
ODIR=bin
LDIR=lib
SDIR=src

DEPS := $(wildcard ${INCDIR}/*.c)

SRCS := $(wildcard ${SDIR}/*.c)
VENDORS := $(wildcard ${LDIR}/*.c)
BINS := $(SRCS:${SDIR}/%.c=%.o) $(VENDORS:${LDIR}/%.c=%.o)




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
	@echo SRC: ${SRCS}
	@echo VENDORS: ${VENDORS}
	@echo SRC: ${BINS}


clean:
	@echo "Cleaning binaries..."
	@rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 