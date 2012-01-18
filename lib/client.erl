-module(client).

-export([start/1, send_message/2]).

start(Hub) -> 
  Client = spawn_link(fun loop/0),
  Hub ! {subscribe, Client}.

loop() ->
  receive
    ok ->
      loop();
    terminate ->
      ok;
    Message ->
      io:format("~p: Received message: ~p~n", [self(), Message]),
      loop()
  end.

send_message(Hub, Msg) ->
  Hub ! {message, Msg}.



