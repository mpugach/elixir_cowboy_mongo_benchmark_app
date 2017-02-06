# PerfExample

```bash
MIX_ENV=prod mix compile
MONGO_DB="my_db" MONGO_COLLECTION="my_collection" elixir --sname node1 --cookie secret_token -pa _build/prod/consolidated -S mix run --no-halt

# You may want to tune Handler.Mongo#serialize_element

ab -n 10000 -c 4 http://127.0.0.1:8000/static
ab -n 10000 -c 4 http://127.0.0.1:8000/mongo

wrk -t20 -c100 -d15s http://127.0.0.1:8000/static
wrk -t20 -c100 -d15s http://127.0.0.1:8000/mongo
```
