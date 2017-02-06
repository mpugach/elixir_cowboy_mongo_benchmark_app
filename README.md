# PerfExample

You may want to tune `Handler.Mongo#serialize_element`

```bash
export ERL_COMPILER_OPTIONS="[native,{hipe, [o3]}]" MIX_ENV="prod" MONGO_DB="my_db" MONGO_COLLECTION="my_collection"

mix deps.compile cowboy poison poolboy mongodb
mix compile

elixir --sname node1 --cookie secret_token -pa _build/prod/consolidated --no-halt -S mix run

# add `--erl "+A 15"` to change erlang Async Threads count

ab -n 10000 -c 4 http://127.0.0.1:8000/static
ab -n 10000 -c 4 http://127.0.0.1:8000/mongo

wrk -t20 -c100 -d15s http://127.0.0.1:8000/static
wrk -t20 -c100 -d15s http://127.0.0.1:8000/mongo
```
