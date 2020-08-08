#!/bin/sh

geth --networkid 57744 \
  --datadir ./ \
  --cache 512 \
  --port 30303 \
  --maxpeers 250  \
  # --ethstats 'bootnode:foo@46.101.118.81'
