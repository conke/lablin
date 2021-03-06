#!/bin/sh
#
# http://maxwit.googlecode.com
# 
#

./configure \
	--prefix=/usr \
	--build=${BUILD_PLAT} \
	--host=${TARGET_PLAT} \
	--with-sdl-exec-prefix=${ROOTFS_PATH}/usr \
	--disable-gl \
	|| exit 1

sed -i -e "/\#define gid_t int/d" -e "/\#define uid_t int/d" config.h
sed -i "s/png_[a-z_]*_NULL/NULL/g" src/SDL/i_sshot.c

make && make DESTDIR=${ROOTFS_PATH} install || exit 1
