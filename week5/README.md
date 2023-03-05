### Question 1:
Install Spark and PySpark

Install Spark
Run PySpark
Create a local spark session
Execute spark.version.
```
spark.version
```

**Answer:** '3.3.2'

### Question 2:
HVFHW June 2021

Read it with Spark using the same schema as we did in the lessons.
We will use this dataset for all the remaining questions.
Repartition it to 12 partitions and save it to parquet.
What is the average size of the Parquet (ending with .parquet extension) Files that were created (in MB)? Select the answer which most closely matches.

```
ls -lh fhvhv/2021/06
```
```
-rw-r--r-- 1 hawk hawk   0 Mar  5 21:44 _SUCCESS
-rw-r--r-- 1 hawk hawk 22M Mar  5 21:44 part-00000-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
-rw-r--r-- 1 hawk hawk 23M Mar  5 21:44 part-00001-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
-rw-r--r-- 1 hawk hawk 22M Mar  5 21:44 part-00002-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
-rw-r--r-- 1 hawk hawk 23M Mar  5 21:44 part-00003-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
-rw-r--r-- 1 hawk hawk 23M Mar  5 21:44 part-00004-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
-rw-r--r-- 1 hawk hawk 23M Mar  5 21:44 part-00005-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
-rw-r--r-- 1 hawk hawk 23M Mar  5 21:44 part-00006-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
-rw-r--r-- 1 hawk hawk 23M Mar  5 21:44 part-00007-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
-rw-r--r-- 1 hawk hawk 23M Mar  5 21:44 part-00008-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
-rw-r--r-- 1 hawk hawk 23M Mar  5 21:44 part-00009-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
-rw-r--r-- 1 hawk hawk 22M Mar  5 21:44 part-00010-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
-rw-r--r-- 1 hawk hawk 22M Mar  5 21:44 part-00011-caf41315-67ca-4891-b53b-63009ac1bfdb-c000.snappy.parquet
```

**Answer:** ~22.08 MB

### Question 3:
Count records

How many taxi trips were there on June 15?

Consider only trips that started on June 15.

**Answer:** 452470

### Question 4:
Longest trip for each day

Now calculate the duration for each trip.
How long was the longest trip in Hours?

```
spark.sql("""
SELECT ROUND(MAX(unix_timestamp(dropoff_datetime) - unix_timestamp(pickup_datetime)) / 3600 , 2) as longest_trip
FROM fhvhv_2021_06
""").show()
```

**Answer:** 66.88

### Question 5:
Spark’s User Interface which shows application's dashboard runs on which local port?

**Answer:** 4040

### Question 6:
Most frequent pickup location zone

Load the zone lookup data into a temp view in Spark
Zone Data
Using the zone lookup data and the fhvhv June 2021 data, what is the name of the most frequent pickup location zone?

```
spark.sql("""
    SELECT Zone
    FROM (
        SELECT PULocationID, count(*) as cnt
        FROM fhvhv_2021_06
        GROUP BY PULocationID
        ORDER BY 2 DESC
        LIMIT 1
    )
    JOIN zone_lookup
    ON LocationID = PULocationID  
"""
).show()
```

**Answer:** Crown Heights North