-module(btcau_test).

-include_lib("eunit/include/eunit.hrl").

xpub_to_p2pkh_test_() ->
    Xpub1 =
        <<"xpub661MyMwAqRbcEnKbXcCqD2GT1di5zQxVqoHPAgHNe8dv5JP8gWmDproS6kFHJnLZd23tWevhdn4urGJ6b264DfTGKr8zjmYDjyDTi9U7iyT">>,

    [
        ?_assertEqual(
            <<"128RdrAkJDmqasgvfRf6MC5VcX4HKqH4mR">>, btcau:xpub_to_address(Xpub1, <<"M">>)
        ),
        ?_assertEqual(
            <<"1HadV3uWGLe8P6rrnCCxMvsttX2ovWbyEf">>, btcau:xpub_to_address(Xpub1, <<"M/44/0/1/0">>)
        )
    ].

pub_to_p2wpkh_in_p2sh_test_() ->
    % Xpub and Ypub that use the same key
    Xpub =
        <<"xpub6CvsQiiTuGmFZsck7uTS6cD1h2rJ4v3X2F6HRowuDKzui3Lba7ui8Grtswn7kFWbuC7hSuKJ3EGorfWcfC5yU68NbBkcAsjHcAXVqkVTQfJ">>,
    Ypub =
        <<"ypub6Xm8iPPP3xJjRAorxGF4JhJWrzzk1Y31wMcWDCqnbLNnm99ppn5GkLX2u9jhkAAXJqEWCNurVtdMjx8BNtVzGKoyTXT2knYmstb9EJG4noB">>,

    [
        ?_assertEqual(
            <<"33zo3SQ2dvqsx3Dfr6kiAxzgHnBjSXqNg3">>,
            btcau:pub_to_p2wpkh_in_p2sh(Xpub, <<"M/0/0">>)
        ),
        ?_assertEqual(
            <<"33zo3SQ2dvqsx3Dfr6kiAxzgHnBjSXqNg3">>,
            btcau:pub_to_p2wpkh_in_p2sh(Ypub, <<"M/0/0">>)
        ),
        ?_assertEqual(
            <<"38ZK7SvC4LvxgERgEzzsKYmVpUEY9ZbTwj">>,
            btcau:pub_to_p2wpkh_in_p2sh(Xpub, <<"M/1/0">>)
        ),
        ?_assertEqual(
            <<"38ZK7SvC4LvxgERgEzzsKYmVpUEY9ZbTwj">>,
            btcau:pub_to_p2wpkh_in_p2sh(Ypub, <<"M/1/0">>)
        )
    ].
