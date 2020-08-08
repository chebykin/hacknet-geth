# hacknet-geth

--------
1. Create a new private key for validator identification using `geth account new`. It would be imported into your default chain, probably a mainnet. So remove it from mainned keystore after copying it to a sealer node.
2. Save the path from the output, it should have path like `/Users/myuser/Library/Ethereum/keystore/UTC--2020-08-08T14-14-40.202757000Z--bb43bce6d778428b00ae5e5031fd28b9ad582c77`
3. Generate genesis config using puppeth, provide the validator address from the step above
4. Export geneiss config from puppeth into json
5. Deploy ethstats (if needed) using puppeth


----
### Deploy a node (shared step):

Use the latest geth version downloaded from here https://geth.ethereum.org/downloads/
```
wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.9.18-f5382591.tar.gz
tar zxvf geth-linux-amd64-1.9.18-f5382591.tar.gz
mv ./geth-linux-amd64-1.9.18-f5382591/geth /usr/bin/geth
```

Create `ubuntu` user and cd into it's home folder

`adduser ubuntu
su ubuntu
cd
`

Clone `git clone https://github.com/chebykin/hacknet-geth`
cd into `hacknet-geth`
run init script `./init.sh`

-----
#### Deploy a Bootnode
run bootnode as `./run-bootnode.sh`
Copy it's id. It should look like 
```
INFO [08-08|14:38:42.968] Started P2P networking                   self=enode://0ff0072e33b1f6675739e1611fd79f5b9ef6da0262e1d4379af595a1692c3e0f40e210b5bc40d54e608f55be925d0b000aac22950b0e60e041f7fdb2478068fa@127.0.0.1:30303
```
Don't forget to replace 127.0.0.1 with the node actual IP address accessible from intenet, so it would look like:
```
enode://0ff0072e33b1f6675739e1611fd79f5b9ef6da0262e1d4379af595a1692c3e0f40e210b5bc40d54e608f55be925d0b000aac22950b0e60e041f7fdb2478068fa@139.59.133.174:30303
```


-----
#### Deploy a Sealer node

Copy generated json key file
```
cat /Users/myuser/Library/Ethereum/keystore/UTC--2020-08-08T14-14-40.202757000Z--bb43bce6d778428b00ae5e5031fd28b9ad582c77
```

Paset it on the sealer node

```
cat > keystore/UTC--2020-08-08T14-14-40.202757000Z--bb43bce6d778428b00ae5e5031fd28b9ad582c77
```

Save a password for the key file

```
cat > signer.pass
```

Update `run-sealer.sh` by replacing a default bootnode addres with actual one

----
