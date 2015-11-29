#!/bin/bash

# https://github.com/bitemyapp/learnhaskell/blob/master/install.md

sudo apt-get update
sudo apt-get install python-software-properties # v12.04 and below
sudo apt-get install software-properties-common # v12.10 and above
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install cabal-install-1.22 ghc-7.8.4 happy-1.19.5 alex-3.1.4

echo '
export PATH=~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.8.4/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.4/bin:$PATH
'
