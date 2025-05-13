{{% test ensure_cohort_size_max_100 (model, column_name) %}}

SELECT column_name,
    COUNT(adid) AS cohort_size
FROM {{model}}
GROUP BY column_name
HAVING COUNT(adid) > 110

{{ % endtest %}}