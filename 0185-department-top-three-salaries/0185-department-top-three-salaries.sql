WITH RankedSalaries AS (
    SELECT d.name AS Department,
           e.name AS Employee,
           e.salary AS Salary,
           -- Use DENSE_RANK to handle identical salaries as the same rank
           DENSE_RANK() OVER (
               PARTITION BY e.departmentId 
               ORDER BY e.salary DESC
           ) AS salary_rank
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM RankedSalaries
WHERE salary_rank <= 3;
