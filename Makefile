# This Makefile assumes is for a Linux environment with git
# Tested on Ubuntu 16.04 LTS


# https://www.musl-libc.org/download.html
MUSL_VERSION?=1.1.20
# https://github.com/google/brotli/releases
BROTLI_VERSION?=1.0.5

BASE_DIR=$(shell pwd)
MUSL_DIR=${BASE_DIR}/musl-install


.PHONY: all
all: musl ${MUSL_DIR}/bin/musl-gcc brotli brotli-cli

musl:
	git clone git://git.musl-libc.org/musl -b v${MUSL_VERSION} --depth=1

# Build musl
${MUSL_DIR}/bin/musl-gcc: musl
	cd musl && git fetch && git checkout v${MUSL_VERSION} && ./configure --prefix=${MUSL_DIR} --disable-shared && $(MAKE) -j install

# Download brotli
brotli:
	git clone https://github.com/google/brotli -b v${BROTLI_VERSION} --depth=1

# Build brotli cli tool as a static executable
brotli-cli: brotli ${MUSL_DIR}/bin/musl-gcc
	cd brotli && git fetch && git checkout v${BROTLI_VERSION} && CC="${MUSL_DIR}/bin/musl-gcc -static" $(MAKE) -j brotli

# Clean up
.PHONY: clean
clean:
	rm -rf brotli musl ${MUSL_DIR}
