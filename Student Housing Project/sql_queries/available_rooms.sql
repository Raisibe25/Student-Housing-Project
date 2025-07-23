USE student_housing;
SELECT distinct
	   b.name   AS building,
	   r.room_number,
       r.capacity,
       r.rent
FROM Rooms r
JOIN Buildings b
  ON r.building_id = b.building_id
WHERE r.is_available = TRUE;