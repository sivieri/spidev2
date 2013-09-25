-module(spitest).
-export([test/0]).

test() ->
    spidev:setup(0, 32000000),
    case spidev:xfer([104,0]) of
        {ok, [A, B]} ->
            Res = ((A band 3) bsl 8) bor B,
            io:format("Result: ~p~n", [Res]);
        {error, Reason} ->
            io:format("Error: ~p~n", [Reason])
    end,
    spidev:close(0).
