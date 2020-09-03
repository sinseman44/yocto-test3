CC ?= gcc
CFLAGS ?= -fPIC -Wall -Wextra -O2
LDFLAGS ?=
EXEC=hello3
SRC_EXE=src/hello.c
OBJ_EXE=$(SRC_EXE:.c=.o)
PREFIX ?= /usr/local

.PHONY: all mrproper clean install

all: $(EXEC)

$(EXEC): $(OBJ_EXE)
	@$(CC) -o $@ $^ $(pkg-config --libs libworld) $(LDFLAGS)

%.o: %.c
	@$(CC) -o $@ -c $< $(CFLAGS) $(pkg-config --libs libworld)

clean:
	@rm -rf $(EXEC) src/*.o

mrproper: clean
	@rm -f $(EXEC)

install: $(EXEC)
	@install -d $(DESTDIR)$(PREFIX)/bin/
	@install -m 755 $(EXEC) $(DESTDIR)$(PREFIX)/bin/
