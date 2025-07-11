SELECT
    contest_id,
    ROUND(COUNT(r.user_id)/(SELECT COUNT(u2.user_id) FROM Users u2) * 100, 2) AS percentage
FROM
    Users u
    JOIN Register r
    ON r.user_id = u.user_id
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC