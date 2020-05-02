obj-$(CONFIG_TOUCHSCREEN_FT5435) += ft5435_ts.o

ifeq ($(cc-name),clang)
CFLAGS_ft5435_ts.o := $(call cc-disable-warning, int-conversion)
endif

# for focaltech tp firmware power on upgrade
	#EXTRA_CFLAGS += -DFOCALTECH_PWRON_UPGRADE
	#EXTRA_CFLAGS += -DFOCALTECH_TP_GESTURE
	#EXTRA_CFLAGS += -DFOCALTECH_FAE_MOD
	#EXTRA_CFLAGS += -DFOCALTECH_FW_COMPAT
