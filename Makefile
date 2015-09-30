ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

buildimage:
	docker build -t stylish-haskell-build -f BuildDockerfile .

binary:
	docker run --rm \
		-v ${ROOT_DIR}/bin:/out \
		-it \
		stylish-haskell-build \
		/bin/sh -c """ \
		cp /root/.cabal/bin/stylish-haskell /out && \
		cp /usr/lib/x86_64-linux-gnu/libgmp.so.10 /out && \
    cp /root/.cabal/share/x86_64-linux-ghc-7.10.1.20150710/stylish-haskell-0.5.14.1/data/stylish-haskell.yaml /out \
		"""

runimage:
	docker build -t sgillis/stylish-haskell -f Dockerfile .

all: buildimage binary runimage
