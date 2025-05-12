-- cross_borough: All columns with taxi trip start in one borough, but end up in another.

{{ config(
    materialized='table'
) }}

SELECT *
FROM {{ ref('taxi_trips') }}
WHERE pickup_borough != dropoff_borough