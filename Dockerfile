FROM fpco/haskell-scratch

COPY bin/stylish-haskell /bin/stylish-haskell
COPY bin/libgmp.so.10 /usr/lib/x86_64-linux-gnu/libgmp.so.10
COPY bin/stylish-haskell.yaml /root/.cabal/share/x86_64-linux-ghc-7.10.1.20150710/stylish-haskell-0.5.14.1/data/stylish-haskell.yaml

ENTRYPOINT ["stylish-haskell"]
CMD ["file.hs"]