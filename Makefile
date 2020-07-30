TOOLS := /usr/bin
PREFIX := 
KDIR := /lib/modules/$(shell uname -r)/source
PWD := $(shell pwd)

# Comment/uncomment the following line to disable/enable debugging
DEBUG = y

# Add your debugging flag (or not) to CFLAGS
ifeq ($(DEBUG),y)  
	DEBFLAGS = -O -g -DSCULL_DEBUG # "-O" is needed to expand inlines
else  
	DEBFLAGS = -O2
endif

CFLAGS += $(DEBFLAGS)

obj-m :=  lcdi2c.o

all:
	$(MAKE) -C $(KDIR) \
		M=$(PWD) \
		ARCH=arm CROSS_COMPILE=$(TOOLS)/$(PREFIX) \
		modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

