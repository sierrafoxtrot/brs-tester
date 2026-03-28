BIN=brs-tester

CFLAGS=-g -Wall -O3
CPPFLAGS =

CFILES=hal.c brs.c vector.c tests.c
HFILES=hal.h vector.h tests.h
OFILES=$(CFILES:.c=.o)
DEPFILES=$(OFILES:.o=.d)
LIBS=gpiod

RULES_DIR=/usr/lib/udev/rules.d
BIN_DIR=/usr/local/bin
LIB_DIR=/usr/local/lib

LDFLAGS =
LDLIBS=-L/usr/local/lib -l$(LIBS) -Wl,-rpath=$(LIB_DIR)

INIT=brs-init.sh
RULES=99-brs-tester-init.rules

all: $(BIN)

$(BIN): $(OFILES)
	$(CC) $(OFILES) -o $@ $(LDFLAGS) $(LDLIBS)

host: CPPFLAGS += -D__HOST
host: $(BIN)

%.o: %.c $(HFILES) Makefile
	$(CC) $(CPPFLAGS) $(CFLAGS) -MMD -MP -c $< -o $@

install: all
	install -m 0755 $(BIN) $(BIN_DIR)
	install -m 0755 $(INIT) $(BIN_DIR)
	install -m 0644 $(RULES) $(RULES_DIR)

clean:
	$(RM) $(BIN) $(OFILES) $(DEPFILES)

-include $(DEPFILES)
