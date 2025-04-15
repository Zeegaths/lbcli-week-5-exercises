# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
#!/bin/bash

# Constants
BLOCKS=150
PUBKEY_HASH="1e51fcdc14be9a148bb0aaec9197eb47c83776fb"

# Convert blocks to little-endian hex
# Looking at the expected output, we need to use 2 bytes (02 prefix)
# 150 in hex is 0x96, but in little-endian 2-byte format it's 0x9600
BLOCKS_LE="9600"  # 150 in little-endian format (0x96 followed by 0x00)

# Build the script:
# <blocks> OP_CHECKSEQUENCEVERIFY OP_DROP OP_DUP OP_HASH160 <pubKeyHash> OP_EQUALVERIFY OP_CHECKSIG

# 02 = Push 2 bytes onto the stack
# 9600 = 150 in little-endian format
# b2 = OP_CHECKSEQUENCEVERIFY
# 75 = OP_DROP
# 76 = OP_DUP
# a9 = OP_HASH160
# 14 = Push 20 bytes (pubkey hash)
# 1e51fcdc... = pubkey hash
# 88 = OP_EQUALVERIFY
# ac = OP_CHECKSIG

SCRIPT="02${BLOCKS_LE}b27576a914${PUBKEY_HASH}88ac"

echo "$SCRIPT"