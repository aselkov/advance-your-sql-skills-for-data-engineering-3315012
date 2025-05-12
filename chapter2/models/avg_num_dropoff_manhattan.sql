-- avg_num_dropoff_manhattan: Average number of passengers on all trips which end in Manhattan

{{ config(
    materialized='table'
) }}

SELECT AVG(passengers) AS avg
FROM {{ ref('taxi_trips') }}
WHERE dropoff_borough = 'Manhattan'