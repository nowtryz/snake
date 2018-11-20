INCDIR = include src
ODIR=bin
LDIR=lib
SDIR=src

CC=gcc
CFLAGS= $(INCDIR:%=-I%) -Wall
LIBS=-lm

DEPS= $(wildcard *.h)
SRCS= $(wildcard ${SDIR}/*.c)
VENDORS= $(wildcard ${LDIR}/*.c)
BINS = $(SRCS:${SDIR}/%.c=%.o) $(VENDORS:${LDIR}/%.c=%.o)




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
	@echo SRC: ${SRCS}
	@echo VENDORS: ${VENDORS}
	@echo BINS: ${BINS}


clean:
	@echo "Cleaning binaries..."
	@rm -f $(ODIR)/*.o