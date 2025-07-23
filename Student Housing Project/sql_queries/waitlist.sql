USE student_housing;
SELECT student_id,
	   name,
       email
FROM Students
WHERE student_id NOT IN (
   SELECT DISTINCT student_id
   FROM Contracts
);