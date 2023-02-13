### Question 1. 
What is the count for fhv vehicle records for year 2019?

```
CREATE OR REPLACE EXTERNAL TABLE `arkh-375916.dezoomcamp.fhv`
OPTIONS (
  format = 'csv',
  uris = ['gs://prefect-de-zoomcamp23/data/data/fhv/*.csv.gz']
);

SELECT COUNT(*)
FROM `arkh-375916.dezoomcamp.fhv`;
```

**Answer:** `43244696`

### Question 2.
Write a query to count the distinct number of affiliated_base_number for the entire dataset on both the tables.
What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?

BQ Table:
```
SELECT
    COUNT(DISTINCT (affiliated_base_number))
  FROM
    `arkh-375916.dezoomcamp.fhv_non_partitioned`;
```

Bytes processed **2.52 GB**

External Table:
```
SELECT
    COUNT(DISTINCT (affiliated_base_number))
  FROM
    `arkh-375916.dezoomcamp.fhv`;
```

Bytes processed **317.94 MB**

**Answer:**: External table 317.94 MB, BQ table 2.52 GB

### Question 3
How many records have both a blank (null) PUlocationID and DOlocationID in the entire dataset?

```
SELECT
    COUNT(*)
  FROM
    `arkh-375916.dezoomcamp.fhv_non_partitioned`
  WHERE PUlocationID IS NOT NULL AND DOlocationID IS NOT NULL;
```

**Answer:** 717,748

### Question 4
What is the best strategy to optimize the table if query always filter by pickup_datetime and order by affiliated_base_number?

**Answer:** Partition by pickup_datetime Cluster on affiliated_base_number

### Question 5

Create partitioned and clustered table
```
CREATE OR REPLACE TABLE dezoomcamp.fhv_partitoned_clustered
PARTITION BY DATE(pickup_datetime)
CLUSTER BY affiliated_base_number AS
SELECT * FROM dezoomcamp.fhv_non_partitioned;
```

Select from non partitioned table
```
SELECT
  COUNT(DISTINCT(affiliated_base_number))
FROM
  `arkh-375916.dezoomcamp.fhv_non_partitioned`
WHERE pickup_datetime BETWEEN '2019-03-01' AND '2019-03-31';
```
Bytes processed **647.87 MB**

Select from partitioned clustered table
```
SELECT
  COUNT(DISTINCT(affiliated_base_number))
FROM
  `arkh-375916.dezoomcamp.fhv_partitoned_clustered`
WHERE pickup_datetime BETWEEN '2019-03-01' AND '2019-03-31';
```
Bytes processed **23.05 MB**

**Answer:** 647.87 MB for non-partitioned table and 23.06 MB for the partitioned table

### Question 6
Where is the data stored in the External Table you created?

**Answer:** GCP Bucket

### Question 7
**Answer:** False