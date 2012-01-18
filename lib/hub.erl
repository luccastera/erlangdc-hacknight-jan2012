-module(hub).

-define(HUB, ?MODULE).

-export([start/0]).

start() -> spawn_link(fun init/0).

init() -> loop([]).

loop(Subscribers) ->
  receive
    list ->
      io:format("Subscribers: ~p~n", [Subscribers]),
      loop(Subscribers);
    {subscribe, Process} ->
      NewSubscribers = [Process] ++ Subscribers,
      io:format("Subscribers are now: ~p~n", [NewSubscribers]),
      Process ! ok,
      loop(NewSubscribers);
    {message, Msg} ->
      Forward = fun(Process) -> Process ! Msg end,
      lists:foreach(Forward, Subscribers),
      io:format("Received message: ~p~n", [Msg]),
      loop(Subscribers);
    Other ->
      io:format("Received other message.~p~n", [Other]),
      loop(Subscribers)
  end.

