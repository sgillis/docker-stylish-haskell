FROM haskell:7.10

RUN cabal update && cabal install stylish-haskell