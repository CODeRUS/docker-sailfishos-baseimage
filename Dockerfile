FROM coderus/sailfishos-baseimage
MAINTAINER Andrey Kozhevnikov <coderusinbox@gmail.com>

ARG ARCH
ARG RELEASE

RUN mic \
	create fs \
	-v \
	-d \
	--arch=$ARCH \
	--outdir=/build \
	--tokenmap=ARCH:$ARCH,RELEASE:$RELEASE \
	--record-pkgs=url,name,license \
	--pack-to=@NAME@.tar.bz2 \
	baseimage.ks