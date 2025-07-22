SELECT
    MAX(num) as num
FROM
    (
        SELECT
            num
        FROM
            MyNumbers
        GROUP BY
            num
        HAVING
            COUNT(*) = 1
    ) AS single_numbers;

-- Optimal Method
SELECT
    COALESCE(
        (
            SELECT
                num
            FROM
                MyNumbers
            GROUP BY
                num
            HAVING
                COUNT(*) = 1
            ORDER BY
                num DESC
            LIMIT
                1
        ), NULL
    ) AS num;