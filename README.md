# PerfExample

```bash
MONGO_DB="my_db" MONGO_COLLECTION="my_collection" mix run --no-halt

ab -n 10000 -c 4 "http://127.0.0.1:8000/static"
ab -n 10000 -c 4 "http://127.0.0.1:8000/mongo"
```
