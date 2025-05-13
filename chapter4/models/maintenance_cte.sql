-- maintenance_cte: Rewrite the maintenance model using CTEs to make the code cleaner and more readable

{{ config(materialized='view') }}

-- Create a CTE to filter excavator_ids based on conditions
WITH failing_excavators AS (
    SELECT excavator_id
        FROM {{ ref('excavators') }}
        WHERE oil_level != 'P'
            OR air_filter != 'P'
            OR coolant_level != 'P'
            OR hydraulic_valves != 'P'
)

-- Use the CTE in the main query
SELECT DISTINCT
    j.job_id,
    j.excavator_id
FROM {{ ref('jobs') }} j
    INNER JOIN failing_excavators fx ON fx.excavator_id = j.excavator_id
WHERE j.job_id in (398, 417, 401, 332, 329, 340, 366, 373, 376, 423)
