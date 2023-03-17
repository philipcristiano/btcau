-module(btcau).

-export([xpub_to_address/2]).

xpub_to_address(Xpub, Derivation) ->
    K = hd_keys:import(Xpub),

    % Derive a child key
    ChildK = hd_keys:derive_child_key(K, Derivation),

    % Serialize the key
    ChildP = ecu_crypto:public_to_short(bitcoin, hd_keys:serialize_public_key(ChildK)),

    % Construct the encodable version
    ChildPre = <<0:8, ChildP/binary>>,

    %Encode public key address
    base58_utils:version_encode_check(ChildPre).
