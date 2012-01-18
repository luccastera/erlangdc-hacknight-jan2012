# Super Simple PubSub Erlang Example

To run the code:

```make

make run
```

Then inside the erlang process:

```Hub = hub:start().

C1 = client:start(Hub).

C2 = client:start(Hub).

C3 = client:start(Hub).

C4 = client:start(Hub).

Hub ! list.

Hub ! {message, {hi, my, name, is, luc}}.

```

