USE student_housing;
SELECT b.name         AS building,
	   ROUND(AVG(r.rent),2) AS avg_rent
FROM Rooms r
JOIN Buildings b
  ON r.building_id = b.building_id
GROUP BY b.building_id;