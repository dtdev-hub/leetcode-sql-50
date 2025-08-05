SELECT
    ROUND(
        COUNT(DISTINCT a2.player_id) * 1.0 / COUNT(DISTINCT a1.player_id),
        2
    ) as fraction
FROM (
    -- Tìm ngày đăng nhập đầu tiên của mỗi người chơi
    SELECT
        player_id,
        MIN(event_date) as first_date
    FROM Activity
    GROUP BY player_id
) a1
LEFT JOIN Activity a2
ON a1.player_id = a2.player_id
AND DATEDIFF(a2.event_date, a1.first_date) = 1;