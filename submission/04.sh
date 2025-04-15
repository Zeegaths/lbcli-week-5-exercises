# Create a CLTV script with a timestamp of 1495584032 and public key below:
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
#!/bin/bash

# Constants - our timestamp and public key hash
TIMESTAMP=1495584032  # This will be converted to little-endian
PUBKEY_HASH="1e51fcdc14be9a148bb0aaec9197eb47c83776fb"

# Convert timestamp to little-endian hex
TIMESTAMP_LE=$(printf "%08x" $TIMESTAMP | sed 's/\(..\)\(..\)\(..\)\(..\)/\4\3\2\1/')


SCRIPT="04${TIMESTAMP_LE}b17576a914${PUBKEY_HASH}88ac"

echo "$SCRIPT"