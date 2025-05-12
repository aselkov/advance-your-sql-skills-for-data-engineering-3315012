-- over_nine_miles: All columns with taxi trip with distance over 9 miles

{{ config(
    materialized='table'
) }}

SELECT *
FROM {{ ref('taxi_trips') }}
WHERE distance > 9