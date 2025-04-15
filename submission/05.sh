# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
#!/bin/bash

# Constants
BLOCKS=150
PUBKEY_HASH="1e51fcdc14be9a148bb0aaec9197eb47c83776fb"

# Convert blocks to little-endian hex
# For 150 blocks, we need only 1 byte (as it's less than 256)
BLOCKS_LE=$(printf "%02x" $BLOCKS)

# Build the script:
# <blocks> OP_CHECKSEQUENCEVERIFY OP_DROP OP_DUP OP_HASH160 <pubKeyHash> OP_EQUALVERIFY OP_CHECKSIG

# Opcodes:
# 01 = OP_PUSHDATA (1 byte is enough for 150)
# b2 = OP_CHECKSEQUENCEVERIFY
# 75 = OP_DROP
# 76 = OP_DUP
# a9 = OP_HASH160
# 14 = OP_PUSHDATA (20 bytes)
# 88 = OP_EQUALVERIFY
# ac = OP_CHECKSIG

SCRIPT="01${BLOCKS_LE}b27576a914${PUBKEY_HASH}88ac"

echo "$SCRIPT"