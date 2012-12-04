NAME := dotoify
SOURCES := $(NAME).c
OBJECTS := $(SOURCES:.c=.o)

CFLAGS := -Wall -O3 -std=c11
LDFLAGS = -static

.PHONY: all clean

all: $(NAME)

$(NAME): $(OBJECTS)
	$(CC) -o $@ $? $(LDFLAGS)

clean:
	@- $(RM) -v $(OBJECTS)
