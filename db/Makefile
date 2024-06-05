CC=g++
CFLAGS=-std=c++11 -c -g -Wall 
INCLUDE=-I../ -I${ROCKSDB_INCLUDE_PATH} -I$(HDR_INCLUDE_PATH)
SRC=$(wildcard *.cc)
OBJ=$(SRC:.cc=.o)

all: $(OBJ)

%.o: %.cc
	$(CC) $(CFLAGS) $(INCLUDE) $< -o $@ 

clean:
	$(RM) $(OBJ)

.PHONY: clean

