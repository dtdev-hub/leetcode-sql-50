-- Original approach (using subquery)
SELECT
    machine_id,
    ROUND(AVG(running_time)::NUMERIC, 3) AS processing_time
FROM (
    SELECT
        machine_id,
        process_id,
        (MAX(CASE WHEN activity_type = 'end' THEN timestamp END) -
         MAX(CASE WHEN activity_type = 'start' THEN timestamp END))
        AS running_time
    FROM Activity
    GROUP BY machine_id, process_id
) AS temp_table
GROUP BY machine_id;

-- Alternative optimized approach (direct aggregation) (Fastest)
SELECT
    machine_id,
    ROUND((
        SUM(CASE WHEN activity_type = 'end' THEN timestamp ELSE 0 END) -
        SUM(CASE WHEN activity_type = 'start' THEN timestamp ELSE 0 END)
    )::NUMERIC / COUNT(DISTINCT process_id), 3) AS processing_time
FROM Activity
GROUP BY machine_id;