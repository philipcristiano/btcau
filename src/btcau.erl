-module(btcau).

-export([pub_to_p2pkh/2, pub_to_p2wpkh_in_p2sh/2]).

pub_to_p2pkh(Xpub, Derivation) ->
    K = hd_keys:import(Xpub),

    % Derive a child key
    ChildK = hd_keys:derive_child_key(K, Derivation),

    % Serialize the key
    ChildP = hash_160(hd_keys:serialize_public_key(ChildK)),

    % Construct the encodable version
    ChildPre = <<0:8, ChildP/binary>>,

    %Encode public key address
    base58_utils:version_encode_check(ChildPre).

pub_to_p2wpkh_in_p2sh(Pub, Derivation) ->
    K = hd_keys:import(Pub),

    % Derive a child key
    ChildK = hd_keys:derive_child_key(K, Derivation),
    CompressedKey = hd_keys:serialize_public_key(ChildK),

    Hexs = ["00", "14"],
    ScriptSigPrefix = <<<<(list_to_integer(C, 16)):8>> || C <- Hexs>>,

    ScriptSigBody = hash_160(CompressedKey),
    ScriptSig = <<ScriptSigPrefix/binary, ScriptSigBody/binary>>,
    HashedScriptSig = hash_160(ScriptSig),

    AddreHexs = ["05"],
    AddrePrefix = <<<<(list_to_integer(C, 16)):8>> || C <- AddreHexs>>,

    UnencodedAddress = <<AddrePrefix/binary, HashedScriptSig/binary>>,

    base58_utils:version_encode_check(UnencodedAddress).

hash_160(Bin) when is_binary(Bin) ->
    crypto:hash(ripemd160, crypto:hash(sha256, Bin)).
