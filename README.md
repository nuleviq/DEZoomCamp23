1. docker-compose up -d


2. inserting yellow_taxi_trips 

URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-01.csv.gz"
docker run -it \
  --network=dataengineering2_pgnetwork \
  taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pgdatabase \
    --port=5432 \
    --db=ny_taxi \
    --table_name=yellow_taxi_trips \
    --url=${URL}
	
3. inserting taxi_zone_lookup

URL="https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv"
docker run -it \
  --network=dataengineering2_pgnetwork \
  taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pgdatabase \
    --port=5432 \
    --db=ny_taxi \
    --table_name=taxi_zone_lookup \
    --url=${URL}