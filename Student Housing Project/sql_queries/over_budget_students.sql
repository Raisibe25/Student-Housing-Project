USE student_housing;
SELECT s.student_id,
       s.name,
       c.monthly_rent,
       s.max_budget
FROM Contracts c
JOIN Students s
  ON c.student_id = s.student_id
WHERE c.monthly_rent > s.max_budget;