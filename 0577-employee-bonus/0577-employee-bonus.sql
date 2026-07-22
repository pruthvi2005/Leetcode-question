# Write your MySQL query statement below
select e.name , B.bonus 
from Employee as e
left join Bonus as B 
on e.empId = B.empId 
where B.bonus<1000 or B.bonus is null 
