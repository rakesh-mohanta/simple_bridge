% vim: ts=4 sw=4 et
-module(simple_bridge_callout).
-include("simple_bridge.hrl").

-type data()                ::  iolist().
-type ws_data()             ::  {text, binary()} | {binary, binary()}.
-type reply()               ::  ws_data() | [ws_data()].
-type reason()              ::  integer().
-type full_reply()          ::  noreply
                                | {reply, reply()}
                                | close
                                | {close, reason()}.


-callback run(bridge())         -> {ok, data()}.

-callback ws_init(bridge())     -> ok 
                                 | close
                                 | {close, reason()}.

-callback ws_message(ws_data(), bridge()) -> full_reply().

-callback ws_info(ws_data(), bridge())    -> full_reply().

-callback ws_terminate(reason(), bridge())-> ok.