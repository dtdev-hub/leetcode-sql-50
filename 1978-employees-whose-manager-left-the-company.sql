SELECT e1.employee_id
FROM Employees e1
WHERE e1.salary < 30000
  AND e1.manager_id IS NOT NULL
  AND NOT EXISTS (
      SELECT 1
      FROM Employees e2
      WHERE e2.employee_id = e1.manager_id
  )
ORDER BY e1.employee_id;