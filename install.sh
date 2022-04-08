#!/usr/bin/env bash

if [ "$SPIN" ]; then
  alias la='ls -alH'
  
  cat mydots/.gitconfig >> ~/.gitconfig
fi