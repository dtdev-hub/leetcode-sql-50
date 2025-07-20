-- Cách giải 1: Sử dụng GROUP BY và HAVING
SELECT
  e1.name
FROM
  Employee e1
  JOIN Employee e2 ON e1.id = e2.managerId
GROUP BY
  e1.id,
  e1.name
HAVING
  COUNT(e2.id) >= 5;

-- Cách giải 2: Sử dụng subquery với IN
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);

-- Cách giải 3: Sử dụng window function (nếu database hỗ trợ)
WITH ManagerCounts AS (
    SELECT managerId,
           COUNT(*) as direct_reports
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
)
SELECT e.name
FROM Employee e
JOIN ManagerCounts mc ON e.id = mc.managerId;