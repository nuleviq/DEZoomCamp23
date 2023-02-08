```
docker-compose up -d
```

```
docker build -t taxi_ingest:v001 .
```

### Inserting yellow_taxi_trips 
```bash
URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-01.csv.gz"

sudo docker run -it \
  --network=docker_sql_pgnetwork \
  taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pgdatabase \
    --port=5432 \
    --db=ny_taxi \
    --table_name=yellow_taxi_trips \
    --url=${URL}
```
### Inserting taxi_zone_lookup after commenting lpep rows in ingest_data.py and rebuild.

```bash
URL="https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv"
sudo docker run -it \
  --network=docker_sql_pgnetwork \
  taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pgdatabase \
    --port=5432 \
    --db=ny_taxi \
    --table_name=taxi_zone_lookup \
    --url=${URL}
```
