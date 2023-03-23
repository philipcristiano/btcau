# btcau
Bitcoin Address Utilities for Erlang


## Usage

X, Y, or Z pubs can be used for any functions as the derivation must be explicitly passed through. There is not determination based on BIP standards for expected derivation.

A capital `M` must be used for the derivation.

No hardened address derivation is supported and should not be attempted. Do not use private keys with this library.

### x/y/x pub to p2sh

Addresses that start with 1

`btcau:pub_to_p2pkh(XPub, <<"M/...">>)`

### x/y/x pub to p2wpkh in p2sh

Addresses that start with 3

`btcau:pub_to_p2wpkh_in_p2sh(XPub, <<"M/...">>)`
