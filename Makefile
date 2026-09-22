# Simple GBA build script
title := my_project

DEVKITARM ?= /opt/devkitpro/devkitARM
CC := $(DEVKITARM)/bin/arm-none-eabi-gcc
OBJCOPY := $(DEVKITARM)/bin/arm-none-eabi-objcopy
GBAFIX := /opt/devkitpro/tools/bin/gbafix

CFLAGS := -O2 -Wall -std=c11 -mthumb-interwork -marm
CFLAGS += -ffast-math -fomit-frame-pointer
CFLAGS += -I.
LDFLAGS := -specs=gba.specs -mthumb-interwork -marm -mlong-calls -lm

CFILES := $(wildcard *.c)
OFILES := $(CFILES:.c=.o)

.PHONY: all clean

all: $(title).gba

$(title).gba: $(title).elf
	$(OBJCOPY) -O binary $< $@
	$(GBAFIX) $@ -tBOBSBREAKOUT -cBOBE -m01

$(title).elf: $(OFILES)
	$(CC) $^ $(LDFLAGS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OFILES) $(title).elf $(title).gba
