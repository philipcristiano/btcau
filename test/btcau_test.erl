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
