SELECT emp.employee_id
FROM Employees emp
LEFT JOIN Employees mgr 
  ON emp.manager_id = mgr.employee_id
WHERE emp.salary < 30000 
  AND emp.manager_id IS NOT NULL 
  AND mgr.employee_id IS NULL
ORDER BY emp.employee_id;
