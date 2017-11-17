obj-m+=antelabs-clarona.o

# CFLAGS_antelabs-clarona.o :=
 
all:
	 make V=1 -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules
	  $(CC) test-antelabs-clarona.c -o test-antelabs-clarona
clean:
	 make V=1 -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean
	 rm -f test-antelabs-clarona
insert:
	sudo insmod antelabs-clarona.ko
remove:
	sudo rmmod antelabs_clarona
