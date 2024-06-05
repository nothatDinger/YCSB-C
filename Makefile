export HDR_LIB_PATH=/home/td/HdrHistogram_c/build
export HDR_INCLUDE_PATH=/home/td/HdrHistogram_c/include
export ROCKSDB_INCLUDE_PATH=/home/td/rocksdb-6.10.1/include
export ROCKSDB_LIB_PATH=/home/td/rocksdb-6.10.1/

CC=g++
CFLAGS=-std=c++11 -g -Wall
LDFLAGS=-lhdr_histogram -L$(HDR_LIB_PATH) -lpthread -lrocksdb -L${ROCKSDB_LIB_PATH} -Wl,-rpath=${ROCKSDB_LIB_PATH} -Wl,-rpath=${HDR_LIB_PATH}
INCLUDE=-I. 
SUBDIRS= core db
SUBSRCS=$(wildcard core/*.cc) $(wildcard db/*.cc)
SRC=$(wildcard *.cc)
SUBOBJ=$(SUBSRCS:.cc=.o)
EXEC=ycsbc

all: $(SUBDIRS) $(EXEC)

$(SUBDIRS):
	make -C $@

$(EXEC): $(SUBOBJ) $(SRC)
	$(CC) $(INCLUDE)  $(CFLAGS)  $^ $(LDFLAGS)  -o $@ 

clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $@; \
	done
	$(RM) $(EXEC)

.PHONY: $(SUBDIRS) $(EXEC)
