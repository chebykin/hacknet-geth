#!/bin/sh

geth --networkid 57744 \
  --datadir ./ \
  --cache 512 \
  --port 30303 \
  --maxpeers 50  \
  # --ethstats 'sealer:foo@46.101.118.81' \
  # --bootnodes enode://b0d4225faed12955006ecafcb679d8aef6da6f55d35b862036f22e3f1a7a17ecbe4487c9ae71d2311a99daba1dca87c1e690c603a7dfa78fff9d233a850f47e6@46.101.100.212:30303 \
  --unlock 0 \
  --password ./signer.pass \
  --mine \
  --miner.gastarget 12500000 \
  --miner.gaslimit 12500000 \
  --miner.gasprice 1000000000
