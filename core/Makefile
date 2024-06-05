CC=g++
CFLAGS=-std=c++11 -c -g -Wall
SOURCES=$(wildcard *.cc)
OBJECTS=$(SOURCES:.cc=.o)

all: $(SOURCES) $(OBJECTS)

$(OBJECTS): $(SOURCES)
	$(CC) $(CFLAGS)  -o $@ $<

clean:
	$(RM) $(OBJECTS)

.PHONY: $(OBJECTS) $(SOURCES)