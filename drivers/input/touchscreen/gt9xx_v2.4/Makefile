#gt915 touchpanel driver

EXTRA_CFLAGS += $(call cc-disable-warning, date-time)

obj-$(CONFIG_TOUCHSCREEN_GT9XX_v24)		+= gt9xx.o
obj-$(CONFIG_TOUCHSCREEN_GT9XX_v24_UPDATE)	+= gt9xx_update.o
obj-$(CONFIG_TOUCHSCREEN_GT9XX_v24_TOOL)	+= goodix_tool.o

ifeq ($(cc-name),clang)
CFLAGS_gt9xx.o := $(call cc-disable-warning, int-conversion)
endif
