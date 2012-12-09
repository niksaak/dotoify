NAME := dotoify
SOURCES := $(NAME).c
OBJECTS := $(SOURCES:.c=.o)

CFLAGS := -Wall -O0 -std=gnu11
LDFLAGS = -Wall # -static

.PHONY: all clean

all: $(NAME)

$(NAME): $(OBJECTS)
	$(CC) -o $@ $? $(LDFLAGS)

clean:
	@- $(RM) -v $(OBJECTS) $(OBJECTS2)
