"""
Table: Triangle

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.


Report for every three line segments whether they can form a triangle.

Return the result table in any order.

The result format is in the following example.
"""
-- Solution 1: Sử dụng IF thay vì CASE (ngắn gọn hơn)
SELECT
    x,
    y,
    z,
    IF(
        x + y > z
        AND y + z > x
        AND x + z > y,
        'Yes',
        'No'
    ) AS triangle
FROM
    Triangle;

-- Solution 2: Tối ưu logic với điều kiện ngắn gọn hơn
-- Chỉ cần kiểm tra tổng 2 cạnh nhỏ hơn > cạnh lớn nhất
SELECT
    x,
    y,
    z,
    IF(
        x + y > z
        AND y + z > x
        AND x + z > y,
        'Yes',
        'No'
    ) AS triangle
FROM
    Triangle;

-- Solution 3: Sử dụng GREATEST để tối ưu (nếu DB hỗ trợ)
SELECT
    x,
    y,
    z,
    IF(x + y + z > 2 * GREATEST(x, y, z), 'Yes', 'No') AS triangle
FROM
    Triangle;

-- Solution 4: Code gốc (chỉ format lại)
SELECT
    x,
    y,
    z,
    CASE
        WHEN x + y > z
        AND y + z > x
        AND x + z > y THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM
    Triangle;