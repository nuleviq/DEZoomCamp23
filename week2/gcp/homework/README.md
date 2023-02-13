## Week 2 Homework

## Question 1. Load January 2020 data
The goal of this homework is to familiarise users with workflow orchestration and observation. 

1. `prefect orion start`
2. Edit etl_web_to_gcs.py file to January, 2020.
3. Run `python gcp/etl_web_to_gcs_hw.py` from week2 folder

**Answer:** `447770`

## Question 2. Scheduling with Cron

1. Build and deploy workflow by running `prefect deployment build gcp/etl_web_to_gcs.py`
2. Apply `prefect deployment apply etl_web_to_gcs-deployment.yaml`
3. Using Prefect UI edit the schedule params using cron to `0 5 1 * *` 

**Answer:** `0 5 1 * *`


## Question 3. Loading data to BigQuery 

1. `prefect deployment build gcp/etl_gcs_to_bq_hw.py:etl_gcs_to_bq -n "ETL to BQ homework"`
2. `prefect agent start -q 'default'`
3. Run the Flow

**Answer:** `14851920`

## Question 4. Github Storage Block

1. cd to root repo
2. `prefect deployment build -n "github-flow" -sb github/github-flow week2/gcp/homework/etl_web_to_gcs_hw.py:etl_web_to_gcs --apply`
3. Run flow

**Answer:** `88605`

## Question 5. Email or Slack notifications

1. `prefect cloud login -k <API_TOKEN>
2. Create Blocks in UI and run Flow.

**Answer:** `514392`

## Question 6. Secrets

**Answer:** `8`


