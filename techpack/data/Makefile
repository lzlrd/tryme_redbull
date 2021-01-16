# SPDX-License-Identifier: GPL-2.0-only

ifeq ($(CONFIG_RMNET:M=m), m)
SUFFIX_RMNET:=-gki
else
SUFFIX_RMNET:=
endif

ifeq ($(CONFIG_ARCH_KONA), y)
include $(srctree)/techpack/data/config/konadata$(SUFFIX_RMNET).conf
endif

ifeq ($(CONFIG_ARCH_KONA), y)
LINUXINCLUDE	+= -include $(srctree)/techpack/data/config/konadata$(SUFFIX_RMNET).h
endif

ifeq ($(CONFIG_ARCH_LITO), y)
include $(srctree)/techpack/data/config/litodata$(SUFFIX_RMNET).conf
endif

ifeq ($(CONFIG_ARCH_LITO), y)
LINUXINCLUDE	+= -include $(srctree)/techpack/data/config/litodata$(SUFFIX_RMNET).h
endif

ifeq ($(CONFIG_ARCH_SM8150), y)
include $(srctree)/techpack/data/config/msmniledata$(SUFFIX_RMNET).conf
endif

ifeq ($(CONFIG_ARCH_SM8150), y)
LINUXINCLUDE	+= -include $(srctree)/techpack/data/config/msmniledata$(SUFFIX_RMNET).h
endif

obj-$(CONFIG_EMAC_DWC_EQOS) += emac-dwc-eqos/
obj-$(CONFIG_RMNET_PERF) += rmnet/perf/
obj-$(CONFIG_RMNET_SHS) += rmnet/shs/
