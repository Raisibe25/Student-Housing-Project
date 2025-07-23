USE student_housing;
SELECT distinct
s.student_id,
s.name             AS student_name,
s.email,
r.room_number,
b.name             AS building_name
FROM Students      AS s
JOIN Contracts     AS c ON s.student_id = c.student_id
JOIN Rooms         AS r ON c.room_id    = r.room_id
JOIN Buildings     AS b ON r.building_id = b.building_id
WHERE b.name = 'Moshate Heights';
