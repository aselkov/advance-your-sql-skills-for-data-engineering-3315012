-- credit_card_count: Breakdown of the count of fares paid by credit card.

{{ config(
    materialized='table'
) }}

SELECT payment,
    COUNT(fare) AS count
FROM {{ ref('taxi_trips') }}
WHERE payment = 'credit card'
GROUP BY payment