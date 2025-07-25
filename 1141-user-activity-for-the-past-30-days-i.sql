# Write your MySQL query statement below
SELECT
    activity_date as day,
    count(DISTINCT user_id) as active_users
FROM Activity
WHERE
    activity_date <= '2019-07-27'
    AND activity_date >= '2019-06-28'
GROUP BY day;