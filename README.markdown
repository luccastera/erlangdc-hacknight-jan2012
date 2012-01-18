# Super Simple PubSub Erlang Example

To run the code:

```bash
  make
  make run
```

Then inside the erlang process:

```erlang
  Hub = hub:start().
  C1 = client:start(Hub).
  C2 = client:start(Hub).
  C3 = client:start(Hub).
  C4 = client:start(Hub).
  Hub ! list.
  Hub ! {message, {hi, my, name, is, luc}}.
```

See you all at the next hack night!

